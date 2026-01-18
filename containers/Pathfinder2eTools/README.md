# Beszel

![Screenshot](../../images/beszel.png)

## 📦 Overview
Beszel is a lightweight monitoring and metrics collector that integrates seamlessly with Grafana (Mimir) to visualize performance data across containers and servers in the homelab.

## 🖥️ Deployment
- Created via Proxmox Helper Script: `beszel-ct.sh`
- CT ID: `20301`
- OS / Template: Debian-based LXC template (from script)
- CPU / RAM / Storage: `1 vCPU / 512MB / 5GB`
- Network: Configured via script (bridge and static IP settings)

## 🧰 Services
- Beszel monitoring agent and dashboard
- Exposes metrics compatible with Prometheus and Grafana

## 🚀 Usage
- Access via web UI: `http://<ip_address>:8090`
- Integrate with Grafana on Mimir using Prometheus endpoints

## 🔐 Configuration
- Environment variables and secrets are set via the helper script and `.settings` files
  - examples in `lxc-config.conf`
- Configuration files stored inside `/config` volume mounted in the container 

## 📌 Notes / TODO
- Enable authentication for dashboard (optional)
- Add alert rules for critical thresholds