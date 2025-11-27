#!/bin/bash

set -e

echo "Uninstalling logiops configuration and service..."

# Stop service
echo "Stopping logid service..."
sudo systemctl stop logid

# Disable service
echo "Disabling logid service..."
sudo systemctl disable logid

# Remove service file
if [ -f /lib/systemd/system/logid.service ]; then
    echo "Removing logid service file..."
    sudo rm /lib/systemd/system/logid.service
fi

# Reload systemd daemon
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Remove config
if [ -f /etc/logid.cfg ]; then
    echo "Removing /etc/logid.cfg"
    sudo rm /etc/logid.cfg
fi

# Remove backup if it exists
if [ -f /etc/logid.cfg.backup ]; then
    echo "Removing /etc/logid.cfg.backup"
    sudo rm /etc/logid.cfg.backup
fi

echo "✓ Uninstallation complete! Service and config removed."
