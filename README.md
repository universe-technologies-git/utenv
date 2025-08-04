# ut - Python Virtual Environment Manager

A simple CLI utility for managing Python virtual environments.

## Features

- Automatically creates a `utenv` virtual environment if none exists
- Activates existing `utenv` virtual environment
- Supports multiple Python versions
- Cross-platform (Unix/Linux/macOS/Windows)

## Installation

### Quick Install
```bash
./install.sh
```

### Manual Install
```bash
# Make executable
chmod +x ut.py

# Create symlink (choose one)
sudo ln -sf $(pwd)/ut.py /usr/local/bin/ut
# OR
ln -sf $(pwd)/ut.py ~/.local/bin/ut
```

## Usage

### Basic Usage
```bash
# Create or activate utenv in current directory
python3 ut.py

# List available Python versions
python3 ut.py --list

# Create utenv with specific Python version
python3 ut.py --python python3.11
```

### Global Installation
```bash
# Install globally
./install.sh

# Then use anywhere
ut
```

### Examples

1. **First time in a directory:**
   ```bash
   $ python3 ut.py
   Using Python version: python3.11
   Creating virtual environment with python3.11...
   Virtual environment created successfully!
   Run 'source utenv/bin/activate' to activate it.
   ```

2. **Subsequent runs in same directory:**
   ```bash
   $ python3 ut.py
   Virtual environment 'utenv' found. Activating...
   source utenv/bin/activate
   ```

3. **List available Python versions:**
   ```bash
   $ python3 ut.py --list
   Available Python versions:
     python3.11: Python 3.11.5
     python3.10: Python 3.10.12
     python3: Python 3.11.5
   ```

4. **Create with specific Python version:**
   ```bash
   $ python3 ut.py --python python3.10
   Using Python version: python3.10
   Creating virtual environment with python3.10...
   Virtual environment created successfully!
   ```

## How it Works

1. **No utenv exists:** Creates a new virtual environment named `utenv` using the latest stable Python version (or specified version)
2. **utenv exists:** Prints the activation command for the existing virtual environment

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