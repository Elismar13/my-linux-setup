#!/bin/bash

set -e

echo "🔧 Starting development environment setup..."

./scripts/install_podman.sh
./scripts/install_htop.sh
./scripts/install_vscode.sh
./scripts/install_zsh.sh

echo "✅ All components installed successfully!"
