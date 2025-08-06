# utenv - Python Virtual Environment Manager

A simple CLI utility for managing Python virtual environments.

## Quick Start

Only **2 basic commands** you need to know:

```bash
# Create or activate the directory's utenv
source utenv

# Deactivate the virtual environment
deactivate
```

That's it! The `source utenv` command will either create a new `utenv` virtual environment (if none exists) or activate an existing one.

## Features

- Automatically creates a `utenv` virtual environment if none exists
- Activates existing `utenv` virtual environment
- Supports multiple Python versions
- Cross-platform (Unix/Linux/macOS)
- Fast shell script implementation

## Installation

### Quick Install
```bash
./install.sh
```

### Manual Install
```bash
# Make executable
chmod +x utenv.sh

# Create symlink (choose one)
sudo ln -sf $(pwd)/utenv.sh /usr/local/bin/utenv
# OR
ln -sf $(pwd)/utenv.sh ~/.local/bin/utenv
```

### Uninstall
```bash
./uninstall.sh
```

The uninstall script will remove the `utenv` command from your system but will not delete any existing virtual environments in your projects.

## Usage

### Basic Usage
```bash
# Create or activate utenv in current directory
source utenv

# Deactivate when done
deactivate
```

### Global Installation
```bash
# Install globally
./install.sh

# Then use anywhere
source utenv
```

### Examples

1. **First time in a directory:**
   ```bash
   $ source utenv
   Using Python version: python3.11
   Creating virtual environment with python3.11...
   Virtual environment created successfully!
   Activating virtual environment...
   Virtual environment activated!
   ```

2. **Subsequent runs in same directory:**
   ```bash
   $ source utenv
   Virtual environment 'utenv' found. Activating...
   Activating virtual environment...
   Virtual environment activated!
   ```

## How it Works

1. **No utenv exists:** Creates a new virtual environment named `utenv` using the latest stable Python version
2. **utenv exists:** Activates the existing virtual environment in the current shell

## Python Version Detection

The utility automatically detects available Python versions in this order:
1. `python3.x` (3.7-3.20, preferring newer versions)
2. `python3`
3. `python`

## Requirements

- Python 3.7 or higher
- Unix-like system (Linux/macOS) or Windows

## License

MIT License 