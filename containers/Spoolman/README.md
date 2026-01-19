<div align='center'>
    <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/spoolman.png' alt='Logo' style='width:174px;height:112px;'/>
    </a>

<h2 style='font-size: 24px; margin: 20px 0;'>Pf2eTools LXC</h2>

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

# Spoolman Container
- CTID: 21302
- OS: debian
- Created via: Proxmox Helper Scripts
- Notes:
  - Purpose: Spoolman
  - Storage: local-lvm
  - Network: static IPv4 bind via DHCP / No IPv6

## Raw Proxmox Config
- arch: amd64
- cores: 1
- features: keyctl=1,nesting=1,fuse=1
- hostname: hml-skuld
- memory: 1024
- net0: name=eth0,bridge=vmbr0,hwaddr=aa:bb:cc:dd:ee:ff,ip=dhcp,type=veth
- onboot: 1
- ostype: debian
- rootfs: local-lvm:vm-*-disk-0,size=4G
- swap: 512
- tags: community-script;3d-printing
- unprivileged: 1

---

## 📦 Overview
Spoolman is a lightweight filament management system for 3D printing, used to track filament spools, usage, and costs across printers and print jobs. This container provides a centralized Spoolman instance for the homelab, designed to integrate cleanly with OctoPrint, Klipper, and related tooling.

## 🖥️ Deployment
- Created via Proxmox Helper Script: `spoolman-ct.sh`
- CT ID: `21302`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `1 vCPU / 1GB / 4GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- Spoolman web application
- REST API for printer and slicer integrations

## 🚀 Usage
- Access via web UI: `http://<ip_address>:7912`
- Manage filament spools, materials, and usage data
- Integrate with printers and slicers via Spoolman API

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and `*.vars` files

## 📌 Notes / TODO
- Enable authentication or reverse-proxy protection
- Integrate with OctoPrint / Klipper for automatic usage tracking
- Add regular backups of the Spoolman database