#!/bin/bash
# spoolman-ct.sh
# Script to deploy Spoolman CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of Spoolman CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/spoolman.sh)"
echo "Spoolman CT script finished."