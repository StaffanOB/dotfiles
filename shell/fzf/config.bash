# FZF configuration
# This file will be symlinked to ~/.config/fzf/config.bash

# Add fzf to PATH if installed via git
# -------------------------------------
if [[ -d "$HOME/.fzf/bin" ]] && [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
# Use system-installed completion (updated with package manager)
if [ -f /usr/share/bash-completion/completions/fzf ]; then
    source /usr/share/bash-completion/completions/fzf
fi

# Key bindings
# ------------
# CTRL-T: Paste files/directories, CTRL-R: History, ALT-C: cd into directory
[ -f "$HOME/.config/fzf/key-bindings.bash" ] && source "$HOME/.config/fzf/key-bindings.bash"

# Customize completion behavior
# export FZF_COMPLETION_TRIGGER='**'      # Default trigger
# export FZF_COMPLETION_OPTS=''           # Extra options for completion


# FZF options
export FZF_DEFAULT_OPTS='-m --height 50% --border'

# Use fd instead of find if available
if type fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,tmp} --type f"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type d"
elif type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
fi
