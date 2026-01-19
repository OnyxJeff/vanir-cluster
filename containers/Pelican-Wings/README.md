<div align='center'>
    <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/pelican-panel.png' alt='Logo' style='width:174px;height:112px;'/>
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

# Pelican-Panel Container
- CTID: 21702
- OS: debian
- Created via: Proxmox Helper Scripts
- Notes:
  - Purpose: Pelican-Panel
  - Storage: local-lvm
  - Network: static IPv4 bind via DHCP / No IPv6

## Raw Proxmox Config
- arch: amd64
- cores: 2
- features: keyctl=1,nesting=1,fuse=1
- hostname: gms-*serve
- memory: 4096
- net0: name=eth0,bridge=vmbr0,hwaddr=aa:bb:cc:dd:ee:ff,ip=dhcp,type=veth
- onboot: 1
- ostype: debian
- rootfs: local-lvm:vm-*-disk-0,size=8G
- swap: 512
- tags: community-script;Gaming
- unprivileged: 1

---

## 📦 Overview
Pelican Panel is a self-hosted game server management panel designed to deploy, manage, and monitor game servers through a modern web interface. This container hosts the Pelican control panel, providing centralized user management, server provisioning, and resource oversight for homelab-hosted game servers.

## 🖥️ Deployment
- Created via Proxmox Helper Script: `pelican_panel-ct.sh`
- CT ID: `21702`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `2 vCPU / 4GB / 8GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- Pelican Panel web application
- Backend services for server orchestration and management
- API endpoints for automation and integration

## 🚀 Usage
- Access via web UI: `http://<ip_address>`
- Create and manage game servers via the panel
- Assign users, permissions, and resource limits
- Monitor server status and basic metrics

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and `*.vars` files
  - Database credentials
  - Panel encryption keys and app secrets
  - Mail and authentication settings

## 📌 Notes / TODO
- Deploy Wings (node daemon) on compute hosts
- Place panel behind a reverse proxy with HTTPS
- Configure backups and off-site storage
- Lock down panel access with proper roles and permissions