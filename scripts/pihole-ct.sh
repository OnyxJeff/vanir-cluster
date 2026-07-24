#!/bin/bash
# pihole-ct.sh
# Script to deploy Pihole CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of Pihole CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pihole.sh)"
echo "Pihole CT deployment finished."