#!/bin/bash

# Variables
KANATA_PATH="$HOME/.cargo/bin/kanata<"
KANATA_CFG_PATH="$HOME/.config/kanata/config.kbd"
SUDOERS_FILE="/etc/sudoers.d/kanata"
PLIST_FILE="/Library/LaunchDaemons/com.balling.kanata.plist"
STD_LOG="$HOME/.config/kanata/kanata.std.log"
ERROR_LOG="$HOME/.config/kanata/kanata.error.log"

# Create a sudoers file entry for kanata
echo "$(whoami) ALL=(ALL) NOPASSWD: $KANATA_PATH" | sudo tee "$SUDOERS_FILE" >/dev/null

# Create a plist file for the LaunchDaemon
cat <<EOF | sudo tee "$PLIST_FILE" >/dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.balling.kanata</string>

    <key>ProgramArguments</key>
    <array>
        <string>$KANATA_PATH</string>
        <string>-c</string>
        <string>$KANATA_CFG_PATH</string>
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
