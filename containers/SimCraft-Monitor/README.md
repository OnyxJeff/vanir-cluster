<div align='center'>
  <a href='https://www.simulationcraft.org/' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/simc.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>SimulationCraft Monitor</h2>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/simulationcraft/simc' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/simulationcraft/simc/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/simulationcraft/simc/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>

---

## 📦 Overview

This LXC monitors the SimulationCraft nightly repository and automatically downloads the latest **Windows 64-bit builds**, retaining only the newest **3 builds** locally.

Older builds are automatically removed to prevent storage creep.

Source:
http://downloads.simulationcraft.org/nightly/

Purpose:
- Practice lightweight automation
- Maintain rolling access to recent win64 builds
- Experiment with rclone + cron workflows
- Serve as a foundation for future automation experiments

---

## 🏷 Environment Classification

| Attribute | Value |
|------------|--------|
| Cluster | **Vanir (Experimental)** |
| Tier | Automation / Sandbox |
| Criticality | Non-Critical |
| Failure Impact | Minor inconvenience |

This container exists purely for experimentation and convenience.  
It is not part of the Aesir production stack.

---

## 🖥️ Deployment Summary

| Setting | Value |
|----------|--------|
| Hostname | `hml-simc` |
| Created Via | Proxmox Helper Script (Debian LXC) |
| OS Template | Debian |
| CPU | 1 vCPU |
| RAM | 512MB |
| Storage | 8GB |
| Network | vmbr0 (DHCP or static) |
| On Boot | Enabled |
| Unprivileged | Yes |

Minimal resources by design.

---

## 🧰 Services Included

- `rclone` (HTTP remote sync)
- Bash automation script
- Cron scheduler

Primary script:
```bash
/opt/simc-sync.sh
```

Download location:
```bash
/srv/simc-win64
```

---

## 🌐 Source Repository

Nightly builds hosted by the SimulationCraft project.

Filter applied:
- `*win64*.zip`

Retention policy:
- Keep newest 3 builds
- Delete older local builds automatically

---

## 🔄 Automation

Cron job:
```bash
*/30 * * * * /opt/simc-sync.sh >> /var/log/simc-sync.log 2>&1
```

Each execution:

1. Lists remote nightly builds
2. Filters `*win64*.zip`
3. Sorts newest first
4. Ensures newest 3 builds exist locally
5. Removes local builds outside the newest 3

Script is idempotent and safe to run repeatedly.

---

## 🧱 Raw Proxmox Config

```yaml
arch: amd64
cores: 1
memory: 512
swap: 512
hostname: svc-heimdall-simc
ostype: debian
rootfs: local-lvm:vm-local-disk-0,size=8G
net0: name=eth0,bridge=vmbr0,ip=dhcp,type=veth
onboot: 1
unprivileged: 1
tags: vanir;automation;simc
features: keyctl=1
```

---

## 📂 File Structure

```bash
/opt/simc-sync.sh
/srv/simc-win64/
/var/log/simc-sync.log
```

---

## 🔐 Configuration

rclone remote:
```bash
simc:
```
Type:
```bash
http
```
URL:
```bash
http://downloads.simulationcraft.org/nightly/
```
No authentication required (public HTTP).

---

## 📊 Monitoring

Optional only:
- Basic container uptime monitoring
- Manual log inspection
- Future webhook alert experimentation

No SLA. No alerts waking anyone up.

---

## 📌 Notes / TODO
- Add Discord webhook notification
- Maintain latest symlink
- Auto-extract newest build
- Mirror to NAS
- Serve builds via nginx