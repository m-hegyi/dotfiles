#!/bin/bash
# Bootstrap script to install chezmoi and apply dotfiles on a new machine
# Run this with: sh -c "$(curl -fsLS https://raw.githubusercontent.com/m-hegyi/dotfiles/main/install.sh)"

set -e

echo "========================================"
echo "Chezmoi Bootstrap Script"
echo "========================================"

# Check if chezmoi is already installed
if command -v chezmoi &> /dev/null; then
  echo "chezmoi is already installed"
else
  echo "Installing chezmoi..."

  # Install chezmoi using the official installer
  if [ "$(uname)" = "Darwin" ]; then
    # On macOS, check if Homebrew is available
    if command -v brew &> /dev/null; then
      brew install chezmoi
    else
      # Install using the binary installer
      sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
      export PATH="$HOME/.local/bin:$PATH"
    fi
  else
    # On Linux or other systems
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    export PATH="$HOME/.local/bin:$PATH"
  fi

  echo "chezmoi installed successfully"
fi

# Initialize chezmoi with your dotfiles repo
echo ""
echo "Enter your dotfiles repository URL (e.g., https://github.com/username/dotfiles.git):"
read -r REPO_URL

if [ -z "$REPO_URL" ]; then
  echo "Error: Repository URL is required"
  exit 1
fi

echo ""
echo "Initializing chezmoi with repository: $REPO_URL"
chezmoi init "$REPO_URL"

echo ""
echo "Creating chezmoi config..."
echo "Is this a work or personal machine? (work/personal):"
read -r MACHINE_TYPE

if [ "$MACHINE_TYPE" != "work" ] && [ "$MACHINE_TYPE" != "personal" ]; then
  echo "Error: Please enter 'work' or 'personal'"
  exit 1
fi

echo "Is this a laptop? (y/n):"
read -r IS_LAPTOP

if [ "$IS_LAPTOP" != "y" ] && [ "$IS_LAPTOP" != "n" ]; then 
  echo "Error: Please enter 'y' or 'n'"
  exit 1
fi

# Convert y/n to boolean
if [ "$IS_LAPTOP" = "y" ]; then
  IS_LAPTOP_BOOL="true"
else
  IS_LAPTOP_BOOL="false"
fi

# Create chezmoi config
mkdir -p "$HOME/.config/chezmoi"
cat > "$HOME/.config/chezmoi/chezmoi.toml" <<EOF
[data]
    machine_type = "$MACHINE_TYPE"
    is_laptop = $IS_LAPTOP_BOOL
EOF

echo "Config created with machine_type = $MACHINE_TYPE"

echo ""
echo "Applying dotfiles..."
chezmoi apply -v

echo ""
echo "========================================"
echo "Setup complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Open nvim to complete plugin installation"
echo "  3. Restart iTerm2 to apply preferences"
echo ""
