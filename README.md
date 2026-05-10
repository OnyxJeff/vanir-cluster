# Vanir-Cluster

![Build Status](https://github.com/OnyxJeff/vanir-cluster/actions/workflows/build.yml/badge.svg)
![Maintenance](https://img.shields.io/maintenance/yes/2026.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![GitHub release](https://img.shields.io/github/v/release/OnyxJeff/vanir-cluster)
![Issues](https://img.shields.io/github/issues/OnyxJeff/vanir-cluster)

Vanir is the scrappy Intel NUC hero of the homelab — small but shockingly capable.  
It runs on an i5-5300U, 16GB of RAM, and enough determination to power a small village.

### 🧭 Purpose
Vanir handles lightweight LXCs, development tools, streaming utilities, and auxiliary services.  
Think of it as the utility knife of the environment: not the strongest, but always handy.

### 🏗️ Current Highlights
- All-LXC setup for minimal overhead
- Streamer LXC using FFMPEG to broadcast Grafana dashboards to Twitch (for science… or bragging)
- Pathfinder 2e wiki/tools container for instant rule lookups
- Proxmox Datacenter Manager for keeping the larger cluster honest

## 📂 Directory Structure
```text
vanir-cluster/
├── .github/workflows/
├── containers/
│ ├── Pathfinder2eTools/
│ │ └── README.md
│ ├── Pelican-Wings/
│ │ └── ...
│ └── ...
├── hardware/
│ └── parts-list.md
├── images/
│ ├── <container>.png
│ ├── <container>.png
│ ├── ...
│ └── ...
├── scripts/
│ ├── <container>-ct.sh
│ └── <virtual machince>-vm.sh
├── vars/
│ ├── <ct>.vars
│ ├── <vm>.vars
│ └── ...
├── VMs/
│ ├── Future_VM/
│ └── Netboot-XYZ/
│   └── README.md
├── .gitignore
├── game_server_requirements.md
├── ID-naming-scheme.md
├── LICENSE
├── README.md
└── script-runner.sh
```

---

## 🧰 Services

- Streamer
- - FFMPEG streamer servicing a virtual display.
- Minecraft
- - 3 separate Minecraft servers being served to Pelican-Panel via Wings.
- Palworld Server
- - Palword game server being served to Pelican-Panel via Wings.
- Pathfinder 2e Tools
- - Self-hosted wiki for Pathfinder 2nd Edition.
- ProxMox Datacenter Manager
- - Self-hosted PVE dashboard for all clusters in a network.
- Spoolman
- - Self-hosted web service designed to help efficiently manage 3D printer filament spools and monitor their usage

---

## 💾 Backup
All backed up to ProxMox Backup Server being served by TrueNas (Muginn)

---

📬 Maintained by  
Jeff M. • [@OnyxJeff](https://github.com/OnyxJeff)
