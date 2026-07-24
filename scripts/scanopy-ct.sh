#!/bin/bash
# scanopy-ct.sh
# Script to deploy a Scanopy CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of Scanopy CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/scanopy.sh)"
echo "Scanopy CT deployment finished."