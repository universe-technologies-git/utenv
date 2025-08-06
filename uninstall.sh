#!/bin/bash

# Uninstall uenv CLI utility

echo "Uninstalling uenv CLI utility..."

# Check if uenv is installed in /usr/local/bin
if [ -L /usr/local/bin/uenv ]; then
    sudo rm /usr/local/bin/uenv
    echo "Removed /usr/local/bin/uenv"
elif [ -f /usr/local/bin/uenv ]; then
    sudo rm /usr/local/bin/uenv
    echo "Removed /usr/local/bin/uenv"
fi

# Check if uenv is installed in ~/.local/bin
if [ -L ~/.local/bin/uenv ]; then
    rm ~/.local/bin/uenv
    echo "Removed ~/.local/bin/uenv"
elif [ -f ~/.local/bin/uenv ]; then
    rm ~/.local/bin/uenv
    echo "Removed ~/.local/bin/uenv"
fi

# Check if the file exists in current directory
if [ -f "$(pwd)/uenv.sh" ]; then
    echo "Note: uenv.sh file still exists in current directory: $(pwd)/uenv.sh"
    echo "You can manually delete it if desired."
else
    echo "uenv.sh not found in current directory"
fi

echo "Uninstallation complete!"
echo "Note: Any existing uenv virtual environments in your projects will remain untouched." 