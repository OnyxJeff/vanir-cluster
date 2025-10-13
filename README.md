# Vanir-1

Welcome to **Vanir-Cluster**, a core node in my personal homelab running Proxmox in High Availability mode. This node hosts essential cloud services including Nextcloud and Immich, plus various personal containers designed to keep my projects and daily workflows running smoothly and reliably.

![Build Status](https://github.com/OnyxJeff/vanir-cluster/actions/workflows/build.yml/badge.svg)
![Maintenance](https://img.shields.io/maintenance/yes/2025.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![GitHub release](https://img.shields.io/github/v/release/OnyxJeff/vanir-cluster)
![Issues](https://img.shields.io/github/issues/OnyxJeff/vanir-cluster)

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

![Netboot.XYZ Logo](images/netboot.png)
- Netboot.xyz: Self-hosted PXE boot tool.

---

## 💾 Backup
All backed up to ProxMox Backup Server being served by TrueNas (Muginn)

---

📬 Maintained by  
Jeff M. • [@OnyxJeff](https://github.com/OnyxJeff)
