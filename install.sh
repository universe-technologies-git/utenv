#!/bin/bash

# Install ut CLI utility globally

echo "Installing ut CLI utility..."

# Make sure the script is executable
chmod +x ut.py

# Create a symlink to make it available as 'ut' command
# Check if /usr/local/bin exists and is writable
if [ -w /usr/local/bin ]; then
    sudo ln -sf "$(pwd)/ut.py" /usr/local/bin/ut
    echo "Installed to /usr/local/bin/ut"
elif [ -w ~/.local/bin ]; then
    mkdir -p ~/.local/bin
    ln -sf "$(pwd)/ut.py" ~/.local/bin/ut
    echo "Installed to ~/.local/bin/ut"
    echo "Add ~/.local/bin to your PATH if not already added"
else
    echo "Please run this script with sudo or add ~/.local/bin to your PATH"
    exit 1
fi

echo "Installation complete! You can now use 'ut' command."
echo "Try: ut --help" 