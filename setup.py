#!/usr/bin/env python3
"""
Setup script for ut - Python Virtual Environment Manager
"""

from setuptools import setup

with open("ut.py", "r") as f:
    content = f.read()
    # Extract version from the script (we'll add one)
    version = "1.0.0"

setup(
    name="ut-venv",
    version=version,
    description="A CLI utility for managing Python virtual environments",
    author="ut",
    py_modules=["ut"],
    scripts=["ut.py"],
    entry_points={
        "console_scripts": [
            "ut=ut:main",
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