#!/bin/bash

set -e

echo "Installing logiops service and configuration..."

# Check if logid is installed
if ! command -v logid &> /dev/null; then
    echo "Error: logid is not installed. Please install logiops first."
    exit 1
fi

# Backup existing config if it exists
if [ -f /etc/logid.cfg ]; then
    echo "Backing up existing config to /etc/logid.cfg.backup"
    sudo cp /etc/logid.cfg /etc/logid.cfg.backup
fi

# Copy service file
echo "Copying logid.service to /lib/systemd/system/"
sudo cp logid.service /lib/systemd/system/

# Reload systemd daemon
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Copy new config
echo "Copying logid.cfg to /etc/logid.cfg"
sudo cp logid.cfg /etc/logid.cfg

# Enable and restart service
echo "Enabling and restarting logid service..."
sudo systemctl enable logid
sudo systemctl restart logid

# Check service status
if systemctl is-active --quiet logid; then
    echo "✓ Installation complete! logid service is running."
else
    echo "✗ Warning: logid service is not running. Check 'sudo systemctl status logid' for details."
    exit 1
fi
