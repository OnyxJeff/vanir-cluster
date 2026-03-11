#!/bin/bash

REMOTE_URL="http://downloads.simulationcraft.org/nightly"
LOCAL="/srv/simc_win64"
DISCORD_WEBHOOK="<WEBHOOK_URL>"

mkdir -p "$LOCAL"

# Function to send Discord notification
send_discord() {
    local MESSAGE="$1"
    curl -s -H "Content-Type: application/json" \
         -X POST \
         -d "{\"content\":\"$MESSAGE\"}" \
         "$DISCORD_WEBHOOK"
}

# List all win64 .7z files from remote
FILES=$(curl -s "$REMOTE_URL/" | grep -oP 'href="\K.*win64.*\.7z(?=")')

# Build list with Last-Modified timestamp
TMP_LIST=$(mktemp)

for FILE in $FILES; do
    TS=$(curl -sI "$REMOTE_URL/$FILE" | grep -i '^Last-Modified:' | cut -d' ' -f2-)
    if [ -n "$TS" ]; then
        EPOCH=$(date -d "$TS" +%s)
        echo "$EPOCH $FILE" >> "$TMP_LIST"
    fi
done

# Sort descending, keep 3 newest
NEWEST=$(sort -nr "$TMP_LIST" | head -n 3 | awk '{print $2}')

# Download missing files
for FILE in $NEWEST; do
    BASENAME=$(basename "$FILE")
    if [ ! -f "$LOCAL/$BASENAME" ]; then
        echo "Downloading $BASENAME"
        rclone copyurl "$REMOTE_URL/$FILE" "$LOCAL/$BASENAME"
        send_discord "🚀 New SimulationCraft nightly downloaded in SimC LXC: $BASENAME"
    fi
done

# Remove older builds
for LOCALFILE in "$LOCAL"/*.7z; do
    BASENAME=$(basename "$LOCALFILE")
    if ! echo "$NEWEST" | grep -q "$BASENAME"; then
        echo "Removing old build $BASENAME"
        rm -f "$LOCALFILE"
        send_discord "🗑️ Removed old SimulationCraft build: $BASENAME"
    fi
done

rm -f "$TMP_LIST"