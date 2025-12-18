import os
import subprocess
import shlex
import sys

def read_project_file(file_path):
    """Reads a project extension file and returns its contents."""
    try:
        with open(file_path, 'r') as file:
            return file.read()
    except IOError as e:
        print(f"Error reading file '{file_path}': {e}")
        return None

def create_project_file(file_path):
    """Prompts the user to create a new project file."""
    print(f"No project file found at {file_path}")
    prompt = input("Would you like to create a default project file there? (y/n): ")
    if prompt.lower() == 'y':
        with open(file_path, 'w') as file:
            file.write("""
tmux new-window -n 'Main'
tmux split-window -v -p 50 -t 'Main'
tmux send-keys -t 'Main'.0 'ls -l' C-m
tmux send-keys -t 'Main'.1 'python3 main.py' C-m
""")
            print(f"Project file '{file_path}' created.")
    else:
        print("Project file creation aborted.")

def execute_project_commands(commands):
    """Execute a list of tmux commands."""
    for command in commands:
        if not command:
            continue
        try:
            # Use shlex.split to safely split the command into arguments
            # This avoids the need for shell=True, making it more secure.
            subprocess.run(shlex.split(command), check=True, text=True, capture_output=True)
        except subprocess.CalledProcessError as e:
            print(f"Error executing command '{command}': {e}")
            print(f"Stderr: {e.stderr}")
        except FileNotFoundError:
            print(f"Error: Command not found in '{command}'. Make sure tmux is installed and in your PATH.")


def save_layout(file_path):
    """Saves the current tmux layout to the specified project file."""
    try:
        # Get window info: name and layout
        windows_info_str = subprocess.check_output(
            shlex.split("tmux list-windows -F '#{window_name}|#{window_layout}'")
        ).decode('utf-8')
        windows_info = [line.split('|') for line in windows_info_str.strip().split('\n')]

        all_panes_info_str = subprocess.check_output(
            shlex.split("tmux list-panes -a -F '#{window_name}|#{pane_current_path}|#{pane_current_command}|#{pane_index}'")
        ).decode('utf-8')
        all_panes_info = [line.split('|') for line in all_panes_info_str.strip().split('\n')]

        panes_by_window = {}
        for win_name, path, cmd, pane_idx in all_panes_info:
            if win_name not in panes_by_window:
                panes_by_window[win_name] = []
            panes_by_window[win_name].append({'path': path, 'command': cmd, 'index': int(pane_idx)})

        commands = []
        is_first_window = True

        for window_name, layout in windows_info:
            panes = sorted(panes_by_window.get(window_name, []), key=lambda p: p['index'])
            if not panes:
                continue

            if is_first_window:
                commands.append(f"tmux rename-window '{window_name}'")
                is_first_window = False
            else:
                commands.append(f"tmux new-window -n '{window_name}'")

            for i in range(1, len(panes)):
                commands.append(f"tmux split-window -t '{window_name}'")

            commands.append(f"tmux select-layout -t '{window_name}' '{layout}'")

            for pane in panes:
                target = f"'{window_name}'.{pane['index']}"
                cd_cmd = f"cd {pane['path']}"
                commands.append(f"tmux send-keys -t {target} '{cd_cmd}' C-m")

                if pane['command'] and pane['command'].lower() not in ['bash', 'zsh', 'fish', 'sh', 'ash']:
                    run_cmd = pane['command'].replace("'", "'\\''")
                    commands.append(f"tmux send-keys -t {target} '{run_cmd}' C-m")

        with open(file_path, 'w') as f:
            f.write('\n'.join(commands))

        print(f"Tmux layout saved to {file_path}")

    except (subprocess.CalledProcessError, FileNotFoundError):
        print("Error: Could not get tmux info. Make sure you are in a tmux session.")


def main():
    is_save_command = len(sys.argv) > 1 and sys.argv[1] == 'save'
    
    path_arg_index = 2 if is_save_command else 1
    
    if len(sys.argv) > path_arg_index:
        project_dir = sys.argv[path_arg_index]
    else:
        project_dir = os.getcwd()

    project_file_path = os.path.join(project_dir, '.project')

    if is_save_command:
        save_layout(project_file_path)
        return

    if os.path.exists(project_file_path):
        project_contents = read_project_file(project_file_path)
        if project_contents:
            commands = [line.strip() for line in project_contents.splitlines()]
            execute_project_commands(commands)
    else:
        create_project_file(project_file_path)

if __name__ == "__main__":
    main()