# Claude Code Guide for Jeremy's Dotfiles

This document provides a comprehensive guide for Claude Code instances working with this dotfiles repository. It covers the repository structure, key commands, configuration patterns, and common workflows.

## Repository Overview

This is Jeremy Saenz's personal dotfiles repository that manages development environment configurations across macOS and Linux systems. The repository uses a simple symlink-based approach to manage configuration files for various development tools and applications.

**Key Information:**
- Owner: Jeremy Saenz (codegangsta)
- Email: jeremy.saenz@gmail.com
- GitHub: codegangsta
- Primary OS: macOS (Darwin)
- Shell: Zsh with Starship prompt
- Primary Editors: Cursor, Neovim

## Repository Structure

```
.dotfiles/
├── .claude/                  # Claude Code settings
│   └── settings.local.json   # Local Claude permissions
├── .git/                     # Git repository
├── config/                   # Main configuration directory (symlinked to ~/.config)
│   ├── cursor/              # Cursor editor settings
│   ├── fish/                # Fish shell config (legacy)
│   ├── ghostty/             # Ghostty terminal
│   ├── git/                 # Git configuration
│   ├── kitty/               # Kitty terminal
│   ├── lazygit/             # Lazygit TUI
│   ├── nvim/                # Neovim configuration (LazyVim)
│   ├── raycast/             # Raycast launcher
│   ├── starship.toml        # Starship prompt config
│   └── zsh/                 # Zsh configuration
├── git/                     # Git configuration files
│   ├── .gitconfig           # Main git configuration
│   └── .gitignore_global    # Global gitignore
├── zsh/                     # Zsh shell configuration
│   └── .zshrc               # Zsh configuration file
├── raycast_scripts/         # Custom Raycast scripts
├── Brewfile                 # Homebrew dependencies
├── Brewfile.lock.json       # Homebrew lockfile
├── Makefile                 # Bootstrap and installation commands
└── README.md                # Basic setup instructions
```

## Key Commands and Workflows

### Installation and Bootstrap

The primary command for setting up the dotfiles:

```bash
make bootstrap
```

This command performs the following symlink operations:
- Links `config/` → `~/.config`
- Links `config/cursor` → `~/Library/Application Support/Cursor/User`
- Links `git/.gitconfig` → `~/.gitconfig`
- Links `git/.gitignore_global` → `~/.gitignore_global`
- Links `config/lazygit/config.yml` → `~/Library/Application Support/lazygit/config.yml`
- Links `config/claude/settings.json` → `~/.claude/settings.json` (when it exists)
- Links `zsh/.zshrc` → `~/.zshrc`
- Runs `brew bundle --cleanup` to install/update packages

### Package Management

The repository uses Homebrew for package management:

- **Brewfile**: Defines all CLI tools, applications, and fonts
- **Key tools**: neovim, cursor, lazygit, starship, fzf, gh, docker, terraform
- **Applications**: Cursor, Ghostty, Kitty, Linear, Raycast, Notion, Figma
- **Fonts**: Fira Code Nerd Font, SF Mono Nerd Font, Monaspace Nerd Font

### Git Configuration

The git setup includes:
- **Editor**: `nvim -c 'startinsert'` for commits
- **Default branch**: `main`
- **Pull strategy**: Rebase
- **Useful aliases**:
  - `co` = checkout
  - `c` = commit -v
  - `lg` = pretty log with graph
  - `pb` = push current branch
  - `pbf` = force push current branch
  - `up` = pull rebase current branch

## Development Environment Setup

### Editors

**Primary Editor: Cursor**
- Configuration: `config/cursor/settings.json`
- Theme: Nord
- Font: SFMono Nerd Font, 13pt
- Key features: Neovim extension, AI preview enabled, format on save
- Extensions: Optimized for TypeScript/JavaScript development

**Secondary Editor: Neovim**
- Configuration: `config/nvim/` (LazyVim distribution)
- Supports both standalone and VSCode integration
- Language servers and formatters pre-configured

### Terminal Setup

**Shells:**
- **Zsh** (primary): Configured with Starship prompt
- **Fish** (legacy): Configuration present but not actively used

**Terminal Emulators:**
- **Ghostty**: Modern terminal emulator
- **Kitty**: GPU-accelerated terminal

**Prompt:**
- **Starship**: Highly customizable with symbols for various tools
- Git status disabled for performance
- Kubernetes and gcloud modules disabled

### Environment Variables

Key environment variables set in `.zshrc`:
- `EDITOR=cursor`
- `GIT_EDITOR="cursor -w"`
- `DOTFILES=$HOME/.dotfiles`
- `GOPATH=$HOME/go`
- Path includes Go, Cargo, local bins, and custom tools

## Configuration Patterns

### Symlink Strategy
The repository uses a centralized symlink approach where:
1. All configs live in the `config/` directory
2. The entire `config/` directory is symlinked to `~/.config`
3. Special cases (like Cursor) have individual symlinks to platform-specific locations

### Version Control
- `.gitignore` excludes sensitive files and large cache directories
- Specific exclusions for:
  - Cursor workspace/global storage
  - Various tool secrets and tokens
  - Platform-specific cache directories

### Cross-Platform Support
- Zsh configuration detects macOS vs Linux
- Homebrew paths configured for both platforms
- PATH management optimized for each OS

## Tool-Specific Configurations

### Lazygit
- Custom command: `P` key for pushing without pre-commit hooks
- Configuration: `config/lazygit/config.yml`

### Raycast
- Custom scripts in `raycast_scripts/`
- Configuration in `config/raycast/`

### Claude Code
- Local settings in `.claude/settings.local.json`
- Specific permissions for bash commands
- Referenced in Makefile for symlinking (config/claude/settings.json)

## Common Workflows

### Adding New Tool Configuration
1. Create configuration in appropriate `config/[tool]/` directory
2. If needed, add symlink command to Makefile
3. Add tool to Brewfile if it's a new dependency
4. Update .gitignore if tool creates cache/sensitive files

### Updating Dependencies
```bash
brew bundle --cleanup  # Updates all packages in Brewfile
```

### Git Workflow
```bash
git lg          # View commit history
git up          # Pull with rebase
git pb          # Push current branch
git pbf         # Force push current branch
```

### Development Aliases
- `c` = claude (for Claude Code CLI)

## Architecture Notes

### Design Philosophy
- **Simplicity**: Minimal symlink setup, single `make` command
- **Modularity**: Each tool has its own config directory
- **Cross-platform**: Works on both macOS and Linux
- **Version controlled**: All configurations tracked in git

### Performance Optimizations
- Inline Homebrew environment variables (avoid subprocess calls)
- Starship modules selectively disabled
- Zsh configuration optimized for startup time

### Security
- Sensitive files excluded from git
- 1Password integration for secrets (TF_VAR_do_token)
- GPG suite installed for commit signing

## Troubleshooting

### Common Issues
1. **Symlinks not working**: Check if target directories exist
2. **Homebrew not found**: Ensure proper PATH configuration
3. **Editor not opening**: Verify EDITOR environment variable
4. **Prompt not showing**: Check starship installation and config

### Useful Commands
```bash
# Check symlink status
ls -la ~/.config ~/.gitconfig ~/.zshrc

# Verify Homebrew installation
brew --version && brew list

# Check environment
echo $EDITOR $GOPATH $PATH
```

This guide provides the foundation for understanding and working with this dotfiles repository. The setup is designed to be simple, maintainable, and cross-platform while supporting a modern development workflow.