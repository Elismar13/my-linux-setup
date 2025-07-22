#!/bin/bash

echo "📦 Installing asdf (version manager for multiple runtimes)..."

# Prerequisites
sudo apt install -y curl git

# Get latest release tag from GitHub
LATEST_ASDF_VERSION=$(curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

# Clone asdf
if [ ! -d "$HOME/.asdf" ]; then
  echo "📥 Cloning asdf@$LATEST_ASDF_VERSION..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "$LATEST_ASDF_VERSION"
else
  echo "ℹ️ asdf already exists. Skipping clone."
fi

# Add asdf to .zshrc if not already present
if ! grep -q 'asdf.sh' ~/.zshrc; then
  echo -e '\n# Load asdf' >> ~/.zshrc
  echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
  echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.zshrc
fi

# Source asdf immediately in the current shell
. "$HOME/.asdf/asdf.sh"

# Ensure plugins are installed
echo "📦 Installing Node.js plugin..."
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || echo "Node.js plugin already installed."
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

echo "📦 Installing Java plugin..."
asdf plugin add java https://github.com/halcyon/asdf-java.git || echo "Java plugin already installed."

# Get latest LTS versions
NODE_LTS=$(asdf list-all nodejs | grep -E '^20\.' | tail -1)
JAVA_LTS=$(asdf list-all java | grep -E '^temurin-17\.' | tail -1)

# Install and set global
echo "📥 Installing Node.js $NODE_LTS"
asdf install nodejs "$NODE_LTS"
asdf global nodejs "$NODE_LTS"

echo "📥 Installing Java $JAVA_LTS"
asdf install java "$JAVA_LTS"
asdf global java "$JAVA_LTS"

echo "✅ asdf installed and configured with:"
echo "  - Node.js $NODE_LTS"
echo "  - Java $JAVA_LTS"

echo "✅ asdf setup complete."