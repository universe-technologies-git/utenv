#!/usr/bin/env python3
"""
ut - Python Virtual Environment Manager

A CLI utility for managing Python virtual environments.
Creates a 'utenv' virtual environment if none exists, or activates existing one.
"""

import os
import sys
import subprocess
import argparse
from pathlib import Path
import platform


def get_python_versions():
    """Get available Python versions on the system."""
    versions = []
    
    # Check for python3.x versions
    for version in range(20, 7, -1):  # Check python3.20 down to python3.7
        try:
            result = subprocess.run([f'python3.{version}', '--version'], 
                                  capture_output=True, text=True, timeout=5)
            if result.returncode == 0:
                versions.append(f'python3.{version}')
        except (subprocess.TimeoutExpired, FileNotFoundError):
            continue
    
    # Check for python3
    try:
        result = subprocess.run(['python3', '--version'], 
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            versions.append('python3')
    except (subprocess.TimeoutExpired, FileNotFoundError):
        pass
    
    # Check for python
    try:
        result = subprocess.run(['python', '--version'], 
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            versions.append('python')
    except (subprocess.TimeoutExpired, FileNotFoundError):
        pass
    
    return versions


def get_latest_stable_python():
    """Get the latest stable Python version available."""
    versions = get_python_versions()
    if not versions:
        print("Error: No Python installation found")
        sys.exit(1)
    
    # Prefer python3.x over python3, and python3 over python
    for version in versions:
        if version.startswith('python3.') and version != 'python3':
            return version
    
    # Fallback to python3 or python
    return versions[0]


def venv_exists():
    """Check if utenv virtual environment exists in current directory."""
    utenv_path = Path('utenv')
    return utenv_path.exists() and utenv_path.is_dir() and (utenv_path / 'bin' / 'activate').exists()


def create_venv(python_version):
    """Create a new virtual environment named 'utenv'."""
    print(f"Creating virtual environment with {python_version}...")
    
    try:
        result = subprocess.run([python_version, '-m', 'venv', 'utenv'], 
                              capture_output=True, text=True)
        if result.returncode == 0:
            print("Virtual environment created successfully!")
            print("Run 'source utenv/bin/activate' to activate it.")
        else:
            print(f"Error creating virtual environment: {result.stderr}")
            sys.exit(1)
    except FileNotFoundError:
        print(f"Error: {python_version} not found")
        sys.exit(1)


def activate_venv():
    """Activate the existing utenv virtual environment."""
    if platform.system() == "Windows":
        activate_script = "utenv\\Scripts\\activate"
    else:
        activate_script = "utenv/bin/activate"
    
    if not os.path.exists(activate_script):
        print("Error: Virtual environment activation script not found")
        sys.exit(1)
    
    # Print the activation command for the user to execute
    if platform.system() != "Windows":
        print(f"source {activate_script}")
    else:
        print(f"Call {activate_script}")


def list_python_versions():
    """List all available Python versions."""
    versions = get_python_versions()
    if not versions:
        print("No Python installations found")
        return
    
    print("Available Python versions:")
    for version in versions:
        try:
            result = subprocess.run([version, '--version'], 
                                  capture_output=True, text=True, timeout=5)
            if result.returncode == 0:
                print(f"  {version}: {result.stdout.strip()}")
        except (subprocess.TimeoutExpired, FileNotFoundError):
            print(f"  {version}: Not available")


def main():
    parser = argparse.ArgumentParser(
        description="ut - Python Virtual Environment Manager",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  ut                    # Create or activate utenv
  ut --python python3.11  # Create utenv with specific Python version
  ut --list            # List available Python versions
        """
    )
    
    parser.add_argument(
        '--python', '-p',
        help='Python version to use for creating virtual environment'
    )
    parser.add_argument(
        '--list', '-l',
        action='store_true',
        help='List available Python versions'
    )
    
    args = parser.parse_args()
    
    if args.list:
        list_python_versions()
        return
    
    # Check if utenv already exists
    if venv_exists():
        print("Virtual environment 'utenv' found. Activating...")
        activate_venv()
    else:
        # Determine Python version to use
        if args.python:
            python_version = args.python
        else:
            python_version = get_latest_stable_python()
        
        print(f"Using Python version: {python_version}")
        create_venv(python_version)


if __name__ == '__main__':
    main() 