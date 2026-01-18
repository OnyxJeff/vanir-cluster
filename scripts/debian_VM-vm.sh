#!/bin/bash
# debian_VM-vm.sh
# Script to deploy a Debian 13 VM via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of Debian 13 VM..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/debian-13-vm.sh)"
echo "Debian 13 VM deployment finished."