#!/bin/sh

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
  echo "Node.js is not installed. Please install it first."
  exit 1
fi

# Define global packages
packages=("rollup" "terser" "roadroller")

# Install global packages
for package in "${packages[@]}"; do
  npm install -g "$package"
done

# Source your shell configuration file
source ~/.zshrc  # Use ~/.bashrc if you use Bash

echo "Installation complete."