#!/bin/bash
# netboot-ct.sh
# Script to deploy NetBoot.XYZ CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of NetBoot.XYZ CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/netboot-xyz.sh)"
echo "NetBoot.XYZ CT script finished."