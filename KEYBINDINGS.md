# Dotfiles Keybinding Cheat Sheet

## Vim Keybindings

### Leader Key
- **Leader**: `Space`

### Standard Vim Keybindings (Not Overridden)

#### Basic Movement
| Keybinding | Mode   | Action                                      |
|------------|--------|---------------------------------------------|
| `h`        | Normal | Move left                                   |
| `j`        | Normal | Move down                                   |
| `k`        | Normal | Move up                                     |
| `l`        | Normal | Move right                                  |
| `w`        | Normal | Move to start of next word                  |
| `b`        | Normal | Move to start of previous word              |
| `e`        | Normal | Move to end of word                         |
| `0`        | Normal | Move to start of line                       |
| `^`        | Normal | Move to first non-blank character           |
| `$`        | Normal | Move to end of line                         |
| `gg`       | Normal | Go to first line                            |
| `G`        | Normal | Go to last line                             |
| `Ctrl+d`   | Normal | Scroll down half page                       |
| `Ctrl+u`   | Normal | Scroll up half page                         |
| `Ctrl+f`   | Normal | Scroll forward one page (overridden by FZF) |
| `Ctrl+b`   | Normal | Scroll backward one page                    |

#### Editing
| Keybinding | Mode   | Action                          |
|------------|--------|---------------------------------|
| `i`        | Normal | Enter insert mode before cursor |
| `a`        | Normal | Enter insert mode after cursor  |
| `I`        | Normal | Insert at beginning of line     |
| `A`        | Normal | Append at end of line           |
| `o`        | Normal | Open new line below             |
| `O`        | Normal | Open new line above             |
| `x`        | Normal | Delete character under cursor   |
| `dd`       | Normal | Delete line                     |
| `yy`       | Normal | Yank (copy) line                |
| `p`        | Normal | Paste after cursor              |
| `P`        | Normal | Paste before cursor             |
| `u`        | Normal | Undo                            |
| `Ctrl+r`   | Normal | Redo                            |
| `.`        | Normal | Repeat last command             |

#### Visual Mode
| Keybinding | Mode   | Action                        |
|------------|--------|-------------------------------|
| `v`        | Normal | Enter visual mode (character) |
| `V`        | Normal | Enter visual line mode        |
| `Ctrl+v`   | Normal | Enter visual block mode       |
| `>`        | Visual | Indent selection              |
| `<`        | Visual | Unindent selection            |
| `y`        | Visual | Yank selection                |
| `d`        | Visual | Delete selection              |

#### Search & Replace
| Keybinding      | Mode    | Action                            |
|-----------------|---------|-----------------------------------|
| `/pattern`      | Normal  | Search forward                    |
| `?pattern`      | Normal  | Search backward                   |
| `n`             | Normal  | Next search result                |
| `N`             | Normal  | Previous search result            |
| `*`             | Normal  | Search word under cursor forward  |
| `#`             | Normal  | Search word under cursor backward |
| `:s/old/new/g`  | Command | Replace in line                   |
| `:%s/old/new/g` | Command | Replace in file                   |

#### File Operations
| Keybinding    | Mode    | Action              |
|---------------|---------|---------------------|
| `:w`          | Command | Save file           |
| `:q`          | Command | Quit                |
| `:wq`         | Command | Save and quit       |
| `:q!`         | Command | Quit without saving |
| `:e filename` | Command | Edit file           |
| `<Space>v`    | Normal  | Reload current file |

### General Navigation & Windows (Custom)
| Keybinding     | Mode   | Action                        |
|----------------|--------|-------------------------------|
| **`<Space>v`** | Normal | **Vertical split**            |
| **`<Space>s`** | Normal | **Horizontal split**          |
| **`<Space>k`** | Normal | **Move to window above**      |
| **`<Space>j`** | Normal | **Move to window below**      |
| **`<Space>h`** | Normal | **Move to window left**       |
| **`<Space>l`** | Normal | **Move to window right**      |
| **`<Space>f`** | Normal | **Open file tree (30 cols)**  |
| **`//`**       | Normal | **Clear search highlighting** |

### Buffer Management (Custom)
| Keybinding     | Mode   | Action                    |
|----------------|--------|---------------------------|
| **`<Space>[`** | Normal | **Previous buffer**       |
| **`<Space>]`** | Normal | **Next buffer**           |
| **`<Space>x`** | Normal | **Close buffer**          |
| **`<Space>p`** | Normal | **Toggle to last buffer** |
| **`<Space>B`** | Normal | **FZF buffer list**       |

### Tab Management (Custom)
| Keybinding      | Mode          | Action           |
|-----------------|---------------|------------------|
| **`tt`**        | Normal        | **New tab**      |
| **`<M-Right>`** | Normal/Insert | **Next tab**     |
| **`<M-Left>`**  | Normal/Insert | **Previous tab** |

### Tmux Integration (vim-tmux-navigator) (Custom)
| Keybinding  | Mode   | Action                          |
|-------------|--------|---------------------------------|
| **`<C-h>`** | Normal | **Navigate left (Vim ↔ Tmux)**  |
| **`<C-j>`** | Normal | **Navigate down (Vim ↔ Tmux)**  |
| **`<C-k>`** | Normal | **Navigate up (Vim ↔ Tmux)**    |
| **`<C-l>`** | Normal | **Navigate right (Vim ↔ Tmux)** |
| **`<C-;>`** | Normal | **Navigate to previous pane**   |

### FZF Fuzzy Finder (Custom)
| Keybinding  | Mode   | Action                |
|-------------|--------|-----------------------|
| **`<C-f>`** | Normal | **Fuzzy file search** |

### CoC (Conquer of Completion) (Custom)
| Keybinding      | Mode          | Action                               |
|-----------------|---------------|--------------------------------------|
| **`<C-Space>`** | Insert        | **Trigger completion**               |
| **`<C-@>`**     | Insert        | **Trigger completion (alternative)** |
| **`<CR>`**      | Insert        | **Confirm completion**               |
| **`<C-s>`**     | Normal/Visual | **Range selection**                  |
| **`K`**         | Normal        | **Show documentation**               |
| **`[g`**        | Normal        | **Previous diagnostic**              |
| **`]g`**        | Normal        | **Next diagnostic**                  |
| **`gd`**        | Normal        | **Go to definition**                 |
| **`gy`**        | Normal        | **Go to type definition**            |
| **`gi`**        | Normal        | **Go to implementation**             |
| **`gr`**        | Normal        | **Go to references**                 |
| **`<Space>rn`** | Normal        | **Rename symbol**                    |
| **`<Space>f`**  | Normal/Visual | **Format selected code**             |
| **`<Space>a`**  | Normal/Visual | **Code action on selection**         |
| **`<Space>ac`** | Normal        | **Code action on buffer**            |
| **`<Space>qf`** | Normal        | **Quick fix current line**           |
| **`<Space>cl`** | Normal        | **Code lens action**                 |

### CoC Text Objects (Custom)
| Keybinding | Mode            | Action              |
|------------|-----------------|---------------------|
| **`if`**   | Visual/Operator | **Inner function**  |
| **`af`**   | Visual/Operator | **Around function** |
| **`ic`**   | Visual/Operator | **Inner class**     |
| **`ac`**   | Visual/Operator | **Around class**    |

### Tagbar (Custom)
| Keybinding     | Mode   | Action            |
|----------------|--------|-------------------|
| **`<Space>t`** | Normal | **Toggle tagbar** |

### UltiSnips (Custom)
| Keybinding     | Mode   | Action                       |
|----------------|--------|------------------------------|
| **`<Space>u`** | Normal | **Edit snippets**            |
| **`<S-Tab>`**  | Insert | **Expand snippet**           |
| **`<S-l>`**    | Insert | **Jump forward in snippet**  |
| **`<S-k>`**    | Insert | **Jump backward in snippet** |

### Terminal (Custom)
| Keybinding       | Mode              | Action                            |
|------------------|-------------------|-----------------------------------|
| **`<Space>ttv`** | Normal            | **Vertical terminal (80 cols)**   |
| **`<Space>tt`**  | Normal            | **Horizontal terminal (10 rows)** |
| **`<C-w> N`**    | Terminal          | **Enter normal mode**             |
| **`I`**          | Terminal (normal) | **Exit normal mode**              |

### Date/Time Insertion (Custom)
| Keybinding | Mode   | Action                                        |
|------------|--------|-----------------------------------------------|
| **`<F2>`** | Insert | **Insert date (e.g., "Monday, 12 Dec 2025")** |
| **`<F3>`** | Insert | **Insert time (hour:minute)**                 |
| **`<F4>`** | Insert | **Insert full timestamp**                     |

### Flashcards (Custom)
| Keybinding | Mode   | Action                      |
|------------|--------|-----------------------------|
| **`<F3>`** | Normal | **Launch flashcard viewer** |

### Vimspector (Debugging) (Custom)
| Keybinding      | Mode   | Action                  |
|-----------------|--------|-------------------------|
| **`<Space>dd`** | Normal | **Launch debugger**     |
| **`<Space>dx`** | Normal | **Reset debugger**      |
| **`<Space>de`** | Normal | **Evaluate expression** |
| **`<Space>dw`** | Normal | **Watch expression**    |
| **`<Space>do`** | Normal | **Show output**         |

---

## Tmux Keybindings

### Prefix Key
- **Prefix**: `Ctrl+Space` (replaces default `Ctrl+b`)
- **Send prefix to app**: `Ctrl+Space` twice

### Standard Tmux Keybindings (Not Overridden)

#### Session Management
| Keybinding | Action                               |
|------------|--------------------------------------|
| `Prefix $` | Rename current session               |
| `Prefix d` | Detach from session                  |
| `Prefix (` | Switch to previous session           |
| `Prefix )` | Switch to next session               |
| `Prefix s` | List sessions (overridden for split) |

#### Window Management (Standard)
| Keybinding   | Action                     |
|--------------|----------------------------|
| `Prefix c`   | Create new window          |
| `Prefix ,`   | Rename current window      |
| `Prefix &`   | Kill current window        |
| `Prefix n`   | Next window                |
| `Prefix p`   | Previous window            |
| `Prefix 0-9` | Switch to window by number |
| `Prefix w`   | List windows               |
| `Prefix f`   | Find window by name        |

#### Pane Management (Standard)
| Keybinding     | Action                                                  |
|----------------|---------------------------------------------------------|
| `Prefix %`     | Split vertically (default - prefer custom `Prefix v`)   |
| `Prefix "`     | Split horizontally (default - prefer custom `Prefix s`) |
| `Prefix x`     | Kill current pane                                       |
| `Prefix z`     | Toggle pane zoom                                        |
| `Prefix {`     | Swap pane with previous                                 |
| `Prefix }`     | Swap pane with next                                     |
| `Prefix o`     | Cycle through panes                                     |
| `Prefix q`     | Show pane numbers                                       |
| `Prefix !`     | Convert pane to window                                  |
| `Prefix Space` | Toggle pane layouts                                     |

#### Pane Resizing
| Keybinding               | Action            |
|--------------------------|-------------------|
| `Prefix :resize-pane -U` | Resize pane up    |
| `Prefix :resize-pane -D` | Resize pane down  |
| `Prefix :resize-pane -L` | Resize pane left  |
| `Prefix :resize-pane -R` | Resize pane right |

### Session & Config (Custom)
| Keybinding     | Action                 |
|----------------|------------------------|
| **`Prefix r`** | **Reload tmux config** |

### Window Management (Custom)
| Keybinding              | Action              |
|-------------------------|---------------------|
| **`M-H` (Alt+Shift+H)** | **Previous window** |
| **`M-L` (Alt+Shift+L)** | **Next window**     |

### Pane Management (Custom)
| Keybinding     | Action                                   |
|----------------|------------------------------------------|
| **`Prefix v`** | **Split vertically (in current path)**   |
| **`Prefix s`** | **Split horizontally (in current path)** |

### Tmux ↔ Vim Navigation (vim-tmux-navigator) (Custom)
These work seamlessly across Tmux panes and Vim splits:
| Keybinding  | Action             |
|-------------|--------------------|
| **`<C-h>`** | **Navigate left**  |
| **`<C-j>`** | **Navigate down**  |
| **`<C-k>`** | **Navigate up**    |
| **`<C-l>`** | **Navigate right** |

### Mouse Mode (Custom)
| Keybinding     | Action                 |
|----------------|------------------------|
| **`Prefix m`** | **Enable mouse mode**  |
| **`Prefix M`** | **Disable mouse mode** |

### Copy Mode (Vi-style) (Custom)
| Keybinding     | Mode   | Action                        |
|----------------|--------|-------------------------------|
| **`Prefix [`** | Normal | **Enter copy mode**           |
| **`v`**        | Copy   | **Begin selection**           |
| **`C-v`**      | Copy   | **Rectangle selection**       |
| **`y`**        | Copy   | **Yank and exit**             |
| **`Enter`**    | Copy   | **Copy to clipboard (xclip)** |

### Tmux Resurrect (Custom)
| Keybinding          | Action              |
|---------------------|---------------------|
| **`Prefix Ctrl+s`** | **Save session**    |
| **`Prefix Ctrl+r`** | **Restore session** |

### Custom Scripts (Custom)
| Keybinding     | Action                                         |
|----------------|------------------------------------------------|
| **`Prefix i`** | **Launch cht.sh (cheat sheet)**                |
| **`Prefix g`** | **Open GitHub Copilot (right pane, 1/3 width)** |

---

## Bash Keybindings

### Vi Mode
- **Mode**: Vi mode enabled (`set -o vi`)
- Use standard Vi keybindings in command line (ESC for normal mode)

### Standard Vi Mode Keybindings (Command Line)

#### Insert Mode (Default)
| Keybinding | Action                      |
|------------|-----------------------------|
| `Ctrl+a`   | Move to start of line       |
| `Ctrl+e`   | Move to end of line         |
| `Ctrl+w`   | Delete word backward        |
| `Ctrl+u`   | Delete from cursor to start |
| `Ctrl+k`   | Delete from cursor to end   |
| `Ctrl+r`   | Reverse search history      |
| `ESC`      | Enter vi normal mode        |

#### Vi Normal Mode (After ESC)
| Keybinding | Action                  |
|------------|-------------------------|
| `h`        | Move left               |
| `l`        | Move right              |
| `w`        | Move to next word       |
| `b`        | Move to previous word   |
| `0`        | Move to start of line   |
| `$`        | Move to end of line     |
| `i`        | Enter insert mode       |
| `a`        | Append after cursor     |
| `A`        | Append at end of line   |
| `dd`       | Delete line             |
| `dw`       | Delete word             |
| `u`        | Undo                    |
| `/`        | Search history forward  |
| `?`        | Search history backward |
| `n`        | Next search result      |
| `N`        | Previous search result  |

### Standard Bash Keybindings (Still Available)
| Keybinding | Action                             |
|------------|------------------------------------|
| `Ctrl+c`   | Cancel current command             |
| `Ctrl+z`   | Suspend current process            |
| `Ctrl+d`   | Exit shell (EOF)                   |
| `Tab`      | Auto-complete                      |
| `!!`       | Repeat last command                |
| `!$`       | Last argument of previous command  |
| `!^`       | First argument of previous command |
| `history`  | Show command history               |

### Custom Aliases - Git
| Alias    | Command                                                           |
|----------|-------------------------------------------------------------------|
| **`ga`** | **`git add .`**                                                   |
| **`gp`** | **`git pull`**                                                    |
| **`gs`** | **`git status`**                                                  |
| **`gl`** | **`git log --graph --abbrev-commit --decorate ...` (pretty log)** |

### Custom Aliases - Python/Virtualenv
| Alias     | Command                               |
|-----------|---------------------------------------|
| **`vm`**  | **`source ./.venv/bin/activate`**     |
| **`cvm`** | **`python3 -m venv .venv`**           |
| **`ivm`** | **`pip install -r requirements.txt`** |

### Custom Aliases - System
| Alias          | Command                                 |
|----------------|-----------------------------------------|
| **`l`**        | **`ls -lh`**                            |
| **`ll`**       | **`ls -AlF`**                           |
| **`mutt`**     | **`neomutt`**                           |
| **`tmux`**     | **`tmux -2` (256 colors)**              |
| **`inkscape`** | **`flatpak run org.inkscape.Inkscape`** |

### Custom Aliases - VPN
| Alias         | Command                                                        |
|---------------|----------------------------------------------------------------|
| **`vpn-htb`** | **`sudo openvpn --config $HOME/vpns/hack-the-box-start.ovpn`** |

### Custom Functions
| Function   | Usage    | Description                                           |
|------------|----------|-------------------------------------------------------|
| **`tm()`** | **`tm`** | **Create tmux session named after current directory** |


### **Overlapping Bindings (By Design)**

These keybindings intentionally overlap for consistency:

| Keybinding     | Vim              | Tmux             | Intentional?                |
|----------------|------------------|------------------|-----------------------------|
| `Ctrl+h/j/k/l` | Navigate splits  | Navigate panes   | ✅ Yes (vim-tmux-navigator) |
| `<Space>v`     | Vertical split   | -                | N/A                         |
| `<Space>s`     | Horizontal split | -                | N/A                         |
| `Prefix v`     | -                | Vertical split   | N/A                         |
| `Prefix s`     | -                | Horizontal split | N/A                         |

