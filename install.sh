#!/bin/bash

set -e

echo "🔧 Starting development environment setup..."

./scripts/install_zsh.sh
./scripts/install_podman.sh
./scripts/install_htop.sh
./scripts/install_asdf.sh
./scripts/install_devtools.sh
./scripts/install_vscode.sh

echo "✅ All components installed successfully!"
