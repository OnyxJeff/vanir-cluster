#!/bin/bash
# Pathfinder2e_Tools-ct.sh
# Script to deploy Pf2eTools CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of Pf2eTools CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pf2etools.sh)"
echo "Pf2eTools CT deployment finished."