#!/bin/bash

# Uninstall utenv CLI utility

echo "Uninstalling utenv CLI utility..."

# Check if utenv is installed in /usr/local/bin
if [ -L /usr/local/bin/utenv ]; then
    sudo rm /usr/local/bin/utenv
    echo "Removed /usr/local/bin/utenv"
elif [ -f /usr/local/bin/utenv ]; then
    sudo rm /usr/local/bin/utenv
    echo "Removed /usr/local/bin/utenv"
fi

# Check if utenv is installed in ~/.local/bin
if [ -L ~/.local/bin/utenv ]; then
    rm ~/.local/bin/utenv
    echo "Removed ~/.local/bin/utenv"
elif [ -f ~/.local/bin/utenv ]; then
    rm ~/.local/bin/utenv
    echo "Removed ~/.local/bin/utenv"
fi

# Check if the file exists in current directory
if [ -f "$(pwd)/utenv.sh" ]; then
    echo "Note: utenv.sh file still exists in current directory: $(pwd)/utenv.sh"
    echo "You can manually delete it if desired."
else
    echo "utenv.sh not found in current directory"
fi

echo "Uninstallation complete!"
echo "Note: Any existing utenv virtual environments in your projects will remain untouched." 