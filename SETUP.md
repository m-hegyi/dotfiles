# Manual Setup Tasks

Tasks that can't be automated and need to be done manually on a new machine.

## macOS System Settings

### Keyboard
- [ ] System Settings > Keyboard > Modifier Keys
  - Set **Caps Lock** to **Control**

### Trackpad/Mouse
- [ ] Configure trackpad gestures
- [ ] Set tracking speed

### Dock
- [ ] Position and size preferences
- [ ] Auto-hide settings

## Applications to Install

### Required
- [ ] Install applications from Brewfile: `brew bundle --file=~/Brewfile`

### Manual Installs (if not in Brewfile)
- [ ] VSCode extensions
- [ ] Browser extensions
- [ ] Other apps not available via Homebrew

## Git Configuration

- [ ] Set up Git credentials
  - `git config --global user.name "Your Name"`
  - `git config --global user.email "your.email@example.com"`
- [ ] Set up SSH keys for GitHub
- [ ] Set up GPG signing (if used)

## Other Manual Tasks

- [ ] Sign in to iCloud
- [ ] Sign in to applications (Slack, etc.)
- [ ] Import any remaining application settings

## Notes

- Run `chezmoi apply` to sync all dotfiles
- Some settings may require logging out and back in
