#!/bin/bash
# netbootxyz-ct.sh
# Script to deploy NetbootXYZ CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of NetbootXYZ CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/debian.sh)"
echo "NetbootXYZ CT deployment finished."