# Dotfiles Keybinding Cheat Sheet

> Complete reference for all custom keybindings across Vim, Tmux, and Bash configurations.

---

## 🎯 Vim Keybindings

### Leader Key
- **Leader**: `Space`

### General Navigation & Windows
| Keybinding | Mode | Action |
|------------|------|--------|
| `<Space>v` | Normal | Vertical split |
| `<Space>s` | Normal | Horizontal split |
| `<Space>k` | Normal | Move to window above |
| `<Space>j` | Normal | Move to window below |
| `<Space>h` | Normal | Move to window left |
| `<Space>l` | Normal | Move to window right |
| `<Space>f` | Normal | Open file tree (30 cols) |
| `//` | Normal | Clear search highlighting |

### Buffer Management
| Keybinding | Mode | Action |
|------------|------|--------|
| `<Space>[` | Normal | Previous buffer |
| `<Space>]` | Normal | Next buffer |
| `<Space>x` | Normal | Close buffer |
| `<Space>p` | Normal | Toggle to last buffer |
| `<Space>B` | Normal | FZF buffer list |

### Tab Management
| Keybinding | Mode | Action |
|------------|------|--------|
| `tt` | Normal | New tab |
| `<M-Right>` | Normal/Insert | Next tab |
| `<M-Left>` | Normal/Insert | Previous tab |

### Tmux Integration (vim-tmux-navigator)
| Keybinding | Mode | Action |
|------------|------|--------|
| `<C-h>` | Normal | Navigate left (Vim ↔ Tmux) |
| `<C-j>` | Normal | Navigate down (Vim ↔ Tmux) |
| `<C-k>` | Normal | Navigate up (Vim ↔ Tmux) |
| `<C-l>` | Normal | Navigate right (Vim ↔ Tmux) |
| `<C-;>` | Normal | Navigate to previous pane |

### FZF Fuzzy Finder
| Keybinding | Mode | Action |
|------------|------|--------|
| `<C-f>` | Normal | Fuzzy file search |

### CoC (Conquer of Completion)
| Keybinding | Mode | Action |
|------------|------|--------|
| `<C-Space>` | Insert | Trigger completion |
| `<C-@>` | Insert | Trigger completion (alternative) |
| `<CR>` | Insert | Confirm completion |
| `<C-s>` | Normal/Visual | Range selection |
| `K` | Normal | Show documentation |
| `[g` | Normal | Previous diagnostic |
| `]g` | Normal | Next diagnostic |
| `gd` | Normal | Go to definition |
| `gy` | Normal | Go to type definition |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Go to references |
| `<Space>rn` | Normal | Rename symbol |
| `<Space>f` | Normal/Visual | Format selected code |
| `<Space>a` | Normal/Visual | Code action on selection |
| `<Space>ac` | Normal | Code action on buffer |
| `<Space>qf` | Normal | Quick fix current line |
| `<Space>cl` | Normal | Code lens action |

### CoC Text Objects
| Keybinding | Mode | Action |
|------------|------|--------|
| `if` | Visual/Operator | Inner function |
| `af` | Visual/Operator | Around function |
| `ic` | Visual/Operator | Inner class |
| `ac` | Visual/Operator | Around class |

### Tagbar
| Keybinding | Mode | Action |
|------------|------|--------|
| `<Space>t` | Normal | Toggle tagbar |

### UltiSnips
| Keybinding | Mode | Action |
|------------|------|--------|
| `<Space>u` | Normal | Edit snippets |
| `<S-Tab>` | Insert | Expand snippet |
| `<S-l>` | Insert | Jump forward in snippet |
| `<S-k>` | Insert | Jump backward in snippet |

### Terminal
| Keybinding | Mode | Action |
|------------|------|--------|
| `<Space>ttv` | Normal | Vertical terminal (80 cols) |
| `<Space>tt` | Normal | Horizontal terminal (10 rows) |
| `<C-w> N` | Terminal | Enter normal mode |
| `I` | Terminal (normal) | Exit normal mode |

### Date/Time Insertion
| Keybinding | Mode | Action |
|------------|------|--------|
| `<F2>` | Insert | Insert date (e.g., "Monday, 12 Dec 2025") |
| `<F3>` | Insert | Insert time (hour:minute) |
| `<F4>` | Insert | Insert full timestamp |

### Flashcards
| Keybinding | Mode | Action |
|------------|------|--------|
| `<F3>` | Normal | Launch flashcard viewer |

### Vimspector (Debugging)
| Keybinding | Mode | Action |
|------------|------|--------|
| `<Space>dd` | Normal | Launch debugger |
| `<Space>dx` | Normal | Reset debugger |
| `<Space>de` | Normal | Evaluate expression |
| `<Space>dw` | Normal | Watch expression |
| `<Space>do` | Normal | Show output |

---

## 🖥️ Tmux Keybindings

### Prefix Key
- **Prefix**: `Ctrl+Space` (replaces default `Ctrl+b`)
- **Send prefix to app**: `Ctrl+Space` twice

### Session & Config
| Keybinding | Action |
|------------|--------|
| `Prefix r` | Reload tmux config |

### Window Management
| Keybinding | Action |
|------------|--------|
| `M-H` (Alt+Shift+H) | Previous window |
| `M-L` (Alt+Shift+L) | Next window |

### Pane Management
| Keybinding | Action |
|------------|--------|
| `Prefix v` | Split vertically (in current path) |
| `Prefix s` | Split horizontally (in current path) |

### Tmux ↔ Vim Navigation (vim-tmux-navigator)
These work seamlessly across Tmux panes and Vim splits:
| Keybinding | Action |
|------------|--------|
| `<C-h>` | Navigate left |
| `<C-j>` | Navigate down |
| `<C-k>` | Navigate up |
| `<C-l>` | Navigate right |

### Mouse Mode
| Keybinding | Action |
|------------|--------|
| `Prefix m` | Enable mouse mode |
| `Prefix M` | Disable mouse mode |

### Copy Mode (Vi-style)
| Keybinding | Mode | Action |
|------------|------|--------|
| `Prefix [` | Normal | Enter copy mode |
| `v` | Copy | Begin selection |
| `C-v` | Copy | Rectangle selection |
| `y` | Copy | Yank and exit |
| `Enter` | Copy | Copy to clipboard (xclip) |

### Tmux Resurrect
| Keybinding | Action |
|------------|--------|
| `Prefix Ctrl+s` | Save session |
| `Prefix Ctrl+r` | Restore session |

### Custom Scripts
| Keybinding | Action |
|------------|--------|
| `Prefix i` | Launch cht.sh (cheat sheet) |

---

## 🐚 Bash Keybindings

### Vi Mode
- **Mode**: Vi mode enabled (`set -o vi`)
- Use standard Vi keybindings in command line (ESC for normal mode)

### Custom Aliases - Git
| Alias | Command |
|-------|---------|
| `ga` | `git add .` |
| `gp` | `git pull` |
| `gs` | `git status` |
| `gl` | `git log --graph --abbrev-commit --decorate ...` (pretty log) |

### Custom Aliases - Python/Virtualenv
| Alias | Command |
|-------|---------|
| `vm` | `source ./.venv/bin/activate` |
| `cvm` | `python3 -m venv .venv` |
| `ivm` | `pip install -r requirements.txt` |

### Custom Aliases - System
| Alias | Command |
|-------|---------|
| `l` | `ls -lh` |
| `ll` | `ls -AlF` |
| `mutt` | `neomutt` |
| `tmux` | `tmux -2` (256 colors) |
| `inkscape` | `flatpak run org.inkscape.Inkscape` |

### Custom Aliases - VPN
| Alias | Command |
|-------|---------|
| `vpn-htb` | `sudo openvpn --config $HOME/vpns/hack-the-box-start.ovpn` |

### Custom Functions
| Function | Usage | Description |
|----------|-------|-------------|
| `tm()` | `tm` | Create tmux session named after current directory |

---

## ⚠️ Potential Keybinding Conflicts

### Conflict Analysis

#### 🟢 **No Blocking Conflicts Detected**

All keybindings have been analyzed and none directly block each other. Here's why:

1. **Vim ↔ Tmux Integration**: 
   - Navigation keys (`Ctrl+h/j/k/l`) are **intentionally shared** via `vim-tmux-navigator` plugin
   - This is by design - they work seamlessly together, not in conflict

2. **Context-Specific Bindings**:
   - **Tmux prefix** (`Ctrl+Space`) only activates in Tmux, not in Vim
   - **Vim leader** (`Space`) only works in Vim normal mode
   - **Bash vi-mode** keybindings only affect the shell command line

3. **Insert Mode Conflicts** (Resolved):
   - `<F2>`, `<F3>`, `<F4>` in Vim insert mode for date/time insertion
   - `<F3>` in Vim normal mode for flashcards
   - These don't conflict because they use **different modes**

4. **Copy Mode Separation**:
   - Tmux copy mode uses vi-style keys (`v`, `y`)
   - Vim uses standard vi keys
   - No conflict because they operate in different contexts

### 🔵 **Overlapping Bindings (By Design)**

These keybindings intentionally overlap for consistency:

| Keybinding | Vim | Tmux | Intentional? |
|------------|-----|------|--------------|
| `Ctrl+h/j/k/l` | Navigate splits | Navigate panes | ✅ Yes (vim-tmux-navigator) |
| `<Space>v` | Vertical split | - | N/A |
| `<Space>s` | Horizontal split | - | N/A |
| `Prefix v` | - | Vertical split | N/A |
| `Prefix s` | - | Horizontal split | N/A |

**Note**: The split keybindings in Vim and Tmux are similar (`v`/`s`) but require different prefixes (Space vs Ctrl+Space), so they don't conflict.

### 📝 Recommendations

1. **Function Keys**: Consider if `F3` should be used for both flashcards (normal mode) and time insertion (insert mode). Currently safe but could be confusing.

2. **Alt+Left/Right**: Used in Vim for tab navigation. Some terminal emulators may intercept these keys.

3. **Ctrl+Space**: Used as Tmux prefix. Some terminal emulators or desktop environments may intercept this for input method switching.

---

## 🔧 Troubleshooting

### If Navigation Keys Don't Work

1. **Vim ↔ Tmux not working**: Ensure `vim-tmux-navigator` plugin is installed in both Vim and Tmux
2. **Terminal doesn't send Ctrl+key**: Check terminal settings for key pass-through
3. **Alt keys not working**: Terminal may need configuration to send Alt as Meta key

### If Prefix Keys Don't Work

1. **Ctrl+Space**: Some systems use this for input switching - check system keybindings
2. **Space in Vim**: Ensure you're in normal mode, not insert/visual mode

---

## 📚 Quick Reference Card

### Most Used Keybindings

**Vim Navigation**: `Space + h/j/k/l` (windows), `Space + [/]` (buffers)  
**Tmux Navigation**: `Alt+H/L` (windows), `Ctrl+h/j/k/l` (panes)  
**File Finding**: `Ctrl+f` (Vim fuzzy find)  
**Code Actions**: `Space + a` (code action), `gd` (go to definition)  
**Splits**: `Space+v/s` (Vim), `Prefix+v/s` (Tmux)

---

*Generated for dotfiles project - Last updated: 2025-12-12*
