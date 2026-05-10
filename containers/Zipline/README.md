<div align='center'>
    <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/zipline.png' alt='Logo' style='width:174px;height:112px;'/>
    </a>

<h2 style='font-size: 24px; margin: 20px 0;'>Zipline</h2>

<p style='margin: 16px 0;'>
    <a href='https://community-scripts.org/donate' target='_blank' rel='noopener noreferrer'>
    <img src='https://img.shields.io/badge/❤️-Sponsoring%20%26%20Donations-FF5E5B' alt='Sponsoring and donations' />
    </a>
</p>

<p style='margin: 12px 0;'>
    <a href='https://community-scripts.org/scripts/zipline' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/📦-Open%20Script%20Page-00617f' alt='Open script page' />
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

# Zipline Container
- CTID: 21801
- OS: debian
- Created via: Proxmox Helper Scripts
- Notes:
  - Purpose: Zipline
  - Storage: local-lvm
  - Network: static IPv4 bind via DHCP / No IPv6

## Raw Proxmox Config
- arch: amd64
- cores: 2
- features: keyctl=1,nesting=1,fuse=1
- hostname: hml-zippy
- memory: 2048
- net0: name=eth0,bridge=vmbr0,hwaddr=aa:bb:cc:dd:ee:ff,ip=dhcp,type=veth
- onboot: 1
- ostype: debian
- rootfs: local-lvm:vm-*-disk-0,size=5G
- swap: 512
- tags: community-script;file;sharing
- unprivileged: 1

---

## 📦 Overview
Zipline is a lightweight, self-hosted file upload and sharing service designed for quick uploads, short links, and easy sharing across the homelab. This container provides a private alternative to public file hosts for screenshots, clips, logs, and other transient files.

## 🖥️ Deployment
- Created via Proxmox Helper Script: `zipline-ct.sh`
- CT ID: `21801`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `2 vCPU / 2GB / 5GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- Zipline web application
- REST API for uploads and link management
- Local file storage backend

## 🚀 Usage
- Access via web UI: `http://<ip_address>`
- Upload files via web interface, API, or CLI tools
- Share files using automatically generated short URLs

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and `*.vars` files
  - Database connection details
  - Storage path and retention settings
  - Authentication and user management options

## 📌 Notes / TODO
- Place behind a reverse proxy with HTTPS
- Configure upload limits and retention policies
- Add automated backups for uploaded content