#!/bin/bash
# zipline-ct.sh
# Script to deploy Zipline CT via ProxmoxVE helper script

set -euo pipefail

echo "Starting deployment of Zipline CT..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/zipline.sh)"
echo "Zipline CT script finished."