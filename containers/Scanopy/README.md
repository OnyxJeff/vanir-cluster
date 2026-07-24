<div align='center'>
  <a href='https://community-scripts.org' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/scanopy.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Scanopy LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://community-scripts.org/donate' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/❤️-Sponsoring%20%26%20Donations-FF5E5B' alt='Sponsoring and donations' />
    </a>
  </p>

  <p style='margin: 12px 0;'>
    <a href='https://community-scripts.org/scripts/scanopy' target='_blank' rel='noopener noreferrer'>
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

## 📦 Overview
Automatically discover and visually document network infrastructure

## 🖥️ Deployment
- Created via Proxmox Helper Script: `scanopy-ct.sh`
- CT ID: `21303`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `4 vCPU / 4GB / 8GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- Automatic network discovery and inventory
- Live topology mapping of physical and logical networks
- Service detection for 200+ common applications and platforms
- Agentless network scanning with scheduled updates

## 🚀 Usage
- Access the web UI: http://<ip_address>:60072
- Configure one or more network ranges to scan
- View automatically generated topology maps of hosts, services, VLANs, and network relationships
- Export diagrams in SVG or Mermaid format, or embed them in documentation

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and `*.vars` files
  - Database connection details
  - Network scan ranges and schedules
  - User accounts and role-based access
  - Scanner and discovery settings

## 📌 Notes / TODO
- Place behind a reverse proxy with HTTPS
- Deploy additional scanners for isolated VLANs or remote sites
- Exclude guest and transient networks from discovery
- Integrate exported diagrams into homelab documentation