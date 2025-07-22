#!/bin/bash

echo "🔧 Installing essential developer tools..."

sudo apt update

# ---- Core developer packages ----

sudo apt install -y \
  git        # Version control system
  curl       # Transfer data from URLs (used in many install scripts)
  wget       # Another tool to download files from the web
  unzip      # Extract .zip files
  build-essential  # GCC, Make, and essential build tools
  software-properties-common  # Add-apt-repository and other helpers
  tree       # View directory structures in tree format
  neofetch   # Display system info on terminal (visual and useful)

# ---- Terminal power tools ----

sudo apt install -y \
  fzf        # Fuzzy finder (useful for searching files, history, etc.)
  ripgrep    # Fast recursive search (like grep, but better)
  tmux       # Terminal multiplexer (split panes, session persistence)
  exa        # Modern replacement for ls with colors, git info, etc.

# ---- Fix naming differences in Debian-based distros ----

echo "✅ Developer tools installed successfully."
