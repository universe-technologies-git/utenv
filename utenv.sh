#!/bin/bash

# utenv - Python Virtual Environment Manager
# A simple CLI utility for managing Python virtual environments

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}$1${NC}"
}

print_success() {
    echo -e "${GREEN}$1${NC}"
}

print_warning() {
    echo -e "${YELLOW}$1${NC}"
}

print_error() {
    echo -e "${RED}$1${NC}"
}

# Function to get available Python versions
get_python_versions() {
    local versions=()
    
    # Check for python3.x versions (newer to older)
    for version in {20..7}; do
        if command -v "python3.$version" >/dev/null 2>&1; then
            versions+=("python3.$version")
        fi
    done
    
    # Check for python3
    if command -v python3 >/dev/null 2>&1; then
        versions+=("python3")
    fi
    
    # Check for python
    if command -v python >/dev/null 2>&1; then
        versions+=("python")
    fi
    
    echo "${versions[@]}"
}

# Function to get the latest stable Python version
get_latest_stable_python() {
    local versions=($(get_python_versions))
    
    if [ ${#versions[@]} -eq 0 ]; then
        print_error "Error: No Python installation found"
        exit 1
    fi
    
    # Prefer python3.x over python3, and python3 over python
    for version in "${versions[@]}"; do
        if [[ $version == python3.* ]] && [[ $version != python3 ]]; then
            echo "$version"
            return 0
        fi
    done
    
    # Fallback to first available version
    echo "${versions[0]}"
}

# Function to check if utenv virtual environment exists
venv_exists() {
    [ -d "utenv" ] && [ -f "utenv/bin/activate" ]
}

# Function to create virtual environment
create_venv() {
    local python_version="$1"
    print_info "Creating virtual environment with $python_version..."
    
    if ! command -v "$python_version" >/dev/null 2>&1; then
        print_error "Error: $python_version not found"
        exit 1
    fi
    
    if "$python_version" -m venv utenv; then
        print_success "Virtual environment created successfully!"
        print_info "Activating virtual environment..."
        activate_venv
    else
        print_error "Error creating virtual environment"
        exit 1
    fi
}

# Function to activate virtual environment
activate_venv() {
    if [ ! -f "utenv/bin/activate" ]; then
        print_error "Error: Virtual environment activation script not found"
        exit 1
    fi
    
    # Check if script is being sourced
    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        print_error "Error: This script must be sourced, not executed."
        print_error "Usage: source utenv.sh"
        exit 1
    fi
    
    print_info "Activating virtual environment..."
    source utenv/bin/activate
    print_success "Virtual environment activated!"
}

# Function to list available Python versions
list_python_versions() {
    local versions=($(get_python_versions))
    
    if [ ${#versions[@]} -eq 0 ]; then
        print_warning "No Python installations found"
        return
    fi
    
    print_info "Available Python versions:"
    for version in "${versions[@]}"; do
        local version_output
        version_output=$("$version" --version 2>/dev/null || echo "Not available")
        echo "  $version: $version_output"
    done
}

# Function to show help
show_help() {
    cat << EOF
utenv - Python Virtual Environment Manager

A simple CLI utility for managing Python virtual environments.

Usage:
  utenv                    # Create or activate utenv
  utenv --python VERSION   # Create utenv with specific Python version
  utenv --list            # List available Python versions
  utenv --help            # Show this help message

Examples:
  utenv                    # Create or activate utenv
  utenv --python python3.11  # Create utenv with specific Python version
  utenv --list            # List available Python versions

EOF
}

# Main function
main() {
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --python|-p)
                PYTHON_VERSION="$2"
                shift 2
                ;;
            --list|-l)
                list_python_versions
                exit 0
                ;;
            --help|-h)
                show_help
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    # Check if utenv already exists
    if venv_exists; then
        print_info "Virtual environment 'utenv' found. Activating..."
        activate_venv
    else
        # Determine Python version to use
        if [ -n "$PYTHON_VERSION" ]; then
            python_version="$PYTHON_VERSION"
        else
            python_version=$(get_latest_stable_python)
        fi
        
        print_info "Using Python version: $python_version"
        create_venv "$python_version"
    fi
}

# Run main function with all arguments
main "$@" 