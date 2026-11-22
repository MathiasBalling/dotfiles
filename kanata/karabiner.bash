#!/bin/bash

# Variables
KARABINER_PATH="/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon"
SUDOERS_FILE="/etc/sudoers.d/karabiner"
PLIST_LABEL="com.balling.karabiner"
PLIST_FILE="/Library/LaunchDaemons/$PLIST_LABEL.plist"
ERROR_LOG="$HOME/.config/kanata/error_karabiner.log"

# Create a sudoers file entry for karabiner (validated with visudo before installing).
# Spaces in the command path must be escaped with a backslash in sudoers.
TMP_SUDOERS="$(mktemp)"
echo "$(whoami) ALL=(ALL) NOPASSWD: ${KARABINER_PATH// /\\ }" >"$TMP_SUDOERS"
if sudo visudo -cf "$TMP_SUDOERS" >/dev/null; then
    sudo install -m 0440 -o root -g wheel "$TMP_SUDOERS" "$SUDOERS_FILE"
else
    echo "Invalid sudoers entry, not installing $SUDOERS_FILE" >&2
fi
rm -f "$TMP_SUDOERS"

# Create a plist file for the LaunchDaemon
cat <<EOF | sudo tee "$PLIST_FILE" >/dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$PLIST_LABEL</string>

    <key>ProgramArguments</key>
    <array>
        <string>$KARABINER_PATH</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <!-- Restart only on failure/crash, not after a clean exit -->
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
        <key>Crashed</key>
        <true/>
    </dict>

    <key>StandardErrorPath</key>
    <string>$ERROR_LOG</string>

    <key>ProcessType</key>
    <string>Interactive</string>

    <key>Nice</key>
    <integer>-20</integer>
</dict>
</plist>
EOF

# (Re)load the daemon; bootout first so the script can be re-run
sudo launchctl bootout system "$PLIST_FILE" 2>/dev/null || true
sudo launchctl bootstrap system "$PLIST_FILE"
