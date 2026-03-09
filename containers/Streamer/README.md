<div align='center'>
    <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/ffmpeg.png' alt='Logo' style='width:174px;height:112px;'/>
    </a>

<h2 style='font-size: 24px; margin: 20px 0;'>Streamer LXC</h2>

<p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
    <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
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
- CPU / RAM / Storage: `4 vCPU / 8196MB / 10GB`
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