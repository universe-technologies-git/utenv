#!/usr/bin/env python3
"""
Setup script for utenv - Python Virtual Environment Manager

Note: This project now uses a shell script implementation for better performance.
The Python setup is kept for potential future complex features.
"""

from setuptools import setup

# For now, we're using a shell script implementation
# This setup.py is kept for potential future Python-based features

setup(
    name="utenv-venv",
    version="1.0.0",
    description="A CLI utility for managing Python virtual environments (Shell script implementation)",
    author="Michael Roust",
    py_modules=[],  # No Python modules for now
    scripts=[],     # No Python scripts for now
    entry_points={
        "console_scripts": [
            # No console scripts for now - using shell script
        ],
    },
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
    ],
    python_requires=">=3.7",
) 