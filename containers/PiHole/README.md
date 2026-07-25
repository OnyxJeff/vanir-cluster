<div align='center'>
  <a href='https://community-scripts.org' target='_blank' rel='noopener noreferrer'>
    <img src='https://github.com/OnyxJeff/vanir-cluster/blob/main/images/pi-hole.png?raw=true' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Pihole (quaternary)</h2>

  <p style='margin: 16px 0;'>
    <a href='https://community-scripts.org/donate' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/❤️-Sponsoring%20%26%20Donations-FF5E5B' alt='Sponsoring and donations' />
    </a>
  </p>

  <p style='margin: 12px 0;'>
    <a href='https://community-scripts.org/scripts/pihole' target='_blank' rel='noopener noreferrer'>
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
Pi-hole is a free, open-source network-level advertisement and Internet tracker blocking application. It runs on a Raspberry Pi or other Linux-based systems and acts as a DNS sinkhole, blocking unwanted traffic before it reaches a user's device. Pi-hole can also function as a DHCP server, providing IP addresses and other network configuration information to devices on a network. The software is highly configurable and supports a wide range of customizations, such as allowing or blocking specific domains, setting up blocklists and whitelists, and customizing the appearance of the web-based interface. The main purpose of Pi-hole is to protect users' privacy and security by blocking unwanted and potentially malicious content, such as ads, trackers, and malware. It is designed to be easy to set up and use, and can be configured through a web-based interface or through a terminal-based command-line interface.

## 🖥️ Deployment
- Created via Proxmox Helper Script: `pihole-ct.sh`
- CT ID: `20803`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `1 vCPU / 512MB / 8GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- Network-wide DNS sinkhole for blocking advertisements, trackers, and malicious domains
- Local DNS resolver for client name resolution and custom host records
- Web-based administration interface for monitoring and configuration
- Query logging and analytics for DNS traffic visibility
- Optional DHCP server functionality for managing network clients

## 🚀 Usage
- Access via web UI: http://<ip_address>/admin
- Configure network clients to use Pi-hole as their DNS resolver
- Manage blocklists, allowlists, and regex filtering rules
- Monitor DNS queries, blocked domains, and client activity through the dashboard
- Use local DNS records for internal hostname resolution

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and *.vars files
  - Web interface authentication settings
  - DNS upstream resolver configuration
  - Blocklist and gravity database settings
  - Network interface and listening mode configuration
  - Query logging and privacy settings
  - DHCP and local DNS settings

## 📌 Notes / TODO
- Configure upstream DNS providers and DNSSEC settings
- Maintain synchronized Pi-hole instances using Nebula Sync
- Place management interfaces behind a reverse proxy with HTTPS where appropriate
- Schedule regular backups of Pi-hole configuration and gravity databases
- Monitor availability and query statistics through Prometheus/Grafana integration
- Document VLAN-specific DNS policies and local DNS records