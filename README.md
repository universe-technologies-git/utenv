# utenv - Python Virtual Environment Manager

A simple CLI utility for managing Python virtual environments.

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
./utenv.sh

# List available Python versions
./utenv.sh --list

# Create utenv with specific Python version
./utenv.sh --python python3.11
```

### Global Installation
```bash
# Install globally
./install.sh

# Then use anywhere
utenv
```

### Examples

1. **First time in a directory:**
   ```bash
   $ ./utenv.sh
   Using Python version: python3.11
   Creating virtual environment with python3.11...
   Virtual environment created successfully!
   Activating virtual environment...
   ```

2. **Subsequent runs in same directory:**
   ```bash
   $ ./utenv.sh
   Virtual environment 'utenv' found. Activating...
   Activating virtual environment...
   ```

3. **List available Python versions:**
   ```bash
   $ ./utenv.sh --list
   Available Python versions:
     python3.11: Python 3.11.5
     python3.10: Python 3.10.12
     python3: Python 3.11.5
   ```

4. **Create with specific Python version:**
   ```bash
   $ ./utenv.sh --python python3.10
   Using Python version: python3.10
   Creating virtual environment with python3.10...
   Virtual environment created successfully!
   ```

## How it Works

1. **No utenv exists:** Creates a new virtual environment named `utenv` using the latest stable Python version (or specified version)
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