# GitHub Copilot Instructions for Dotfiles Project

## Project Overview
This is a personal dotfiles repository designed to centralize and manage Linux desktop configuration files. The goal is to have a single source of truth for all dotfiles that can be cloned to any Linux system and set up automatically with symlinks.

## Project Structure
```
dotfiles_clean/
├── vim/
│   ├── vimrc              # Vim config (symlinked to ~/.vimrc)
│   └── vim/               # Vim plugins and configs (symlinked to ~/.vim)
├── tmux/
│   ├── tmux.conf          # Tmux config (symlinked to ~/.tmux.conf)
│   └── tmux/              # Tmux plugins and scripts (symlinked to ~/.tmux)
├── shell/
│   ├── bashrc             # Bash config (symlinked to ~/.bashrc)
│   ├── bash_aliases       # Bash aliases (symlinked to ~/.bash_aliases)
│   ├── profile            # Login shell (symlinked to ~/.profile)
│   ├── Xresources         # X11 resources (symlinked to ~/.Xresources)
│   ├── env_secrets        # API keys (NOT committed, symlinked to ~/.env_secrets)
│   └── env_secrets.example # Template for secrets
├── scripts/               # Custom utility scripts
└── setup.sh              # Automated setup script
```

## Key Design Principles

### 1. Zero User Intervention
- `setup.sh` must run without requiring user input
- All file existence checks should be automatic
- Missing dependencies should fail gracefully
- Backups should be created automatically with timestamps

### 2. Portability
- **NEVER** use hard-coded usernames or paths
- Always use `$HOME` instead of `/home/username`
- Always use `~` or environment variables for paths
- Use relative paths from script directory when possible

### 3. No Hidden Files in Repository
- **IMPORTANT**: Repository files do NOT have dot prefixes
- Files are named without dots: `vimrc`, `bashrc`, `tmux.conf`
- Symlinks ADD the dot: `~/vimrc` links to `~/.vimrc`
- Directories in repo: `vim/`, `tmux/` → Symlinked as `~/.vim/`, `~/.tmux/`
- This keeps the repository clean and browsable

### 4. Security
- **NEVER** commit API keys, tokens, or secrets to git
- All secrets go in `env_secrets` (git-ignored, symlinked to `~/.env_secrets`)
- Always provide `.example` files as templates
- Use conditional sourcing: `[ -f file ] && source file`

### 5. Defensive Programming
- Check if files/directories exist before sourcing/using them
- Use conditional checks for optional dependencies (fzf, nvm, zoxide, etc.)
- Don't fail the entire setup if one optional component is missing
- Provide clear error messages with colors

## Code Standards

### Bash Scripts
```bash
# Good - Defensive checks
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
[ -f "$HOME/.env_secrets" ] && source "$HOME/.env_secrets"

# Bad - Will fail if file doesn't exist
source "$HOME/.fzf.bash"

# Good - Use $HOME
alias config='vim $HOME/.config/app.conf'

# Bad - Hard-coded username
alias config='vim /home/staffan/.config/app.conf'

# Good - Function for runtime evaluation
tm() {
    local name=$(basename "$PWD")
    tmux new -s "$name"
}

# Bad - Variable evaluated at shell init
name=$(basename "$PWD")
alias tm="tmux new -s $name"
```

### Vim Configuration
- Main config: `vim/vimrc` (not `vim/.vimrc`)
- Plugin configs: `vim/vim/vimrc_*` (sourced from main vimrc)
- Check for plugin existence before configuring
- Use proper autocmd syntax (no spaces before commas)

### Tmux Configuration
- Main config: `tmux/tmux.conf` (not `tmux/.tmux.conf`)
- Scripts go in: `tmux/tmux/scripts/`
- Keep keybindings consistent with vim where possible
- Check if external scripts exist before binding them

## Setup Script Requirements

### Must Have Features
1. **Backup System**: Create timestamped backups before overwriting
2. **Dry-run Mode**: `--dry-run` flag to preview changes
3. **Colored Output**: Green for success, yellow for warnings, red for errors
4. **Idempotent**: Can be run multiple times safely
5. **Symlink Detection**: Skip if correct symlink already exists
6. **Absolute Paths**: Always use absolute paths for symlinks
7. **Dot Prefix**: Add dot when creating symlinks (vimrc → ~/.vimrc)

### Setup Script Pattern
```bash
#!/usr/bin/env bash
set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

create_symlink() {
    local source="$1"
    local target="$2"
    
    # Check source exists
    # Check if target is already correct symlink
    # Backup existing files
    # Create symlink with ln -sf
}

# Example symlinks:
create_symlink "$SCRIPT_DIR/vim/vimrc" "$HOME/.vimrc"
create_symlink "$SCRIPT_DIR/shell/bashrc" "$HOME/.bashrc"
```

## File Organization Rules

### What Goes Where
- **vim/**: All vim/neovim configuration (no dot prefix on files)
- **tmux/**: All tmux configuration (no dot prefix on files)
- **shell/**: All bash/zsh shell configuration (no dot prefix on files)
- **scripts/**: Executable utility scripts
- Files in repo: `vimrc`, `bashrc`, `tmux.conf` (no dots)
- Symlinks: `~/.vimrc`, `~/.bashrc`, `~/.tmux.conf` (with dots)

### Naming Convention
**Repository files (no dots):**
- `vim/vimrc` → symlinked to `~/.vimrc`
- `vim/vim/` → symlinked to `~/.vim/`
- `tmux/tmux.conf` → symlinked to `~/.tmux.conf`
- `tmux/tmux/` → symlinked to `~/.tmux/`
- `shell/bashrc` → symlinked to `~/.bashrc`
- `shell/bash_aliases` → symlinked to `~/.bash_aliases`
- `shell/profile` → symlinked to `~/.profile`
- `shell/Xresources` → symlinked to `~/.Xresources`

## Git Workflow

### Always Gitignore
```gitignore
# Secrets
env_secrets
**/env_secrets

# Backups
*.backup
*.bak
.dotfiles_backup_*

# System files
.DS_Store
thumbs.db

# Vim runtime
*.swp
*.swo
*~
```

### Never Commit
- API keys or tokens (env_secrets file)
- Personal passwords
- System-specific configurations that won't work on other machines
- Large binary files

## Common Pitfalls to Avoid

1. **Don't** add dot prefixes to files in the repository
2. **Don't** use absolute paths in configs - use `$HOME`
3. **Don't** source files without checking existence
4. **Don't** assume dependencies are installed
5. **Don't** duplicate configuration blocks
6. **Don't** set variables globally if they need runtime evaluation
7. **Don't** forget to make scripts executable (`chmod +x`)
8. **Don't** reference old paths like `editor/` or `multiplexer/` (use `vim/` and `tmux/`)

## When Making Changes

### Adding New Dotfiles
1. Place in appropriate subdirectory WITHOUT dot prefix
2. Update `setup.sh` to symlink it WITH dot prefix
3. Add any secrets to `env_secrets.example`
4. Test with `--dry-run` first
5. Document any new dependencies

### Modifying Configs
1. Edit files in repository (vim/vimrc, shell/bashrc, etc.)
2. Keep changes minimal and purposeful
3. Test on a fresh shell/vim session
4. Ensure no hard-coded paths
5. Run syntax checks when possible

### Adding Dependencies
1. Add conditional checks - don't assume installed
2. Document in README how to install
3. Provide fallback behavior if missing
4. Consider adding to setup script if critical

## Testing Checklist

Before committing changes:
- [ ] Run `bash -n` on all bash scripts
- [ ] Test `setup.sh --dry-run`
- [ ] Test actual setup in clean environment
- [ ] Check no secrets are committed
- [ ] Verify no hard-coded paths
- [ ] Verify no dot prefixes on repository files
- [ ] Test on fresh shell session
- [ ] Confirm symlinks point to correct locations with dots

## Support Information

### Target Environment
- **OS**: Linux (Ubuntu/Debian-based primarily)
- **Shell**: Bash 4.0+
- **Editor**: Vim 8.0+ / Neovim
- **Multiplexer**: Tmux 2.0+

### Optional Dependencies
These enhance functionality but aren't required:
- fzf (fuzzy finder)
- ripgrep/fd (fast search)
- zoxide (smart cd)
- nvm (Node version manager)

## Example Tasks

### Add a new config file
"Add my i3 window manager config to the dotfiles"
- Create `i3/config` (no dot prefix)
- Update setup.sh: `create_symlink "$SCRIPT_DIR/i3/config" "$HOME/.config/i3/config"`

### Fix a broken symlink
"The tmux config isn't symlinking correctly"
- Check setup.sh references `tmux/tmux.conf` not `multiplexer/.tmux.conf`

### Add conditional dependency
"Make the bashrc handle missing fzf gracefully"
- Add: `[ -f /path/to/fzf ] && source /path/to/fzf`

### Security issue
"I accidentally committed a token"
- Move to env_secrets, add to gitignore, use git filter-branch to remove from history

## Remember
- Repository files have NO dot prefixes (vimrc, bashrc, tmux.conf)
- Symlinks DO have dot prefixes (~/.vimrc, ~/.bashrc, ~/.tmux.conf)
- This repo is meant to be **cloned and run immediately** on a fresh Linux install
- Every change should support: portability, automation, and zero user intervention

## Key Design Principles

### 1. Zero User Intervention
- `setup.sh` must run without requiring user input
- All file existence checks should be automatic
- Missing dependencies should fail gracefully
- Backups should be created automatically with timestamps

### 2. Portability
- **NEVER** use hard-coded usernames or paths
- Always use `$HOME` instead of `/home/username`
- Always use `~` or environment variables for paths
- Use relative paths from script directory when possible

### 3. Security
- **NEVER** commit API keys, tokens, or secrets to git
- All secrets go in `.env_secrets` (git-ignored)
- Always provide `.example` files as templates
- Use conditional sourcing: `[ -f file ] && source file`

### 4. Defensive Programming
- Check if files/directories exist before sourcing/using them
- Use conditional checks for optional dependencies (fzf, nvm, zoxide, etc.)
- Don't fail the entire setup if one optional component is missing
- Provide clear error messages with colors

## Code Standards

### Bash Scripts
```bash
# Good - Defensive checks
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
[ -f "$HOME/.env_secrets" ] && source "$HOME/.env_secrets"

# Bad - Will fail if file doesn't exist
source "$HOME/.fzf.bash"

# Good - Use $HOME
alias config='vim $HOME/.config/app.conf'

# Bad - Hard-coded username
alias config='vim /home/staffan/.config/app.conf'

# Good - Function for runtime evaluation
tm() {
    local name=$(basename "$PWD")
    tmux new -s "$name"
}

# Bad - Variable evaluated at shell init
name=$(basename "$PWD")
alias tm="tmux new -s $name"
```

### Vim Configuration
- Keep plugin configs in separate `vimrc_*` files under `.vim/`
- Source them from main `.vimrc`
- Check for plugin existence before configuring
- Use proper autocmd syntax (no spaces before commas)

### Tmux Configuration
- Use `~/.tmux/` for plugins and scripts
- Keep keybindings consistent with vim where possible
- Check if external scripts exist before binding them

## Setup Script Requirements

### Must Have Features
1. **Backup System**: Create timestamped backups before overwriting
2. **Dry-run Mode**: `--dry-run` flag to preview changes
3. **Colored Output**: Green for success, yellow for warnings, red for errors
4. **Idempotent**: Can be run multiple times safely
5. **Symlink Detection**: Skip if correct symlink already exists
6. **Absolute Paths**: Always use absolute paths for symlinks

### Setup Script Pattern
```bash
#!/usr/bin/env bash
set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

create_symlink() {
    local source="$1"
    local target="$2"
    
    # Check source exists
    # Check if target is already correct symlink
    # Backup existing files
    # Create symlink with ln -sf
}
```

## File Organization Rules

### What Goes Where
- **editor/**: All vim/neovim configuration
- **multiplexer/**: All tmux configuration
- **shell/**: All bash/zsh shell configuration
- **scripts/**: Executable utility scripts
- **resources/**: Wallpapers, themes, fonts, etc.

### Dotfile Naming
- Keep original dotfile names (`.bashrc`, `.vimrc`, etc.)
- Files in subdirectories maintain the `.` prefix
- When symlinked, they go to `$HOME` with same name

## Git Workflow

### Always Gitignore
```gitignore
# Secrets
.env_secrets
**/.env_secrets

# Backups
*.backup
*.bak
.dotfiles_backup_*

# System files
.DS_Store
thumbs.db

# Vim runtime
*.swp
*.swo
*~
```

### Never Commit
- API keys or tokens
- Personal passwords
- System-specific configurations that won't work on other machines
- Large binary files (use resources/ and document where to download)

## Common Pitfalls to Avoid

1. **Don't** use absolute paths in configs - use `$HOME`
2. **Don't** source files without checking existence
3. **Don't** assume dependencies are installed
4. **Don't** duplicate configuration blocks
5. **Don't** set variables globally if they need runtime evaluation
6. **Don't** use `source` when you can use conditionals
7. **Don't** forget to make scripts executable (`chmod +x`)

## When Making Changes

### Adding New Dotfiles
1. Place in appropriate subdirectory
2. Update `setup.sh` to symlink it
3. Add any secrets to `.env_secrets.example`
4. Test with `--dry-run` first
5. Document any new dependencies

### Modifying Configs
1. Keep changes minimal and purposeful
2. Test on a fresh shell/vim session
3. Ensure no hard-coded paths
4. Update comments if behavior changes
5. Run syntax checks when possible

### Adding Dependencies
1. Add conditional checks - don't assume installed
2. Document in README how to install
3. Provide fallback behavior if missing
4. Consider adding to setup script if critical

## Testing Checklist

Before committing changes:
- [ ] Run `bash -n` on all bash scripts
- [ ] Test `setup.sh --dry-run`
- [ ] Test actual setup in clean environment
- [ ] Check no secrets are committed
- [ ] Verify no hard-coded paths
- [ ] Test on fresh shell session
- [ ] Confirm symlinks point to correct locations

## Support Information

### Target Environment
- **OS**: Linux (Ubuntu/Debian-based primarily)
- **Shell**: Bash 4.0+
- **Editor**: Vim 8.0+ / Neovim
- **Multiplexer**: Tmux 2.0+

### Optional Dependencies
These enhance functionality but aren't required:
- fzf (fuzzy finder)
- ripgrep/fd (fast search)
- zoxide (smart cd)
- nvm (Node version manager)

## Example Tasks

### Add a new config file
"Add my i3 window manager config to the dotfiles and update setup.sh to symlink it"

### Fix a broken symlink
"The tmux config isn't symlinking correctly, fix the setup.sh script"

### Add conditional dependency
"Make the bashrc handle missing fzf gracefully without errors"

### Security issue
"I accidentally committed a token, help me remove it and set up proper secret management"

## Remember
This repo is meant to be **cloned and run immediately** on a fresh Linux install. Every change should support that goal: portability, automation, and zero user intervention.
