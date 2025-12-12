# FZF Configuration

This directory contains fzf-related configuration files.

## Files

- `config.bash` - Main fzf configuration (options, commands, PATH setup)
- `key-bindings.bash` - fzf key bindings for bash (CTRL-T, CTRL-R, ALT-C)

**Note**: Tab completion (`completion.bash`) is sourced from the system package at `/usr/share/bash-completion/completions/fzf` and updates automatically with package updates.

## Installation

The setup script will:
1. Create `~/.config/fzf/` directory
2. Symlink `config.bash` to `~/.config/fzf/config.bash`
3. Symlink `key-bindings.bash` to `~/.config/fzf/key-bindings.bash`

Completion is sourced directly from `/usr/share/bash-completion/completions/fzf` (managed by package manager).

## Sourcing

The main `bashrc` sources the config file:
```bash
[ -f ~/.config/fzf/config.bash ] && source ~/.config/fzf/config.bash
```

Which in turn sources the key-bindings.

## Dependencies

- fzf binary (installed via package manager or git clone to ~/.fzf)
- Optional: `fd` or `ripgrep` for better file finding

## Key Bindings

- `CTRL-T` - Paste selected files/directories onto command line
- `CTRL-R` - Paste selected command from history
- `ALT-C` - cd into selected directory

## Tab Completion

Trigger fuzzy completion by typing `**` and pressing TAB:

```bash
vim **<TAB>        # Fuzzy find files
cd **<TAB>         # Fuzzy find directories
kill -9 **<TAB>    # Fuzzy find processes
ssh **<TAB>        # Fuzzy find from known hosts
```

Completion trigger can be customized with `FZF_COMPLETION_TRIGGER` (default: `**`)

## Customization

Edit `config.bash` to:
- Change FZF_DEFAULT_OPTS
- Set custom FZF_DEFAULT_COMMAND
- Configure file/directory exclusions
- Customize completion trigger: `export FZF_COMPLETION_TRIGGER='@@'`
- Override completion functions: `_fzf_compgen_path()` and `_fzf_compgen_dir()`
