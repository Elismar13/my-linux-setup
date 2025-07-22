#!/bin/bash

echo "🐚 Installing Zsh and Oh My Zsh..."

sudo apt install -y zsh curl git

# Change default shell to Zsh
chsh -s "$(which zsh)"

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🔧 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "ℹ️ Oh My Zsh already installed. Skipping..."
fi

echo "✅ Zsh and Oh My Zsh setup complete."
