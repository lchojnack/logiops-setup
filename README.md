# Logiops Configuration for MX Master 3

Custom configuration for Logitech MX Master 3 wireless mouse using [logiops](https://github.com/PixlOne/logiops).

## Features

### Basic Settings
- **DPI:** 3000 (max 4000)
- **SmartShift:** Enabled with threshold 15
- **Hi-res scroll:** Enabled

### Button Mappings

All buttons support gesture-based controls (hold and swipe in different directions).

#### Top Button (0xc4)
- **Click:** Toggle SmartShift
- **Up:** Meta+L
- **Down:** Meta+K
- **Left:** Meta+J
- **Right:** Meta+;

#### Forward Button (0x56)
- **Click:** Forward navigation
- **Up:** Alt+Tab
- **Down:** Alt+Tab
- **Left:** Alt+J
- **Right:** Alt+;

#### Back Button (0x53)
- **Click:** Back navigation
- **Up:** Meta+Alt+L
- **Down:** Meta+Alt+K
- **Left:** Ctrl+Alt+J
- **Right:** Ctrl+Alt+;

#### Gesture Button (0xc3)
- **Click:** Play/Pause
- **Up:** Volume up
- **Down:** Volume down
- **Left:** Previous song
- **Right:** Next song

## Requirements

- Linux system with systemd
- Logitech MX Master 3 mouse
- logid binary installed at `/usr/local/bin/logid`

**Note:** This package includes the systemd service file, so you only need the logid binary installed, not a full logiops package installation.

## Installation

Run the install script with sudo:

```bash
sudo ./install.sh
```

This will:
- Backup existing `/etc/logid.cfg` (if present)
- Copy `logid.service` to `/lib/systemd/system/`
- Reload systemd daemon
- Copy the new configuration to `/etc/logid.cfg`
- Enable the service (auto-start on boot)
- Restart the logid service
- Verify the service is running

## Uninstallation

Run the uninstall script with sudo:

```bash
sudo ./uninstall.sh
```

This will:
- Stop and disable the logid service
- Remove the service file
- Remove `/etc/logid.cfg` and backup
- Clean up all configuration

## Files

- `logid.cfg` - Mouse configuration file
- `logid.service` - Systemd service file
- `install.sh` - Installation script
- `uninstall.sh` - Uninstallation script
- `README.md` - This file

## Troubleshooting

Check service status:
```bash
sudo systemctl status logid
```

View service logs:
```bash
journalctl -u logid -f
```

## Configuration Source

Based on custom gist configuration optimized for workspace and window management on Linux desktop environments.
