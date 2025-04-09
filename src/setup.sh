#!/bin/bash

# Check if Python 3.5 or later is installed
if ! command -v python3 &> /dev/null
then
    echo "Python 3.5 or later is not installed. Please install it and run this script again."
    exit
fi

# Install pip if not already installed
if ! command -v pip3 &> /dev/null
then
    echo "pip3 is not installed. Installing pip3..."
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    rm get-pip.py
fi

# Install Magenta library
echo "Installing Magenta library..."
pip3 install magenta

echo "Setup complete. You can now run the macOS app."
