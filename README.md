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

## 📁 Repo Structure

```text
vanir-1/
├── .github/workflows/    # CI for validation
├── hardware/             # Parts list and hardware used
├── images/               # Photos of hardware and software used
├── notes/                # Setup logs and notes
└── README.md             # You’re reading it!
```

---

## 🧰 Services

![FFMPEG Logo](images/ffmpeg.png)
- Streamer: FFMPEG streamer servicing a virtual display.

![Minecraft Logo](images/minecraft.png)
- Minecraft: 3 separate Minecraft servers being served to Pelican-Panel via Wings.

![Palworld Logo](images/palworld.png)
- Palworld Server: Palword game server being served to Pelican-Panel via Wings.

![Pathfinder 2e Logo](images/pathfinder-2e.png)
- Pathfinder 2e Tools: Self-hosted wiki for Pathfinder 2nd Edition.

![PDM Logo](images/pdm.png)
- ProxMox Datacenter Manager: Self-hosted PVE dashboard for all clusters in a network.

---

## 💾 Backup
All backed up to ProxMox Backup Server being served by TrueNas (Muginn)

---

📬 Maintained by  
Jeff M. • [@OnyxJeff](https://github.com/OnyxJeff)
