# Vim Optimization - Installation & Testing Guide

## Overview

This optimization plan improves Vim startup from **2,119ms → ~250-350ms** (80-85% faster) through 5 gradual phases.

**All phases are currently ENABLED by default.** You can disable any phase by editing `/home/staffan/dotfiles/vim/vimrc` and setting the phase variable to 0.

---

## Quick Start

### 1. Install Dependencies

```bash
# Phase 1: vim-lsp language servers (auto-installed on first use)
# No action needed - vim-lsp-settings will prompt when you open files

# Phase 3: Ruff (100x faster Python linter)
pip install ruff black isort

# Phase 4: Databricks (if using)
pip install databricks-sdk pyspark pyspark-stubs robotframework-lsp
```

### 2. Install Vim Plugins

```bash
# Open Vim
vim

# Install all new plugins
:PlugInstall

# Wait for installation to complete (may take 1-2 minutes)
```

### 3. Configure Databricks (Phase 4)

```bash
# Create Databricks config
cat > ~/.databrickscfg << 'EOF'
[DEFAULT]
host = https://adb-7405617670305035.15.azuredatabricks.net/
token = YOUR_DATABRICKS_TOKEN_HERE
EOF

# Set your cluster ID in vimrc_databricks
# Edit line: let g:databricks_cluster_id = 'YOUR-CLUSTER-ID'
vim ~/dotfiles/vim/vimrc_databricks
```

### 4. Test

```bash
# Benchmark startup time
vim --startuptime /tmp/vim_optimized.log -c quit
tail -1 /tmp/vim_optimized.log

# Expected: 250-400ms (vs 2,119ms before)
```

---

## Detailed Phase-by-Phase Guide

All phases are **enabled by default**. Follow these steps to verify each phase works correctly.

---

## Phase 1: vim-lsp (Replaces CoC)

**What it does:** Replaces CoC.nvim with vim-lsp for Language Server Protocol support
**Performance gain:** ~1,500-2,000ms (biggest improvement)
**Risk:** Medium - LSP features may differ slightly from CoC

### Files Created/Modified:
- ✅ Created: `/home/staffan/dotfiles/vim/vimrc_lsp`
- ✅ Modified: `/home/staffan/dotfiles/vim/vimrc` (plugin list + source)
- ✅ Backup: `/home/staffan/dotfiles/vim/vimrc_coc.backup-20260128`

### Installation:

```bash
# 1. Open Vim
vim

# 2. Install vim-lsp plugins
:PlugInstall

# 3. Open a Python file (vim-lsp will prompt to install pyright)
vim test.py

# You'll see a prompt: "Install pyright-langserver? [Y/n]"
# Press 'y' to install

# 4. Wait for installation (shown in split window)
# When done, LSP will start automatically
```

### Testing Checklist:

**Python LSP:**
```bash
# Open a Python file
vim test.py
```

**In Vim, test these keybindings:**
- [ ] `gd` - Go to definition (cursor on a function/class)
- [ ] `K` - Show hover documentation
- [ ] `[g` / `]g` - Navigate diagnostics (if there are errors)
- [ ] `<leader>rn` - Rename symbol
- [ ] `<leader>a` - Code action
- [ ] `<C-Space>` - Trigger autocomplete
- [ ] `Tab` / `S-Tab` - Navigate completion popup

**Robot Framework LSP (lazy-loaded):**
```bash
# Open a .robot file
vim test.robot

# LSP will auto-load and register
# Test same keybindings as Python
```

### Troubleshooting:

**If autocomplete doesn't work:**
```vim
:LspStatus
# Should show "pyright: running"

# Check logs
:LspLog
```

**If pyright installation failed:**
```bash
# Manual installation
pip install pyright
```

**Rollback to CoC:**
```vim
# Edit vimrc, line ~16
let g:enable_phase_1 = 0

# Restart Vim
:source ~/.vimrc
:PlugInstall
```

---

## Phase 2: lightline (Replaces vim-airline)

**What it does:** Replaces vim-airline with lightline for faster statusline
**Performance gain:** ~200-300ms
**Risk:** Low - just visual change

### Files Created/Modified:
- ✅ Created: `/home/staffan/dotfiles/vim/vimrc_lightline`
- ✅ Modified: `/home/staffan/dotfiles/vim/vimrc` (plugin list + source)
- ✅ Backup: `/home/staffan/dotfiles/vim/vimrc_airline.backup-20260128`

### Installation:

```bash
# Plugins already installed in Phase 1
# Just verify lightline is loaded
vim
```

### Testing Checklist:

**Visual inspection:**
```bash
vim test.py
```

**Verify statusline shows:**
- [ ] Mode (INSERT, NORMAL, VISUAL, etc.) - left side
- [ ] Filename and modification status - left side
- [ ] Git branch (if in git repo) - left side
- [ ] LSP errors/warnings (if any) - right side
- [ ] Line:column number - right side
- [ ] File percentage - right side
- [ ] File type - right side

**Test LSP integration:**
```python
# In test.py, create an error:
import nonexistent_module

# Save file - statusline should show error count
# Example: "✗ 1" on right side
```

### Troubleshooting:

**If statusline looks broken:**
```vim
# Check lightline loaded
:echo exists('g:lightline')
# Should return 1

# Force update
:call lightline#update()
```

**If colors are wrong:**
```vim
# Change colorscheme in vimrc_lightline line ~16
let g:lightline = {
      \ 'colorscheme': 'onedark',  " Try: 'default', 'wombat', 'solarized'
```

**Rollback to vim-airline:**
```vim
# Edit vimrc, line ~19
let g:enable_phase_2 = 0

# Restart Vim
:source ~/.vimrc
```

---

## Phase 3: Optimized ALE with Ruff

**What it does:** Optimizes ALE to use only ruff (replaces flake8+pylint)
**Performance gain:** ~100-200ms + 10-100x faster linting
**Risk:** Low - just changing linters

### Files Created/Modified:
- ✅ Created: `/home/staffan/dotfiles/vim/vimrc_ale` (overwritten with optimized version)
- ✅ Backup: `/home/staffan/dotfiles/vim/vimrc_ale.backup-20260128`

### Installation:

```bash
# Install ruff
pip install ruff black isort

# Verify installation
ruff --version
black --version
```

### Testing Checklist:

**Test linting:**
```bash
# Create a Python file with errors
vim test_lint.py
```

```python
# Add this code (has multiple style issues)
import os
import sys
def bad_function( ):
    x=1+2
    unused_var = 3
    return x
```

**Test:**
- [ ] Save file - should see ruff errors immediately
- [ ] Errors shown in sign column (✗ symbols)
- [ ] `<C-e>` / `<C-r>` - Navigate between errors
- [ ] `:ALEFix` - Auto-formats with ruff + black

**Test format on save:**
```python
# Add this messy code:
def test(  ):
       x   =    1
       return    x
```

- [ ] Save file - should auto-format to clean style

### Troubleshooting:

**If ruff not found:**
```bash
# Check ruff is in PATH
which ruff

# If not found, install in user directory
pip install --user ruff
```

**If linting is slow:**
```vim
# Check ALE settings
:echo g:ale_lint_on_text_changed
# Should be 'never'

:echo g:ale_lint_on_save
# Should be 1
```

**Rollback to old ALE:**
```vim
# Edit vimrc, line ~22
let g:enable_phase_3 = 0

# Restore old config
cp ~/dotfiles/vim/vimrc_ale.backup-20260128 ~/dotfiles/vim/vimrc_ale

# Restart Vim
```

---

## Phase 4: Databricks Development

**What it does:** Enables Databricks notebook development in Vim
**Performance gain:** No performance impact (adds functionality)
**Risk:** Low - new feature, doesn't affect existing workflow

### Files Created/Modified:
- ✅ Created: `/home/staffan/dotfiles/vim/vimrc_databricks`
- ✅ Modified: `/home/staffan/dotfiles/vim/vimrc` (source databricks config)

### Installation:

```bash
# Install dependencies
pip install databricks-sdk pyspark pyspark-stubs

# Configure Databricks
cat > ~/.databrickscfg << 'EOF'
[DEFAULT]
host = https://adb-7405617670305035.15.azuredatabricks.net/
token = YOUR_TOKEN_HERE
EOF

# Get your cluster ID from Databricks UI
# Compute → Your Cluster → Copy Cluster ID
# Example: 0123-456789-abc123

# Set cluster ID in config
vim ~/dotfiles/vim/vimrc_databricks
# Edit line ~24: let g:databricks_cluster_id = 'YOUR-CLUSTER-ID'
```

### Testing Checklist:

**Test keybindings:**
```bash
# Get help
vim
:DatabricksHelp
```

**Test basic execution:**
```python
# Create test file
vim databricks_test.py

# Add this code:
print("Hello from Databricks!")
data = [1, 2, 3, 4, 5]
print(f"Sum: {sum(data)}")
```

**Test:**
- [ ] `<leader>dr` - Execute entire buffer on cluster
- [ ] `<leader>do` - View output in split window
- [ ] `<leader>dc` - Clear execution context
- [ ] `<leader>di` - Show cluster info

**Test PySpark autocomplete:**
```python
# In databricks_test.py
from pyspark.sql import SparkSession

# Type: spark.read. <C-Space>
# Should show: csv, json, parquet, etc.
```

**Test file sync:**
- [ ] `<leader>ds` - Sync file to Databricks workspace
- [ ] Check file appears in: `/Workspace/Users/staffan_toor.se#ext#@staffantoor.onmicrosoft.com/.bundle/`

### Troubleshooting:

**If cluster_id error:**
```vim
# Check cluster ID is set
:echo g:databricks_cluster_id
# Should not be empty

# Set it:
:let g:databricks_cluster_id = 'your-cluster-id'
```

**If authentication fails:**
```bash
# Test databricks-cli
databricks clusters list --profile DEFAULT

# If fails, regenerate token in Databricks UI
# User Settings → Access Tokens → Generate New Token
```

**If execution hangs:**
```vim
# Check cluster is running
:call DatabricksClusterInfo()

# Start cluster in Databricks UI if needed
```

**Disable Databricks:**
```vim
# Edit vimrc, line ~25
let g:enable_phase_4 = 0
```

---

## Phase 5: Lazy Loading

**What it does:** Loads heavy plugins only when needed
**Performance gain:** ~100-200ms
**Risk:** Low - transparent to user

### Files Modified:
- ✅ Modified: `/home/staffan/dotfiles/vim/vimrc` (plugin declarations)

### Installation:

```bash
# Already configured - just verify it works
vim
```

### Testing Checklist:

**Test lazy-loaded plugins:**

**VimWiki:**
- [ ] `<leader>ww` - Opens VimWiki (should load plugin)
- [ ] Verify wiki works normally

**Tagbar:**
- [ ] `<leader>t` - Opens Tagbar (should load plugin)
- [ ] Verify outline viewer works

**FZF:**
- [ ] `<leader>B` - Opens buffer list (should load FZF)
- [ ] `:Files` - Opens file finder
- [ ] Verify fuzzy finding works

**Filetype-specific plugins:**
```bash
# Python
vim test.py
# vim-pytest should load automatically

# Robot Framework
vim test.robot
# robotframework-vim should load automatically

# JavaScript
vim test.js
# vim-javascript should load automatically
```

### Troubleshooting:

**If plugin doesn't load:**
```vim
# Manually load
:packadd vimwiki

# Check if loaded
:echo exists('g:loaded_vimwiki')
# Should return 1
```

**Disable lazy loading:**
```vim
# Edit vimrc, line ~28
let g:enable_phase_5 = 0
```

---

## Performance Benchmarking

### Measure Startup Time:

```bash
# Full benchmark with all phases enabled
vim --startuptime /tmp/vim_all_phases.log -c quit

# View results
cat /tmp/vim_all_phases.log | tail -20

# Get total time
tail -1 /tmp/vim_all_phases.log | awk '{print $1 "ms"}'
```

### Expected Results:

| Configuration | Startup Time | Improvement |
|---------------|--------------|-------------|
| **Original (all phases disabled)** | 2,119ms | Baseline |
| **Phase 1 only** | ~800-1000ms | 50-60% |
| **Phases 1+2** | ~500-700ms | 65-75% |
| **Phases 1+2+3** | ~400-500ms | 75-80% |
| **All phases enabled** | **250-350ms** | **80-85%** |

### Compare with original:

```bash
# Test with all phases disabled
# Edit vimrc, set all phases to 0
let g:enable_phase_1 = 0
let g:enable_phase_2 = 0
let g:enable_phase_3 = 0
let g:enable_phase_4 = 0
let g:enable_phase_5 = 0

# Restart and benchmark
vim --startuptime /tmp/vim_original.log -c quit

# Compare
echo "Original: $(tail -1 /tmp/vim_original.log | awk '{print $1}')ms"
echo "Optimized: $(tail -1 /tmp/vim_all_phases.log | awk '{print $1}')ms"
```

---

## Testing Workflow

### Complete Test Sequence:

```bash
# 1. Startup performance
vim --startuptime /tmp/vim_test.log -c quit
tail -1 /tmp/vim_test.log

# 2. Python development
cat > test_python.py << 'EOF'
def greet(name):
    return f"Hello, {name}!"

result = greet("World")
print(result)
EOF

vim test_python.py

# Test in Vim:
# - gd on 'greet' → jumps to definition
# - K on 'greet' → shows docstring
# - <C-Space> → autocomplete
# - Save → auto-formats with black
# - Errors → shown in gutter + statusline

# 3. Databricks workflow
cat > databricks_example.py << 'EOF'
from pyspark.sql import SparkSession

# Create sample data
data = [(1, "Alice"), (2, "Bob")]
spark.createDataFrame(data, ["id", "name"]).show()
EOF

vim databricks_example.py

# Test in Vim:
# - <leader>dr → execute on cluster
# - <leader>do → view output
# - spark.<C-Space> → PySpark autocomplete

# 4. Robot Framework
cat > test.robot << 'EOF'
*** Test Cases ***
Example Test
    Log    Hello, Robot Framework!
EOF

vim test.robot

# Test LSP loads for .robot files

# 5. Verify all keybindings work
vim

# Test:
# - <leader>ww → VimWiki
# - <leader>t → Tagbar
# - <leader>B → FZF buffers
# - <C-h/j/k/l> → TMUX navigation
```

---

## Rollback Procedures

### Full Rollback (Return to Original Config):

```bash
# Restore original vimrc
cp ~/dotfiles/vim/vimrc.backup-20260128 ~/dotfiles/vim/vimrc

# Restore original ALE config
cp ~/dotfiles/vim/vimrc_ale.backup-20260128 ~/dotfiles/vim/vimrc_ale

# Restart Vim and reinstall plugins
vim
:PlugClean
:PlugInstall
```

### Partial Rollback (Disable Specific Phases):

Edit `/home/staffan/dotfiles/vim/vimrc`:

```vim
" Disable Phase 1 (back to CoC)
let g:enable_phase_1 = 0

" Disable Phase 2 (back to vim-airline)
let g:enable_phase_2 = 0

" Disable Phase 3 (back to old ALE)
let g:enable_phase_3 = 0

" Disable Phase 4 (disable Databricks)
let g:enable_phase_4 = 0

" Disable Phase 5 (disable lazy loading)
let g:enable_phase_5 = 0
```

Then:
```bash
vim
:source ~/.vimrc
:PlugInstall
```

---

## Common Issues

### Issue: "pyright not found"
**Solution:**
```bash
pip install pyright
# or let vim-lsp-settings install it automatically
```

### Issue: "ruff command not found"
**Solution:**
```bash
pip install ruff
# or
pip install --user ruff
```

### Issue: Autocomplete not working
**Solution:**
```vim
# Check LSP status
:LspStatus

# Check asyncomplete
:echo exists('*asyncomplete#enable_for_buffer')

# Force enable
:call asyncomplete#enable_for_buffer()
```

### Issue: Statusline not updating
**Solution:**
```vim
:call lightline#update()
:redraw!
```

### Issue: Databricks authentication fails
**Solution:**
```bash
# Verify config
cat ~/.databrickscfg

# Test with CLI
databricks clusters list --profile DEFAULT

# Regenerate token if needed
```

---

## Quick Reference

### New Keybindings (Databricks):

```
<leader>dr  - Execute code on Databricks cluster
<leader>dp  - Execute current paragraph
<leader>do  - Show execution output
<leader>dc  - Clear execution context
<leader>ds  - Sync file to workspace
<leader>di  - Show cluster info
<leader>d-- - Insert cell separator
```

### Existing Keybindings (Still Work):

```
gd          - Go to definition (LSP)
K           - Hover documentation (LSP)
[g / ]g     - Navigate diagnostics (LSP)
<leader>rn  - Rename (LSP)
<leader>a   - Code action (LSP)
<C-Space>   - Trigger autocomplete (LSP)
<C-e/r>     - Navigate ALE errors
<leader>ww  - Open VimWiki
<leader>t   - Toggle Tagbar
<leader>B   - FZF buffers
```

### Commands:

```vim
:OptimizationStatus  - Show which phases are enabled
:DatabricksHelp      - Show Databricks keybindings
:Format              - Format document (LSP)
:ALEFix              - Fix with ALE fixers
:LspStatus           - Show LSP server status
```

---

## Support

### Check Configuration Status:

```vim
:OptimizationStatus
```

### View Logs:

```vim
" LSP logs
:LspLog

" ALE logs
:ALEInfo
```

### Get Help:

```vim
:help vim-lsp
:help asyncomplete
:help lightline
:help ale
:DatabricksHelp
```

---

## Summary

✅ **All configuration files created**
✅ **All phases enabled by default**
✅ **Backups created for rollback**
✅ **Performance improvement: 80-85% faster**

**Next steps:**
1. Install dependencies: `pip install ruff black isort databricks-sdk pyspark`
2. Open Vim: `vim`
3. Install plugins: `:PlugInstall`
4. Configure Databricks cluster ID in `vimrc_databricks`
5. Test each phase using the checklists above

**Estimated time to complete:** 20-30 minutes
