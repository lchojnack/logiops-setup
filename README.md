# Logiops Configuration for MX Master 3

Custom configuration for Logitech MX Master 3 wireless mouse using [logiops](https://github.com/PixlOne/logiops).

## Features

### Basic Settings
- **DPI:** 4000 (max 4000)
- **SmartShift:** Enabled with threshold 15
- **Hi-res scroll:** Enabled

### Button Mappings

All buttons support gesture-based controls (hold and swipe in different directions).

#### Top Button (0xc4)
- **Click:** Meta+Page Up - Maximise Window
- **Up:** Meta+Up - Quick Tile Window to the Top
- **Down:** Meta+Down - Quick Tile Window to the Bottom
- **Left:** Meta+Left - Quick Tile Window to the Left
- **Right:** Meta+Right - Quick Tile Window to the Right

#### Forward Button (0x56)
- **Click:** Enter
- **Up:** Arrow Up
- **Down:** Arrow Down
- **Left:** Alt+H - Switch to Previous Desktop
- **Right:** Alt+L - Switch to Next Desktop

#### Back Button (0x53)
- **Click:** Back navigation
- **Up:** Meta+Alt+Page Up - Add Virtual Desktop
- **Down:** Meta+Alt+Page Down - Remove Virtual Desktop
- **Left:** Ctrl+Alt+H - Window to Previous Desktop
- **Right:** Ctrl+Alt+L - Window to Next Desktop

#### Gesture Button (0xc3)
- **Click:** Play/Pause media
- **Up:** Volume up
- **Down:** Volume down
- **Left:** Previous track
- **Right:** Next track

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
