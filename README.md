# Dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Features

- **Shell**: zsh with oh-my-zsh and Powerlevel10k theme
- **Terminal**: iTerm2 with Catppuccin Mocha theme
- **Editor**: Neovim with NvChad
- **Multiplexer**: tmux with custom keybindings
- **Package Management**: Homebrew with Brewfile
- **Machine-specific configs**: Separate settings for work and personal machines

## Installation on a New Machine

### Quick Install

Run this one-liner to bootstrap everything:

```bash
sh -c "$(curl -fsLS https://raw.githubusercontent.com/m-hegyi/dotfiles/main/install.sh)"
```

### Manual Install

If you prefer to install manually:

1. Install chezmoi:
   ```bash
   brew install chezmoi
   # or
   sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
   ```

2. Initialize with your dotfiles:
   ```bash
   chezmoi init https://github.com/m-hegyi/dotfiles.git
   ```

3. Create the machine-specific config:
   ```bash
   mkdir -p ~/.config/chezmoi
   cat > ~/.config/chezmoi/chezmoi.toml <<EOF
   [data]
       machine_type = "work"  # or "personal"
   EOF
   ```

4. Apply the dotfiles:
   ```bash
   chezmoi apply -v
   ```

## Machine-Specific Configuration

The setup supports different configurations for work and personal machines.

### Work Machine
Set `machine_type = "work"` in `~/.config/chezmoi/chezmoi.toml`

Includes:
- Ruby development tools (solargraph, ruby-lsp, rubocop)
- Chruby for Ruby version management
- Canvas-specific aliases and settings
- Work-specific git configurations

### Personal Machine
Set `machine_type = "personal"` in `~/.config/chezmoi/chezmoi.toml`

Excludes work-specific tools and configurations.

## What Gets Installed

### Via Homebrew (Brewfile)
- **CLI Tools**: neovim, tmux, ripgrep, fd, jq, aider, flyctl
- **Languages**: node, yarn, bash
- **Shell**: zsh-autosuggestions, zsh-syntax-highlighting
- **Apps**: iTerm2, VSCode, Firefox, Rectangle, LinearMouse

### Via Setup Scripts
- **oh-my-zsh**: ZSH framework
- **Powerlevel10k**: ZSH theme
- **tmux plugins**: TPM, catppuccin, vim-tmux-navigator, tmux-resurrect
- **NvChad**: Neovim configuration framework

## Post-Install Steps

1. **Restart your terminal** or run: `source ~/.zshrc`
2. **Open nvim** to complete plugin installation (first launch will take a moment)
3. **Open tmux** and press `Ctrl-a + I` to install TPM-managed plugins
4. **Restart iTerm2** to apply theme and preferences

## Managing Your Dotfiles

### Add a new file
```bash
chezmoi add ~/.config/some-app/config.yaml
```

### Edit a managed file
```bash
chezmoi edit ~/.zshrc
```

### Apply changes
```bash
chezmoi apply
```

### Update from repository
```bash
chezmoi update
```

### See what would change
```bash
chezmoi diff
```

## Manual Setup Tasks

See [SETUP.md](./SETUP.md) for tasks that need to be done manually on a new machine.
