#!/bin/bash
# PVE_Post_Install.sh
# Script to disable the Enterprise Repo, add or correct PVE source, enable the No-Subscription Repo, add the test Repo, disable the subscription nag, update Proxmox VE, and reboot via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of PVE Post Install Script..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/post-pve-install.sh)"
echo "PVE Post Install script finished."