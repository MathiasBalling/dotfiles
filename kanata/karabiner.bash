#!/bin/bash

# Variables
KARABINER_PATH="/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon"
SUDOERS_FILE="/etc/sudoers.d/karabiner"
PLIST_FILE="/Library/LaunchDaemons/com.balling.karabiner.plist"
STD_LOG="$HOME/.config/kanata/karabiner.std.log"
ERROR_LOG="$HOME/.config/kanata/karabiner.error.log"

# Create a sudoers file entry for karabiner
echo "$(whoami) ALL=(ALL) NOPASSWD: $KARABINER_PATH" | sudo tee "$SUDOERS_FILE" >/dev/null

# Create a plist file for the LaunchDaemon
cat <<EOF | sudo tee "$PLIST_FILE" >/dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.balling.karabiner</string>

    <key>ProgramArguments</key>
    <array>
        <string>$KARABINER_PATH</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>

    <key>StandardErrorPath</key>
    <string>$ERROR_LOG</string>

    <key>StandardOutPath</key>
    <string>$STD_LOG</string>
</dict>
</plist>
EOF

# Load the daemon
sudo launchctl bootstrap system "$PLIST_FILE"
