#!/bin/bash
################################################################################
# Vim Optimization - Installation Script
################################################################################

set -e  # Exit on error

echo "=================================================="
echo "Vim Optimization - Installation Script"
echo "=================================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Step 1: Check dependencies
echo -e "${BLUE}Step 1: Checking dependencies...${NC}"

# Check if pip is available
if ! command -v pip &> /dev/null && ! command -v pip3 &> /dev/null; then
    echo -e "${RED}✗ pip not found. Please install python3-pip first.${NC}"
    exit 1
fi

PIP_CMD="pip3"
if command -v pip &> /dev/null; then
    PIP_CMD="pip"
fi

echo -e "${GREEN}✓ pip found: $PIP_CMD${NC}"

# Step 2: Install Python dependencies
echo ""
echo -e "${BLUE}Step 2: Installing Python dependencies...${NC}"

echo "Installing ruff, black, isort (required for Phase 3)..."
$PIP_CMD install --user ruff black isort

echo ""
read -p "Do you want to install Databricks dependencies? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing databricks-sdk, pyspark, pyspark-stubs..."
    $PIP_CMD install --user databricks-sdk pyspark pyspark-stubs
    echo -e "${GREEN}✓ Databricks dependencies installed${NC}"
else
    echo -e "${YELLOW}⊘ Skipping Databricks dependencies${NC}"
fi

echo ""
read -p "Do you want to install Robot Framework LSP? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing robotframework-lsp..."
    $PIP_CMD install --user robotframework-lsp
    echo -e "${GREEN}✓ Robot Framework LSP installed${NC}"
else
    echo -e "${YELLOW}⊘ Skipping Robot Framework LSP${NC}"
fi

# Step 3: Install Vim plugins
echo ""
echo -e "${BLUE}Step 3: Installing Vim plugins...${NC}"
echo "This will open Vim and run :PlugInstall"
echo "Wait for all plugins to install, then type :q to close the plugin window"
echo ""
read -p "Press Enter to continue..."

# Run PlugInstall
vim +PlugInstall

# Step 4: Verify installation
echo ""
echo -e "${BLUE}Step 4: Verifying installation...${NC}"

# Check if new plugins were installed
PLUGIN_DIR="$HOME/dotfiles/vim/plugins"

if [ -d "$PLUGIN_DIR/vim-lsp" ]; then
    echo -e "${GREEN}✓ vim-lsp installed${NC}"
else
    echo -e "${RED}✗ vim-lsp not found${NC}"
fi

if [ -d "$PLUGIN_DIR/lightline.vim" ]; then
    echo -e "${GREEN}✓ lightline installed${NC}"
else
    echo -e "${RED}✗ lightline not found${NC}"
fi

if [ -d "$PLUGIN_DIR/asyncomplete.vim" ]; then
    echo -e "${GREEN}✓ asyncomplete installed${NC}"
else
    echo -e "${RED}✗ asyncomplete not found${NC}"
fi

# Check Python tools
echo ""
if command -v ruff &> /dev/null; then
    echo -e "${GREEN}✓ ruff installed: $(ruff --version | head -1)${NC}"
else
    echo -e "${RED}✗ ruff not found in PATH${NC}"
fi

if command -v black &> /dev/null; then
    echo -e "${GREEN}✓ black installed: $(black --version)${NC}"
else
    echo -e "${RED}✗ black not found in PATH${NC}"
fi

# Step 5: Test startup time
echo ""
echo -e "${BLUE}Step 5: Testing Vim startup time...${NC}"

vim --startuptime /tmp/vim_startup_test.log -c quit 2>/dev/null
STARTUP_TIME=$(tail -1 /tmp/vim_startup_test.log | awk '{print $1}')

echo "Startup time: ${STARTUP_TIME}ms"

if (( $(echo "$STARTUP_TIME < 500" | bc -l 2>/dev/null || echo 0) )); then
    echo -e "${GREEN}✓ Excellent! Your Vim is blazing fast!${NC}"
elif (( $(echo "$STARTUP_TIME < 1000" | bc -l 2>/dev/null || echo 0) )); then
    echo -e "${YELLOW}⊙ Good, but could be better. Expected <500ms${NC}"
else
    echo -e "${RED}✗ Still slow. Expected <500ms, got ${STARTUP_TIME}ms${NC}"
    echo "Check if all plugins installed correctly"
fi

# Step 6: Final instructions
echo ""
echo "=================================================="
echo -e "${GREEN}Installation Complete!${NC}"
echo "=================================================="
echo ""
echo "Next steps:"
echo "1. Open a Python file: vim test.py"
echo "2. vim-lsp will prompt to install pyright - press 'y'"
echo "3. Test LSP features:"
echo "   - gd (go to definition)"
echo "   - K (hover documentation)"
echo "   - <C-Space> (autocomplete)"
echo ""
echo "4. Check optimization status: vim then :OptimizationStatus"
echo ""
echo "5. Read documentation:"
echo "   - Quick start: cat ~/dotfiles/vim/QUICKSTART.md"
echo "   - Full guide: cat ~/dotfiles/vim/OPTIMIZATION_GUIDE.md"
echo ""
echo "If you encounter issues, see: ~/dotfiles/vim/OPTIMIZATION_GUIDE.md"
echo ""
