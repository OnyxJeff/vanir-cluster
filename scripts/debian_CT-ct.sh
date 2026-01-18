#!/bin/bash
# debian_CT-ct.sh
# Script to deploy a Debian CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of Debian CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/debian.sh)"
echo "Debian CT deployment finished."