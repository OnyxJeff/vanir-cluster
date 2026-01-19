<div align='center'>
    <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/pathfinder-2e.png' alt='Logo' style='width:174px;height:112px;'/>
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

# Pathfinder 2e Tools/Wiki Container
- CTID: 21701
- OS: debian
- Created via: Proxmox Helper Scripts
- Notes:
  - Purpose: Pathfinder 2nd Edition Tools/Wiki
  - Storage: local-lvm
  - Network: static IPv4 bind via DHCP / No IPv6

## Raw Proxmox Config
- arch: amd64
- cores: 1
- features: keyctl=1,nesting=1,fuse=1
- hostname: hml-pf2etools
- memory: 512
- net0: name=eth0,bridge=vmbr0,hwaddr=aa:bb:cc:dd:ee:ff,ip=dhcp,type=veth
- onboot: 1
- ostype: debian
- rootfs: local-lvm:vm-*-disk-0,size=6G
- swap: 512
- tags: community-script;wiki
- unprivileged: 1

---

## 📦 Overview
Pathfinder 2e Tools (pf2eTools) is a self-hosted web application that provides fast access to Pathfinder 2e rules content, references, and utilities. This container hosts a private, always-available instance for table use, prep work, and general rules lookups—no ads, no downtime, no excuses.

## 🖥️ Deployment
- Created via Proxmox Helper Script: `pf2etools-ct.sh`
- CT ID: `21701`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `1 vCPU / 512MB / 6GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- pf2eTools web application
- Static content server for Pathfinder 2e rules and references

## 🚀 Usage
- Access via web UI: `http://<ip_address>`
- Browse rules, spells, feats, items, and bestiary content
- Suitable for GM prep, player reference, and in-session use

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and `*.vars` files

## 📌 Notes / TODO
- Add reverse proxy and HTTPS
- Implement access controls if exposed externally
- Schedule content updates as part of maintenance workflow