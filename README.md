# Dotfiles

Personal Linux dotfiles for Vim, Tmux, and Bash. Clone and run `./setup.sh` to automatically symlink all configurations to your home directory.

## Quick Start

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./setup.sh
```

After setup, copy the secrets template and add your API keys:
```bash
cp shell/env_secrets.example ~/.env_secrets
vim ~/.env_secrets  # Add your actual keys
```

## Structure

```
dotfiles/
├── vim/              # Vim config (vimrc → ~/.vimrc, vim/ → ~/.vim/)
├── tmux/             # Tmux config (tmux.conf → ~/.tmux.conf, tmux/ → ~/.tmux/)
├── shell/            # Shell configs (bashrc → ~/.bashrc, etc.)
├── scripts/          # Utility scripts
└── setup.sh         # Automated setup script
```

**Note:** Files in the repository do NOT have dot prefixes. The setup script adds dots when creating symlinks.

## Features

- 🔒 Secure secret management (API keys not committed)
- 🔄 Automatic backups before overwriting files
- ✅ Idempotent setup (safe to run multiple times)
- 📁 Clean repository structure (no hidden files)
- 🎨 Vim with plugin management (vim-plug)
- 🪟 Tmux with custom theme and keybindings
- 🐚 Bash with git-aware prompt and virtualenv support

## Dependencies

### Required
- Bash 4.0+
- Vim 8.0+ or Neovim
- Tmux 2.0+

### Optional (Enhanced Features)
- **fzf** - Fuzzy file finder
- **ripgrep/fd** - Fast file search
- **zoxide** - Smart directory jumping
- **nvm** - Node.js version manager

## Setup Script

Run with `--dry-run` to preview changes:
```bash
./setup.sh --dry-run
```

The script will:
1. Create symlinks from `$HOME` to dotfiles (adding dot prefixes)
2. Backup existing configurations with timestamps
3. Skip files that are already correctly symlinked

### Symlink Mapping
```
vim/vimrc           → ~/.vimrc
vim/vim/            → ~/.vim/
tmux/tmux.conf      → ~/.tmux.conf
tmux/tmux/          → ~/.tmux/
shell/bashrc        → ~/.bashrc
shell/bash_aliases  → ~/.bash_aliases
shell/profile       → ~/.profile
shell/Xresources    → ~/.Xresources
```

## Secrets Management

API keys and tokens are stored in `~/.env_secrets` (not tracked by git).

Copy the template:
```bash
cp shell/env_secrets.example ~/.env_secrets
```

Add your credentials:
```bash
export OPENAI_API_KEY="your-key-here"
export JIRA_API_TOKEN="your-token-here"
export SHELLGPT_API_KEY="your-key-here"
```

## Customization

### Vim
- Main config: `vim/vimrc`
- Plugin configs: `vim/vim/vimrc_*`

### Tmux
- Main config: `tmux/tmux.conf`
- Scripts: `tmux/tmux/scripts/`
- Theme: Uses custom fork `staffanob/tmux-onedark-theme-clean` (personal modification of OneDark theme)

### Shell
- Shell config: `shell/bashrc`
- Aliases: `shell/bash_aliases`
- Login shell: `shell/profile`
- X11 resources: `shell/Xresources`

## Key Bindings

### Vim
- `<Space>` - Leader key
- `<Space>v` - Vertical split
- `<Space>s` - Horizontal split
- `<Space>f` - File tree
- `Ctrl+h/j/k/l` - Navigate splits (works with Tmux)

### Tmux
- `Ctrl+Space` - Prefix key
- `Prefix + v` - Vertical split
- `Prefix + s` - Horizontal split
- `Prefix + r` - Reload config
- `Alt+H/L` - Switch windows
- `Ctrl+h/j/k/l` - Navigate panes (works with Vim)

## Maintenance

### Update Plugins
```bash
# Vim plugins
vim +PlugUpdate +qall

# Tmux plugins
~/.tmux/plugins/tpm/bin/update_plugins all
```

### Sync Changes
After modifying dotfiles in `~/dotfiles/`:
```bash
cd ~/dotfiles
git add .
git commit -m "Update configuration"
git push
```

### Fresh Install
On a new machine:
```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./setup.sh
cp shell/env_secrets.example ~/.env_secrets
# Edit ~/.env_secrets with your keys
source ~/.bashrc
```

## Troubleshooting

### Broken symlinks
Re-run the setup script:
```bash
./setup.sh
```

### Shell changes not taking effect
```bash
source ~/.bashrc
```

### Vim plugins not loading
```bash
vim +PlugInstall +qall
```

### Tmux plugins not loading
```bash
~/.tmux/plugins/tpm/bin/install_plugins
```

## File Naming Convention

**Important:** Repository files do NOT have dot prefixes to keep the repo clean and browsable:
- ✅ `vim/vimrc` (in repo) → `~/.vimrc` (symlink)
- ✅ `shell/bashrc` (in repo) → `~/.bashrc` (symlink)
- ✅ `tmux/tmux.conf` (in repo) → `~/.tmux.conf` (symlink)
- ❌ NOT `editor/.vimrc` or `vim/.vimrc`

## License

Personal use. Feel free to fork and adapt for your own setup.

## Features

- 🔒 Secure secret management (API keys not committed)
- 🔄 Automatic backups before overwriting files
- ✅ Idempotent setup (safe to run multiple times)
- 🎨 Vim with plugin management (vim-plug)
- 🪟 Tmux with custom theme and keybindings
- 🐚 Bash with git-aware prompt and virtualenv support

## Dependencies

### Required
- Bash 4.0+
- Vim 8.0+ or Neovim
- Tmux 2.0+

### Optional (Enhanced Features)
- **fzf** - Fuzzy file finder
- **ripgrep/fd** - Fast file search
- **zoxide** - Smart directory jumping
- **nvm** - Node.js version manager

## Setup Script

Run with `--dry-run` to preview changes:
```bash
./setup.sh --dry-run
```

The script will:
1. Create symlinks from your home directory to dotfiles
2. Backup existing configurations with timestamps
3. Skip files that are already correctly symlinked

## Secrets Management

API keys and tokens are stored in `~/.env_secrets` (not tracked by git).

Copy the template:
```bash
cp shell/.env_secrets.example ~/.env_secrets
```

Add your credentials:
```bash
export OPENAI_API_KEY="your-key-here"
export JIRA_API_TOKEN="your-token-here"
export SHELLGPT_API_KEY="your-key-here"
```

## Customization

### Vim
- Main config: `editor/.vimrc`
- Plugin configs: `editor/.vim/vimrc_*`

### Tmux
- Main config: `multiplexer/.tmux.conf`
- Scripts: `multiplexer/.tmux/scripts/`

### Bash
- Shell config: `shell/.bashrc`
- Aliases: `shell/.bash_aliases`
- Login shell: `shell/.profile`

## Key Bindings

### Vim
- `<Space>` - Leader key
- `<Space>v` - Vertical split
- `<Space>s` - Horizontal split
- `<Space>f` - File tree
- `Ctrl+h/j/k/l` - Navigate splits (works with Tmux)

### Tmux
- `Ctrl+Space` - Prefix key
- `Prefix + v` - Vertical split
- `Prefix + s` - Horizontal split
- `Prefix + r` - Reload config
- `Alt+H/L` - Switch windows
- `Ctrl+h/j/k/l` - Navigate panes (works with Vim)

## Maintenance

### Update Plugins
```bash
# Vim plugins
vim +PlugUpdate +qall

# Tmux plugins
~/.tmux/plugins/tpm/bin/update_plugins all
```

### Sync Changes
After modifying dotfiles in `~/dotfiles/`:
```bash
cd ~/dotfiles
git add .
git commit -m "Update configuration"
git push
```

### Fresh Install
On a new machine:
```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./setup.sh
cp shell/.env_secrets.example ~/.env_secrets
# Edit ~/.env_secrets with your keys
source ~/.bashrc
```

## Troubleshooting

### Broken symlinks
Re-run the setup script:
```bash
./setup.sh
```

### Shell changes not taking effect
```bash
source ~/.bashrc
```

### Vim plugins not loading
```bash
vim +PlugInstall +qall
```

### Tmux plugins not loading
```bash
~/.tmux/plugins/tpm/bin/install_plugins
```

## License

Personal use. Feel free to fork and adapt for your own setup.
