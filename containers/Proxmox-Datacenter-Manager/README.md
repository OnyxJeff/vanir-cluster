<div align='center'>
    <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/pdm.png' alt='Logo' style='width:174px;height:112px;'/>
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

# Proxmox Datacenter Manager Container
- CTID: 21301
- OS: debian
- Created via: Proxmox Helper Scripts
- Notes:
  - Purpose: Proxmox Datacenter Manager
  - Storage: local-lvm
  - Network: static IPv4 bind via DHCP / No IPv6

## Raw Proxmox Config
- arch: amd64
- cores: 2
- features: keyctl=1,nesting=1,fuse=1
- hostname: hml-skuld
- memory: 2048
- net0: name=eth0,bridge=vmbr0,hwaddr=aa:bb:cc:dd:ee:ff,ip=dhcp,type=veth
- onboot: 1
- ostype: debian
- rootfs: local-lvm:vm-*-disk-0,size=10G
- swap: 512
- tags: community-script;datacenter
- unprivileged: 1

---

## 📦 Overview
Proxmox Datacenter Manager provides a centralized web interface for managing multiple Proxmox VE nodes and clusters from a single pane of glass. This container is used to aggregate visibility, simplify administration, and reduce context-switching across the homelab’s Proxmox infrastructure.

## 🖥️ Deployment
- Created via Proxmox Helper Script: `Proxmox_Datacenter_Manager-ct.sh`
- CT ID: `21301`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `2 vCPU / 2GB / 10GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- Proxmox Datacenter Manager web application
- Centralized API access to multiple Proxmox VE clusters

## 🚀 Usage
- Access via web UI: `http://<ip_address>:8443`
- View and manage nodes, clusters, storage, and workloads
- Perform common administrative tasks from a single interface

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and *.vars files
- Proxmox API tokens used for read/write access to managed clusters 

## 📌 Notes / TODO
- Restrict access via reverse proxy and authentication
- Scope API tokens to least-privilege roles
- Document supported Proxmox VE versions and limitations