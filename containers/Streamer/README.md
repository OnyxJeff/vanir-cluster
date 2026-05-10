<div align='center'>
    <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/ffmpeg.png' alt='Logo' style='width:174px;height:112px;'/>
    </a>

<h2 style='font-size: 24px; margin: 20px 0;'>Streamer</h2>

<p style='margin: 16px 0;'>
    <a href='https://community-scripts.org/donate' target='_blank' rel='noopener noreferrer'>
    <img src='https://img.shields.io/badge/❤️-Sponsoring%20%26%20Donations-FF5E5B' alt='Sponsoring and donations' />
    </a>
</p>

<span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
</span>
<span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
</span>
<span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
</span>
</div>


---

# Streamer-Debian Container
- CTID: 21101
- OS: debian
- Created via: Proxmox Helper Scripts
- Notes:
  - Purpose: Streamer
  - Storage: local-lvm
  - Network: static IPv4 bind via DHCP / No IPv6

## Raw Proxmox Config
- arch: amd64
- cores: 4
- features: keyctl=1,nesting=1,fuse=1
- hostname: hml-streamer
- memory: 8196
- net0: name=eth0,bridge=vmbr0,hwaddr=aa:bb:cc:dd:ee:ff,ip=dhcp,type=veth
- onboot: 1
- ostype: debian
- rootfs: local-lvm:vm-*-disk-0,size=10G
- swap: 512
- tags: community-script;
- unprivileged: 1

---

## 📦 Overview
This container provides a lightweight, headless streaming service built on FFmpeg, designed to continuously stream a Grafana playlist (dashboards rendered as video) directly to Twitch. It serves as the foundation for automated “status TV”–style broadcasts from the homelab.

## 🖥️ Deployment
- Created via Proxmox Helper Script: `debian_CT-ct.sh`
- CT ID: `21101`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `2 vCPU / 4096MB / 10GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- FFmpeg (video capture, encoding, and streaming)
- Headless streaming workflow for Grafana dashboards
- Push-based RTMP stream to Twitch

## 🚀 Usage
- Start the streaming service inside the container
- FFmpeg pulls from the Grafana playlist URL and streams to Twitch RTMP ingest
- Stream appears live on the configured Twitch channel

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and `*.vars` files
  - Twitch stream key
  - Grafana playlist URL and auth token (if required)

## 📌 Notes / TODO
- Add systemd service for auto-start and restart
- Tune FFmpeg encoding settings for bitrate and CPU efficiency
- Optional: add “stream offline” fallback screen

- Install dependencies
```bash
apt update
apt install -y \
ffmpeg \
chromium \
xserver-xorg-video-dummy \
xserver-xorg-core \
x11-xserver-utils \
fonts-dejavu \
curl
```

- Xorg Dummy Display

  - Create `/etc/X11/xorg.conf`

  ```bash
  Section "Device"
      Identifier  "Configured Video Device"
      Driver      "dummy"
      VideoRam    256000
  EndSection

  Section "Monitor"
      Identifier  "Configured Monitor"
      HorizSync   5.0 - 1000.0
      VertRefresh 5.0 - 200.0
  EndSection

  Section "Screen"
      Identifier "Default Screen"
      Monitor    "Configured Monitor"
      Device     "Configured Video Device"

      SubSection "Display"
          Depth 24
          Modes "1920x1080"
      EndSubSection
  EndSection
  ```

- Stream Configuration

  - Create `/opt/streamer/stream.conf`

  ```bash
  STREAM_KEY="live_xxxxxxxxx"
  STREAM_URL="rtmp://live.twitch.tv/app"

  DISCORD_WEBHOOK="https://discord.com/api/webhooks/XXXX/XXXX"

  PLAYLIST_URL="https://grafana.example.com/playlists/play/1?kiosk"

  WIDTH=1920
  HEIGHT=1080
  FPS=30

  VIDEO_BITRATE="4500k"
  MAXRATE="5000k"
  BUFSIZE="9000k"

  DISPLAY=":0"
  ```
- Stream Pipeline Script

  - Create `/opt/streamer/start-stream.sh`

  ```bash
  #!/bin/bash

  set -e

  source /opt/streamer/stream.conf

  RESOLUTION="${WIDTH}x${HEIGHT}"

  echo "Starting Xorg..."

  pkill Xorg || true
  Xorg $DISPLAY -noreset +extension GLX +extension RANDR +extension RENDER -nocursor &

  sleep 5

  echo "Launching Chromium..."

  pkill chromium || true

  chromium \
  --kiosk \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu \
  --disable-background-networking \
  --disable-software-rasterizer \
  --disable-infobars \
  --disable-session-crashed-bubble \
  --start-fullscreen \
  --window-size=$WIDTH,$HEIGHT \
  "$PLAYLIST_URL" \
  --display=$DISPLAY &

  sleep 10
  
  /opt/streamer/discord.sh "📺 Twitch Stream is starting."

  echo "Starting FFmpeg stream..."

  ffmpeg -loglevel warning \
  -f x11grab \
  -video_size $RESOLUTION \
  -framerate $FPS \
  -i $DISPLAY.0 \
  -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf:text='%{localtime\:%Y-%m-%d %H\\\\:%M\\\\:%S}':x=20:y=20:fontsize=36:fontcolor=white:box=1:boxcolor=0x00000099" \
  -c:v libx264 \
  -preset veryfast \
  -pix_fmt yuv420p \
  -maxrate $MAXRATE \
  -bufsize $BUFSIZE \
  -g 60 \
  -b:v $VIDEO_BITRATE \
  -f flv \
  "$STREAM_URL/$STREAM_KEY"
  ```

  - Make executable:
  ```bash
  chmod +x /opt/streamer/start-stream.sh
  ```

- Watchdog Script

  - Create `/opt/streamer/watchdog.sh`

  ```bash
  #!/bin/bash
  while true
  do
      echo "Starting Twitch stream pipeline..."
      /opt/streamer/start-stream.sh
      /opt/streamer/discord.sh "⚠️ Twitch Stream stopped. Restarting..."
      sleep 5
  done
  ```

  - Make executable:
  ```bash
  chmod +x /opt/streamer/watchdog.sh
  ```

- Systemd Service

  - Create `/etc/systemd/system/twitch-stream.service`

  ```ini
  [Unit]
  Description=Homelab Grafana Twitch Stream
  After=network.target

  [Service]
  Type=simple
  Restart=always
  RestartSec=5
  ExecStart=/opt/streamer/watchdog.sh

  [Install]
  WantedBy=multi-user.target
  ```

  - Enable it:
  ```bash
  systemctl daemon-reload
  systemctl enable twitch-stream
  systemctl start twitch-stream
  ```

- Daily Restart Service & Timer Service

  - Create `/etc/systemd/system/twitch-stream-restart.service`

  ```ini
  [Unit]
  Description=Restart Twitch Stream

  [Service]
  Type=oneshot
  ExecStart=/bin/systemctl restart twitch-stream.service
  ```

  - Create `/etc/systemd/system/twitch-stream-restart.timer`

  ```ini
  [Unit]
  Description=Daily Restart of Twitch Stream

  [Timer]
  OnCalendar=*-*-* 00:00:00
  Persistent=true

  [Install]
  WantedBy=timers.target
  ```

  - Enable & Start:
  ```bash
  systemctl daemon-reload
  systemctl enable twitch-stream-restart.timer
  systemctl start twitch-stream-restart.timer
  systemctl list-timers | grep twitch
  ```

- Discord Notify Script

  - Create `/opt/streamer/discord.sh`

  ```bash
  #!/bin/bash
  source /opt/streamer/stream.conf

  MSG="$1"

  curl -s -H "Content-Type: application/json" \
  -d "{\"content\":\"$MSG\"}" \
  "$DISCORD_WEBHOOK" > /dev/null
  ```

  - Make executable:
  ```bash
  chmod +x /opt/streamer/discord.sh
  ```

- Hook into `start-stream.sh`
