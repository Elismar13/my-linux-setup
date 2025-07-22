#!/bin/bash

echo "📦 Installing asdf (version manager for multiple runtimes)..."

# Prerequisites
sudo apt install -y curl git

# Get the latest release tag from GitHub
LATEST_ASDF_VERSION=$(curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

# Clone asdf with the latest tag
if [ ! -d "$HOME/.asdf" ]; then
  echo "📥 Cloning asdf@$LATEST_ASDF_VERSION..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "$LATEST_ASDF_VERSION"
else
  echo "ℹ️ asdf already cloned. Skipping..."
fi

# Add to shell config (.zshrc)
if ! grep -q 'asdf.sh' ~/.zshrc; then
  echo -e '\n# Load asdf' >> ~/.zshrc
  echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
  echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.zshrc
fi

# Source immediately
. "$HOME/.asdf/asdf.sh"

echo "✅ asdf $LATEST_ASDF_VERSION installed and configured."
echo "🔧 Remember to restart your terminal or run 'source ~/.zshrc' to apply changes."