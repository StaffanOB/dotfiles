# Complete Keybindings Reference
## Neovim + TMUX

**Last Updated:** January 28, 2026  
**Location:** ~/dotfiles/

---

## Table of Contents
1. [VimWiki Quick Start](#vimwiki-quick-start)
2. [TMUX Keybindings](#tmux-keybindings)
3. [Neovim: Core Navigation](#neovim-core-navigation)
4. [Neovim: File Operations](#neovim-file-operations)
5. [Neovim: Buffer Management](#neovim-buffer-management)
6. [Neovim: Window Management](#neovim-window-management)
7. [Neovim: Tab Management](#neovim-tab-management)
8. [Neovim: LSP & Code](#neovim-lsp--code)
9. [Neovim: Python Development](#neovim-python-development)
10. [Neovim: Databricks](#neovim-databricks)
11. [Neovim: Git Integration](#neovim-git-integration)
12. [Neovim: Search & Replace](#neovim-search--replace)
13. [Neovim: Editing](#neovim-editing)
14. [Neovim: Utilities](#neovim-utilities)
15. [Quick Reference Card](#quick-reference-card)

---

## VimWiki Quick Start

### 🚀 How to Start VimWiki

**Open your wiki index:**
```vim
# In Neovim, press:
<leader>ww
# (Space + w + w)
```

**Your wiki location:**
```
~/Documents/Notes/
```

### VimWiki Essential Commands

| Keybinding | Action |
|------------|--------|
| `<leader>ww` | Open wiki index (main page) |
| `<leader>wt` | Open wiki index in new tab |
| `<leader>ws` | Select wiki from list |
| `<leader>wd` | Delete current wiki page |
| `<leader>wr` | Rename current wiki page |
| `<Enter>` | Follow/create wiki link |
| `<Backspace>` | Go back to previous page |
| `<Tab>` | Go to next link |
| `<Shift-Tab>` | Go to previous link |
| `=` | Create header (toggle levels) |
| `-` | Remove header level |

### Creating Links

**Wiki links (creates .md files):**
```markdown
[[Link Text]]              - Creates/opens Notes/Link Text.md
[[Link Text|Display]]      - Custom display text
[[subdirectory/Page]]      - Nested pages
```

**External links:**
```markdown
[Display Text](https://url.com)    - Web link
[Display Text](file:///path)       - File link
```

### Common Workflows

**Daily notes:**
1. `<leader>ww` - Open wiki
2. Create link: `[[2026-01-28]]`
3. `<Enter>` - Creates today's note
4. Write notes in markdown
5. Save and exit

**Create new topic:**
1. In index, type: `[[New Topic]]`
2. `<Enter>` - Creates new page
3. Write content
4. `<Backspace>` - Return to index

**Organization:**
```markdown
# My Wiki Index

## Projects
- [[Project A]]
- [[Project B]]

## Notes
- [[Python Tips]]
- [[Databricks Guide]]

## Daily
- [[2026-01-28]]
```

---

## TMUX Keybindings

### Prefix Key
**Primary prefix:** `Ctrl-Space` (changed from default Ctrl-b)

**Send prefix to app:** `Ctrl-Space Ctrl-Space` (press twice)

---

### Session Management

| Keybinding | Action |
|------------|--------|
| `prefix + s` | List sessions |
| `prefix + $` | Rename session |
| `prefix + d` | Detach from session |
| `tmux attach` | Attach to last session (from shell) |
| `tmux new -s name` | Create named session (from shell) |

### Window Management

| Keybinding | Action |
|------------|--------|
| `prefix + c` | Create new window |
| `prefix + ,` | Rename current window |
| `prefix + &` | Kill current window |
| `prefix + w` | List windows |
| `prefix + 0-9` | Switch to window number |
| `Alt-H` | Previous window (no prefix!) |
| `Alt-L` | Next window (no prefix!) |

### Pane Management

| Keybinding | Action |
|------------|--------|
| `prefix + v` | Split pane vertically (current path) |
| `prefix + s` | Split pane horizontally (current path) |
| `prefix + x` | Kill current pane |
| `prefix + z` | Toggle pane zoom (fullscreen) |
| `prefix + {` | Move pane left |
| `prefix + }` | Move pane right |
| `prefix + o` | Cycle through panes |
| `prefix + q` | Show pane numbers |

### Pane Navigation (vim-tmux-navigator)

| Keybinding | Action |
|------------|--------|
| `Ctrl-h` | Move to left pane (or Neovim window) |
| `Ctrl-j` | Move to bottom pane (or Neovim window) |
| `Ctrl-k` | Move to top pane (or Neovim window) |
| `Ctrl-l` | Move to right pane (or Neovim window) |

**Note:** These work seamlessly between TMUX panes and Neovim windows!

### Pane Resizing

| Keybinding | Action |
|------------|--------|
| `Alt-r` | Enter resize mode |
| *In resize mode:* | |
| `h` or `←` | Resize left (repeatable) |
| `l` or `→` | Resize right (repeatable) |
| `j` or `↓` | Resize down (repeatable) |
| `k` or `↑` | Resize up (repeatable) |
| `q` or `Esc` | Exit resize mode |

### Copy Mode (Vi-mode)

| Keybinding | Action |
|------------|--------|
| `prefix + [` | Enter copy mode |
| `v` | Start selection (in copy mode) |
| `Ctrl-v` | Rectangle selection (in copy mode) |
| `y` | Copy selection (in copy mode) |
| `Enter` | Copy and exit (in copy mode) |
| `q` | Exit copy mode |
| `prefix + ]` | Paste |

### Mouse

| Keybinding | Action |
|------------|--------|
| `prefix + m` | Enable mouse mode |
| `prefix + M` | Disable mouse mode |

### Session Saving/Restoration

| Keybinding | Action |
|------------|--------|
| `prefix + Ctrl-s` | Save session (tmux-resurrect) |
| `prefix + Ctrl-r` | Restore session (tmux-resurrect) |

**Note:** Auto-saves enabled via tmux-continuum

### Misc TMUX

| Keybinding | Action |
|------------|--------|
| `prefix + r` | Reload tmux.conf |
| `prefix + g` | Open Gemini in side pane |
| `prefix + t` | Show time |
| `prefix + :` | Enter command mode |

---

## Neovim: Core Navigation

### Leader Key
**Leader:** `Space`

### Basic Movement

| Keybinding | Action |
|------------|--------|
| `h/j/k/l` | Left/Down/Up/Right |
| `w` | Next word |
| `b` | Previous word |
| `e` | End of word |
| `0` | Start of line |
| `^` | First non-blank character |
| `$` | End of line |
| `gg` | First line of file |
| `G` | Last line of file |
| `{number}G` | Go to line number |
| `%` | Jump to matching bracket |
| `Ctrl-u` | Scroll up half page |
| `Ctrl-d` | Scroll down half page |
| `Ctrl-b` | Scroll up full page |
| `Ctrl-f` | Scroll down full page |

### Enhanced Movement (LazyVim)

| Keybinding | Action |
|------------|--------|
| `j/k` | Down/Up (wraps in visual lines) |
| `gj/gk` | Force display line movement |

### Marks & Jumps

| Keybinding | Action |
|------------|--------|
| `m{a-z}` | Set mark |
| `'{a-z}` | Jump to mark |
| `Ctrl-o` | Jump to older position |
| `Ctrl-i` | Jump to newer position |
| `[j` / `]j` | Previous/next jump (mini.bracketed) |

---

## Neovim: File Operations

### Finding Files

| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files (Telescope/Snacks) |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Browse files |
| `<leader>fr` | Recent files |
| `<leader>fR` | Recent files (cwd) |
| `<leader>fn` | New file |

### File Explorer

| Keybinding | Action |
|------------|--------|
| `<leader>e` | Toggle file explorer (neo-tree) |
| `<leader>E` | File explorer (float) |

### File Operations

| Keybinding | Action |
|------------|--------|
| `<leader>r` | Reload current file |
| `Ctrl-s` | Save file (works in insert/normal) |
| `:w` | Save file (traditional) |
| `:q` | Quit |
| `:wq` or `ZZ` | Save and quit |
| `:q!` or `ZQ` | Quit without saving |

---

## Neovim: Buffer Management

### Buffer Navigation

| Keybinding | Action |
|------------|--------|
| `Shift-h` | Previous buffer ⭐ (LazyVim) |
| `Shift-l` | Next buffer ⭐ (LazyVim) |
| `[b` | Previous buffer (mini.bracketed) |
| `]b` | Next buffer (mini.bracketed) |
| `[B` | First buffer |
| `]B` | Last buffer |
| `<leader>p` | Toggle last buffer (custom) |
| `<leader>bb` | Switch to other buffer |
| `<leader>B` | List buffers (Telescope) |

### Buffer Management

| Keybinding | Action |
|------------|--------|
| `<leader>bd` | Delete buffer (smart) |
| `<leader>bo` | Delete other buffers |
| `<leader>bD` | Delete buffer and window |

---

## Neovim: Window Management

### Window Navigation

| Keybinding | Action |
|------------|--------|
| `Ctrl-h` | Go to left window ⭐ |
| `Ctrl-j` | Go to lower window ⭐ |
| `Ctrl-k` | Go to upper window ⭐ |
| `Ctrl-l` | Go to right window ⭐ |
| `<leader>h` | Go to left window (alt) |
| `<leader>j` | Go to lower window (alt) |
| `<leader>k` | Go to upper window (alt) |
| `<leader>l` | Go to right window (alt) |
| `[w` / `]w` | Previous/next window |

**Note:** `Ctrl-h/j/k/l` works seamlessly with TMUX panes!

### Window Splits

| Keybinding | Action |
|------------|--------|
| `<leader>v` | Vertical split ⭐ (custom) |
| `<leader>s` | Horizontal split ⭐ (custom) |
| `<leader>\|` | Vertical split (LazyVim) |
| `<leader>-` | Horizontal split (LazyVim) |

### Window Management

| Keybinding | Action |
|------------|--------|
| `<leader>wd` | Delete window |
| `<leader>wm` | Maximize/zoom window toggle |
| `Ctrl-w =` | Equal window sizes |
| `Ctrl-w _` | Maximize height |
| `Ctrl-w \|` | Maximize width |

### Window Resizing

| Keybinding | Action |
|------------|--------|
| `Ctrl-Up` | Increase height |
| `Ctrl-Down` | Decrease height |
| `Ctrl-Left` | Decrease width |
| `Ctrl-Right` | Increase width |

---

## Neovim: Tab Management

| Keybinding | Action |
|------------|--------|
| `<leader><tab><tab>` | New tab ⭐ |
| `<leader><tab>]` | Next tab |
| `<leader><tab>[` | Previous tab |
| `<leader><tab>d` | Close tab |
| `<leader><tab>f` | First tab |
| `<leader><tab>l` | Last tab |
| `<leader><tab>o` | Close other tabs |

---

## Neovim: LSP & Code

### Go To

| Keybinding | Action |
|------------|--------|
| `gd` | Go to definition ⭐ |
| `gD` | Go to declaration |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `K` | Show hover documentation ⭐ |
| `<leader>K` | Keywordprg |

### Code Actions

| Keybinding | Action |
|------------|--------|
| `<leader>ca` | Code action |
| `<leader>a` | Code action (custom) |
| `<leader>ac` | Code action current (custom) |
| `<leader>qf` | Quick fix (custom) |
| `<leader>cf` | Format buffer/selection ⭐ |
| `<leader>cr` | Rename symbol |
| `<leader>rn` | Rename symbol (custom) |

### Diagnostics

| Keybinding | Action |
|------------|--------|
| `]d` | Next diagnostic ⭐ |
| `[d` | Previous diagnostic ⭐ |
| `]g` | Next diagnostic (custom alias) |
| `[g` | Previous diagnostic (custom alias) |
| `]e` | Next error |
| `[e` | Previous error |
| `]w` | Next warning |
| `[w` | Previous warning |
| `<leader>cd` | Line diagnostics (float) |
| `<leader>ud` | Toggle diagnostics |

### Code Lens

| Keybinding | Action |
|------------|--------|
| `<leader>cl` | Run code lens |

---

## Neovim: Python Development

### Virtual Environment

| Keybinding | Action |
|------------|--------|
| `<leader>cv` | Select virtualenv ⭐ (Telescope UI) |
| `<leader>cV` | Select virtualenv (cached) |

### Testing (neotest)

| Keybinding | Action |
|------------|--------|
| `<leader>tt` | Run nearest test ⭐ |
| `<leader>tT` | Run all tests in file |
| `<leader>td` | Debug nearest test |
| `<leader>ts` | Toggle test summary ⭐ |
| `<leader>to` | Show test output |
| `<leader>tO` | Toggle test output panel |
| `<leader>tS` | Stop test |

### Debugging (DAP)

| Keybinding | Action |
|------------|--------|
| `<leader>db` | Toggle breakpoint ⭐ |
| `<leader>dB` | Breakpoint with condition |
| `<leader>dc` | Continue/Start |
| `<leader>dC` | Run to cursor |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | REPL toggle |
| `<leader>ds` | Session |
| `<leader>dt` | Terminate |
| `<leader>dw` | Widgets |
| `<leader>dpt` | Debug Python test method |

### Formatting & Linting

| Keybinding | Action |
|------------|--------|
| `<leader>cf` | Format code (black + isort) ⭐ |
| Auto on save | Enabled (conform.nvim) |
| Auto lint | Enabled (nvim-lint with ruff) |

---

## Neovim: Databricks

| Keybinding | Action |
|------------|--------|
| `<leader>dc` | Select cluster ⭐ |
| `<leader>dC` | Show current cluster |
| `<leader>dr` | Run current cell ⭐ |
| `<leader>dR` | Run entire file |
| `<leader>ds` | Run selection (visual mode) |
| `<leader>do` | Show last output |
| `<leader>dt` | Show table (VisiData) |
| `<leader>dn` | New notebook |
| `<leader>dS` | Sync notebook |

**Supported languages:** Python, Scala, SQL, R

---

## Neovim: Git Integration

### LazyGit

| Keybinding | Action |
|------------|--------|
| `<leader>gg` | Open LazyGit (root dir) ⭐ |
| `<leader>gG` | Open LazyGit (cwd) |

### Git Operations

| Keybinding | Action |
|------------|--------|
| `<leader>gb` | Git blame line ⭐ |
| `<leader>gB` | Git browse (open in browser) |
| `<leader>gY` | Git browse (copy URL) |
| `<leader>gf` | Git file history |
| `<leader>gl` | Git log (root) |
| `<leader>gL` | Git log (cwd) |

### Git Hunks (Gitsigns)

| Keybinding | Action |
|------------|--------|
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff this |
| `<leader>hD` | Diff this ~ |

---

## Neovim: Search & Replace

### Search

| Keybinding | Action |
|------------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |
| `//` | Clear search highlight ⭐ (custom) |
| `<Esc>` | Clear search (LazyVim) |
| `<leader>ur` | Redraw / clear hlsearch |

### Find & Replace

| Keybinding | Action |
|------------|--------|
| `<leader>sr` | Search & replace |
| `<leader>sg` | Grep (live) ⭐ |
| `<leader>sw` | Search word under cursor |
| `<leader>ss` | Search symbols |
| `<leader>sG` | Grep (cwd) |
| `:%s/old/new/g` | Replace in file (traditional) |
| `:%s/old/new/gc` | Replace with confirmation |

### Telescope/Snacks Pickers

| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files ⭐ |
| `<leader>fg` | Live grep ⭐ |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps |
| `<leader>fc` | Commands |
| `<leader>fC` | Command history |

---

## Neovim: Editing

### Insert Mode

| Keybinding | Action |
|------------|--------|
| `i` | Insert before cursor |
| `I` | Insert at line start |
| `a` | Insert after cursor |
| `A` | Insert at line end |
| `o` | Open line below |
| `O` | Open line above |
| `Esc` or `Ctrl-[` | Exit insert mode |

### Visual Mode

| Keybinding | Action |
|------------|--------|
| `v` | Visual character mode |
| `V` | Visual line mode |
| `Ctrl-v` | Visual block mode |
| `gv` | Reselect last selection |
| `o` | Move to other end of selection |

### Editing Operations

| Keybinding | Action |
|------------|--------|
| `x` | Delete character |
| `dd` | Delete line |
| `D` | Delete to end of line |
| `C` | Change to end of line |
| `cc` or `S` | Change entire line |
| `yy` | Yank (copy) line |
| `Y` | Yank to end of line |
| `p` | Paste after |
| `P` | Paste before |
| `u` | Undo |
| `Ctrl-r` | Redo |
| `.` | Repeat last command |

### Move Lines

| Keybinding | Action |
|------------|--------|
| `Alt-j` | Move line down ⭐ (normal/visual) |
| `Alt-k` | Move line up ⭐ (normal/visual) |

### Indenting

| Keybinding | Action |
|------------|--------|
| `>>` | Indent line |
| `<<` | Unindent line |
| `>` | Indent (visual mode, keeps selection) |
| `<` | Unindent (visual mode, keeps selection) |
| `=` | Auto-indent |

### Commenting

| Keybinding | Action |
|------------|--------|
| `gc{motion}` | Comment motion ⭐ |
| `gcc` | Comment line ⭐ |
| `gbc` | Block comment |
| `gco` | Add comment below |
| `gcO` | Add comment above |
| `gc` | Comment selection (visual) |

### Undo Break Points

| Keybinding | Action |
|------------|--------|
| `,` | Creates undo break point (insert mode) |
| `.` | Creates undo break point (insert mode) |
| `;` | Creates undo break point (insert mode) |

---

## Neovim: Utilities

### Snippets (LuaSnip)

| Keybinding | Action |
|------------|--------|
| `Shift-Tab` | Expand snippet / jump next ⭐ |
| `Shift-L` | Jump forward in snippet |
| `Shift-K` | Jump backward in snippet |
| `<leader>u` | Edit snippets |

### Tagbar

| Keybinding | Action |
|------------|--------|
| `<leader>t` | Toggle Tagbar ⭐ |

### Date/Time Insertion

| Keybinding | Action |
|------------|--------|
| `F2` | Insert date (insert mode) |
| `F3` | Insert time (insert mode) |
| `F4` | Insert datetime (insert mode) |

### Bracket Navigation (mini.bracketed)

| Keybinding | Action |
|------------|--------|
| `[b` / `]b` | Previous/next buffer |
| `[c` / `]c` | Previous/next comment |
| `[d` / `]d` | Previous/next diagnostic |
| `[f` / `]f` | Previous/next file |
| `[i` / `]i` | Previous/next indent |
| `[j` / `]j` | Previous/next jump |
| `[l` / `]l` | Previous/next location |
| `[q` / `]q` | Previous/next quickfix |
| `[t` / `]t` | Previous/next treesitter node |
| `[u` / `]u` | Previous/next undo state |
| `[w` / `]w` | Previous/next window |
| `[y` / `]y` | Previous/next yank |

Add `Shift` for first/last: `[B`, `]B`, `[Q`, `]Q`, etc.

### Quickfix & Location Lists

| Keybinding | Action |
|------------|--------|
| `<leader>xq` | Toggle quickfix list |
| `<leader>xl` | Toggle location list |
| `[q` / `]q` | Previous/next quickfix |
| `[l` / `]l` | Previous/next location |

### Terminal

| Keybinding | Action |
|------------|--------|
| `<leader>ft` | Terminal (root dir) ⭐ |
| `<leader>fT` | Terminal (cwd) |
| `Ctrl-/` | Toggle terminal ⭐ |
| `Ctrl-w N` | Normal mode in terminal |
| `i` or `a` | Return to terminal mode |

### UI Toggles

| Keybinding | Action |
|------------|--------|
| `<leader>uf` | Toggle format on save |
| `<leader>us` | Toggle spell check |
| `<leader>uw` | Toggle word wrap |
| `<leader>ul` | Toggle line numbers |
| `<leader>uL` | Toggle relative numbers |
| `<leader>ud` | Toggle diagnostics |
| `<leader>uc` | Toggle conceal level |
| `<leader>uh` | Toggle inlay hints |
| `<leader>uT` | Toggle treesitter |
| `<leader>ub` | Toggle dark/light background |
| `<leader>uz` | Toggle zen mode |
| `<leader>uZ` | Toggle zoom (maximize) |

### LazyVim Management

| Keybinding | Action |
|------------|--------|
| `<leader>l` | Open Lazy (plugin manager) ⭐ |
| `<leader>L` | LazyVim changelog |
| `<leader>qq` | Quit all |

### Inspect & Debug

| Keybinding | Action |
|------------|--------|
| `<leader>ui` | Inspect position |
| `<leader>uI` | Inspect tree |
| `:checkhealth` | Check Neovim health |
| `:LspInfo` | LSP information |
| `:Mason` | Mason (tool installer) |

---

## Quick Reference Card

### Most Used Keybindings ⭐

#### TMUX
- `Ctrl-Space` - Prefix
- `prefix + v` - Vertical split
- `prefix + s` - Horizontal split
- `Ctrl-h/j/k/l` - Navigate panes/windows
- `Alt-H/L` - Previous/next window
- `Alt-r` - Resize mode

#### Navigation
- `Ctrl-h/j/k/l` - Window navigation (TMUX aware!)
- `Shift-h/l` - Buffer navigation
- `<leader>ff` - Find files
- `<leader>fg` - Live grep

#### Files & Buffers
- `<leader>e` - File explorer
- `<leader>bd` - Delete buffer
- `Ctrl-s` - Save file
- `<leader>r` - Reload file

#### Code
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover docs
- `<leader>ca` - Code action
- `<leader>cf` - Format
- `<leader>cr` - Rename

#### Python
- `<leader>cv` - Select virtualenv
- `<leader>tt` - Run test
- `<leader>ts` - Test summary
- `<leader>db` - Toggle breakpoint

#### Databricks
- `<leader>dc` - Select cluster
- `<leader>dr` - Run cell
- `<leader>do` - Show output

#### Git
- `<leader>gg` - LazyGit
- `<leader>gb` - Git blame

#### Editing
- `gc` - Comment
- `Alt-j/k` - Move lines
- `Shift-Tab` - Expand snippet

#### VimWiki
- `<leader>ww` - Open wiki
- `Enter` - Follow link
- `Backspace` - Go back

---

## Tips & Tricks

### Discover More Keybindings
Press `<leader>` and wait - **which-key** will show you all available keybindings!

### TMUX + Neovim Integration
- `Ctrl-h/j/k/l` seamlessly navigates between TMUX panes and Neovim windows
- No need to think about whether you're in TMUX or Neovim!

### Learning Path
1. Start with: `Ctrl-h/j/k/l`, `<leader>ff`, `<leader>e`
2. Add: `Shift-h/l` for buffers, `gd`/`gr` for code navigation
3. Learn: Python testing (`<leader>tt`), Git (`<leader>gg`)
4. Master: Your specific workflow (Databricks, VimWiki, etc.)

### Help System
- `:help {topic}` - Neovim help
- `:WhichKey <leader>` - Show all leader keybindings
- `:Telescope keymaps` - Search all keybindings
- `:checkhealth` - Diagnose issues

---

## Configuration Files

- **Neovim:** `~/.config/nvim/lua/config/keymaps.lua`
- **TMUX:** `~/.tmux.conf` or `~/dotfiles/tmux/tmux.conf`
- **Plugin keybindings:** `~/.config/nvim/lua/plugins/*.lua`

---

## External Resources

- LazyVim: https://lazyvim.org
- Neovim: `:help` or https://neovim.io/doc
- TMUX: `man tmux` or https://github.com/tmux/tmux/wiki
- VimWiki: `:help vimwiki`

---

**Generated:** January 28, 2026  
**Location:** ~/dotfiles/KEYBINDINGS.md  
**Author:** Your friendly AI assistant 🤖
