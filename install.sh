#!/bin/bash

# Install uenv CLI utility globally

echo "Installing uenv CLI utility..."

# Make sure the script is executable
chmod +x uenv.sh

# Create a symlink to make it available as 'uenv' command
# Check if /usr/local/bin exists and is writable
if [ -w /usr/local/bin ]; then
    sudo ln -sf "$(pwd)/uenv.sh" /usr/local/bin/uenv
    echo "Installed to /usr/local/bin/uenv"
elif [ -w ~/.local/bin ]; then
    mkdir -p ~/.local/bin
    ln -sf "$(pwd)/uenv.sh" ~/.local/bin/uenv
    echo "Installed to ~/.local/bin/uenv"
    
    # Add ~/.local/bin to PATH in shell configuration
    add_to_path() {
        local shell_config="$1"
        local path_export='export PATH="$HOME/.local/bin:$PATH"'
        
        if [ -f "$shell_config" ]; then
            # Check if the export is already in the file
            if ! grep -q "export PATH.*\.local/bin" "$shell_config"; then
                echo "" >> "$shell_config"
                echo "# Added by uenv installer" >> "$shell_config"
                echo "$path_export" >> "$shell_config"
                echo "Added ~/.local/bin to PATH in $shell_config"
            else
                echo "~/.local/bin already in PATH in $shell_config"
            fi
        fi
    }
    
    # Detect shell and add to appropriate config file
    case "$SHELL" in
        */zsh)
            add_to_path "$HOME/.zshrc"
            ;;
        */bash)
            add_to_path "$HOME/.bashrc"
            ;;
        */fish)
            echo "For fish shell, manually add: set -gx PATH \$HOME/.local/bin \$PATH"
            ;;
        *)
            echo "Unknown shell: $SHELL"
            echo "Please manually add ~/.local/bin to your PATH"
            ;;
    esac
    
else
    echo "Please run this script with sudo or add ~/.local/bin to your PATH"
    exit 1
fi

echo "Installation complete! You can now use 'source uenv' command."
echo "Note: You may need to restart your shell or run 'source ~/.zshrc' (or ~/.bashrc) for PATH changes to take effect." 