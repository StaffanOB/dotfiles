#!/usr/bin/env bash

# Dotfiles setup script
# Creates symlinks from home directory to dotfiles

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Dry run flag
DRY_RUN=false
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
    echo -e "${YELLOW}Running in DRY RUN mode - no changes will be made${NC}\n"
fi

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [[ ! -e "$source" ]]; then
        echo -e "${RED}✗ Source does not exist: $source${NC}"
        return 1
    fi
    
    # Check if target already exists
    if [[ -L "$target" ]]; then
        local current_link="$(readlink "$target")"
        if [[ "$current_link" == "$source" ]]; then
            echo -e "${BLUE}→ Already linked: $target${NC}"
            return 0
        else
            echo -e "${YELLOW}! Target is a symlink to different location: $target -> $current_link${NC}"
            if [[ "$DRY_RUN" == false ]]; then
                mkdir -p "$BACKUP_DIR"
                mv "$target" "$BACKUP_DIR/"
                echo -e "${YELLOW}  Moved to backup: $BACKUP_DIR/$(basename "$target")${NC}"
            fi
        fi
    elif [[ -e "$target" ]]; then
        echo -e "${YELLOW}! Target exists: $target${NC}"
        if [[ "$DRY_RUN" == false ]]; then
            mkdir -p "$BACKUP_DIR"
            mv "$target" "$BACKUP_DIR/"
            echo -e "${YELLOW}  Backed up to: $BACKUP_DIR/$(basename "$target")${NC}"
        fi
    fi
    
    if [[ "$DRY_RUN" == false ]]; then
        ln -sf "$source" "$target"
        echo -e "${GREEN}✓ Linked: $target -> $source${NC}"
    else
        echo -e "${GREEN}✓ Would link: $target -> $source${NC}"
    fi
}

echo -e "${BLUE}=== Dotfiles Setup ===${NC}\n"

# Vim
echo -e "${BLUE}Vim:${NC}"
create_symlink "$SCRIPT_DIR/vim/vimrc" "$HOME/.vimrc"
create_symlink "$SCRIPT_DIR/vim" "$HOME/.vim"
echo

# Tmux
echo -e "${BLUE}Tmux:${NC}"
create_symlink "$SCRIPT_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
create_symlink "$SCRIPT_DIR/tmux" "$HOME/.tmux"

# Install tpm (Tmux Plugin Manager) if not present
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    echo -e "${YELLOW}Installing tmux plugin manager (tpm)...${NC}"
    if [[ "$DRY_RUN" == false ]]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
        echo -e "${GREEN}✓ tpm installed${NC}"
        echo -e "${YELLOW}  Run 'Prefix + I' in tmux to install plugins${NC}"
    else
        echo -e "${GREEN}✓ Would install tpm to $HOME/.tmux/plugins/tpm${NC}"
    fi
else
    echo -e "${BLUE}→ tpm already installed${NC}"
fi
echo

# Shell
echo -e "${BLUE}Shell:${NC}"
create_symlink "$SCRIPT_DIR/shell/bashrc" "$HOME/.bashrc"
create_symlink "$SCRIPT_DIR/shell/bash_aliases" "$HOME/.bash_aliases"
create_symlink "$SCRIPT_DIR/shell/profile" "$HOME/.profile"
create_symlink "$SCRIPT_DIR/shell/Xresources" "$HOME/.Xresources"
create_symlink "$SCRIPT_DIR/shell/fdignore" "$HOME/.fdignore"
create_symlink "$SCRIPT_DIR/shell/bash_zoxide" "$HOME/.bash_zoxide"

# FZF configuration (create ~/.config/fzf/ directory structure)
mkdir -p "$HOME/.config/fzf"
create_symlink "$SCRIPT_DIR/shell/fzf/config.bash" "$HOME/.config/fzf/config.bash"
create_symlink "$SCRIPT_DIR/shell/fzf/key-bindings.bash" "$HOME/.config/fzf/key-bindings.bash"
echo

if [[ "$DRY_RUN" == false ]]; then
    echo -e "${GREEN}=== Setup Complete! ===${NC}"
    if [[ -d "$BACKUP_DIR" ]]; then
        echo -e "${YELLOW}Backups saved to: $BACKUP_DIR${NC}"
    fi
    echo -e "\n${YELLOW}Note: Restart your shell or run 'source ~/.bashrc' to apply changes${NC}"
    echo -e "${YELLOW}Don't forget to copy shell/env_secrets.example to ~/.env_secrets and add your keys${NC}"
else
    echo -e "${YELLOW}=== Dry Run Complete - No changes made ===${NC}"
    echo -e "Run without --dry-run to apply changes"
fi
