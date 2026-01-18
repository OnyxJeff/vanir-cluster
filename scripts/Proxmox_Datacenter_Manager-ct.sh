#!/bin/bash
# Proxmox_Datacenter_Manager-ct.sh
# Script to deploy Proxmox Datacenter Manager CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of Proxmox Datacenter Manager CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/proxmox-datacenter-manager.sh)"
echo "Proxmox Datacenter Manager CT deployment finished."