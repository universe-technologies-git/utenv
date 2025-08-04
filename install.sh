#!/bin/bash

# Install utenv CLI utility globally

echo "Installing utenv CLI utility..."

# Make sure the script is executable
chmod +x utenv.sh

# Create a symlink to make it available as 'utenv' command
# Check if /usr/local/bin exists and is writable
if [ -w /usr/local/bin ]; then
    sudo ln -sf "$(pwd)/utenv.sh" /usr/local/bin/utenv
    echo "Installed to /usr/local/bin/utenv"
elif [ -w ~/.local/bin ]; then
    mkdir -p ~/.local/bin
    ln -sf "$(pwd)/utenv.sh" ~/.local/bin/utenv
    echo "Installed to ~/.local/bin/utenv"
    echo "Add ~/.local/bin to your PATH if not already added"
else
    echo "Please run this script with sudo or add ~/.local/bin to your PATH"
    exit 1
fi

echo "Installation complete! You can now use 'utenv' command."
echo "Try: utenv --help" 