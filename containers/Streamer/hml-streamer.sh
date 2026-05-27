#!/bin/bash
# Minimal Resource Streaming Watchdog
# Streams a Chromium tab to Twitch using Xorg + FFmpeg
# Restart automatically if something fails

set -euo pipefail

# ===== CONFIG =====
DISPLAY=:0
RTMP_URL="rtmp://live.twitch.tv/app/live_1373506901_JNTzwUoUnFDTmg7ybNeejBVxnfH0mQ"
CHROMIUM_URL="http://10.100.0.12:3000/playlists/play/adm6hxq?kiosk=true&autofitpanels=true"
FONT="/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"
FPS=30
OUTPUT_RES="1920x1080"
RESTART_DELAY=5
# ==================

# --- FUNCTIONS ---
launch_xorg() {
    echo "Starting Xorg..."
    if [ -e /tmp/.X0-lock ]; then
        echo "Removing stale X lock..."
        rm -f /tmp/.X0-lock
    fi
    Xorg $DISPLAY -noreset +extension GLX +extension RANDR +extension RENDER -nocursor &
    sleep 5
}

launch_unclutter() {
    unclutter -display "$DISPLAY" -idle 0 &
    UNCLUTTER_PID=$!
    echo "Cursor will be hidden (PID $UNCLUTTER_PID)"
    sleep 5
}

launch_chromium() {
    echo "Launching Chromium..."
    chromium \
      --no-sandbox \
      --kiosk "$CHROMIUM_URL" \
      --disable-gpu \
      --disable-software-rasterizer \
      --disable-translate \
      --noerrdialogs \
      --window-size=1920,1080 \
      --disable-dev-shm-usage \
      --disable-extensions \
      --disable-background-networking &
    sleep 5
}

start_stream() {
    echo "Starting FFmpeg stream..."
    # Dynamically grab screen dimensions
    SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d'x' -f1)
    SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d'x' -f2)

    ffmpeg \
        -f x11grab -r $FPS -s ${SCREEN_WIDTH}x${SCREEN_HEIGHT} -i $DISPLAY -draw_mouse 0 \
        -vf "scale=$OUTPUT_RES,drawtext=fontfile=$FONT:text='%{localtime\:%Y-%m-%d %H\\:%M\\:%S}':x=20:y=20:fontsize=36:fontcolor=white:box=1:boxcolor=0x00000099" \
        -c:v libx264 -preset veryfast -b:v 4500k -maxrate 4500k -bufsize 9000k \
        -pix_fmt yuv420p -g 60 -c:a aac -b:a 160k -ar 44100 \
        -f flv "$RTMP_URL"
}

# --- MAIN LOOP ---
while true; do
    launch_xorg
    launch_unclutter
    launch_chromium
    if ! start_stream; then
        echo "Stream stopped. Restarting in $RESTART_DELAY seconds..."
        sleep $RESTART_DELAY
        # Kill any leftover Chromium/Xorg processes
        pkill -f chromium || true
        pkill -f Xorg || true
    fi
done
