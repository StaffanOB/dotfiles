# Dotfiles

Personal Linux dotfiles for Vim, Tmux, and Bash. Clone the repository and run
`./setup.sh` to create the required symlinks in your home directory.

## Quick Start

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# Optional: create local secrets before setup
cp shell/env_secrets.example shell/env_secrets
vim shell/env_secrets

./setup.sh
```

`shell/env_secrets` is ignored by Git. When it exists, `setup.sh` links it to
`~/.env_secrets`.

## Structure

```text
dotfiles/
├── vim/              # Vim config
├── tmux/             # Tmux config
├── shell/            # Shell configs and secret template
├── alacritty/        # Alacritty config
└── setup.sh          # Symlink setup script
```

Repository files do not use dot prefixes; the setup script adds them to their
home-directory symlinks.

## Features

- Secure secret management without committing credentials
- Timestamped backups before replacing existing configurations
- Idempotent setup with a non-mutating `--dry-run`
- Vim plugin management through vim-plug
- Tmux keybindings and theme
- Bash prompt, aliases, and optional tool integrations

## Dependencies

### Required

- Bash 4.0+
- Vim 8.0+
- Tmux 2.0+
- Git
- Curl

### Optional

- Neovim
- fzf
- ripgrep and fd
- zoxide
- nvm

## Setup

Preview changes without modifying the filesystem:

```bash
./setup.sh --dry-run
```

Install required Debian or Ubuntu packages explicitly:

```bash
./setup.sh --install-deps
```

The script creates symlinks, backs up conflicting targets, and skips symlinks
that already point to the repository.

### Symlink Mapping

```text
vim/vimrc             -> ~/.vimrc
vim/                  -> ~/.vim/
tmux/tmux.conf        -> ~/.tmux.conf
tmux/                 -> ~/.tmux/
shell/bashrc          -> ~/.bashrc
shell/bash_aliases    -> ~/.bash_aliases
shell/profile         -> ~/.profile
shell/Xresources      -> ~/.Xresources
shell/env_secrets     -> ~/.env_secrets (when present)
```

## Secrets

Copy `shell/env_secrets.example` to the ignored `shell/env_secrets`, then add
only the credentials needed on that machine. The setup script links it to
`~/.env_secrets`, which Bash conditionally loads.

```bash
cp shell/env_secrets.example shell/env_secrets
vim shell/env_secrets
```

Never commit `shell/env_secrets`.

## Customization

- Vim: `vim/vimrc` and the `vim/vimrc_*` files
- Tmux: `tmux/tmux.conf` and `tmux/scripts/`
- Bash: `shell/bashrc`, `shell/bash_aliases`, and `shell/profile`
- X11: `shell/Xresources`
- Alacritty: `alacritty/alacritty.toml`

## Key Bindings

### Vim

- `<Space>`: leader key
- `<Space>v`: vertical split
- `<Space>s`: horizontal split
- `<Space>f`: file tree
- `Ctrl+h/j/k/l`: navigate splits and Tmux panes

### Tmux

- `Ctrl+Space`: prefix
- `Prefix + v`: vertical split
- `Prefix + s`: horizontal split
- `Prefix + r`: reload config
- `Alt+H/L`: switch windows

## Maintenance

```bash
# Update Vim plugins
vim +PlugUpdate +qall

# Update Tmux plugins
~/.tmux/plugins/tpm/bin/update_plugins all
```

After changing repository files:

```bash
git add .
git commit -m "Update configuration"
git push
```

## Troubleshooting

### Broken symlinks

Run `./setup.sh` again; it is idempotent and backs up conflicting targets.

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
