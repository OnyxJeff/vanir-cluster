#!/usr/bin/env bash
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR="${1:-$BASE_DIR/scripts}"
shopt -s nullglob

scripts=("$SCRIPT_DIR"/*.sh)

if [ ${#scripts[@]} -eq 0 ]; then
  echo "No scripts found in $SCRIPT_DIR"
  exit 1
fi

echo "Select a script to run:"
declare -A menu
i=1

for script in "${scripts[@]}"; do
  filename="$(basename "$script")"
  display="${filename%%-*}"   # everything before first dash
  echo "$i) $display"
  menu[$i]="$script"
  ((i++))
done

echo
read -rp "Enter number: " choice

if [[ -z "${menu[$choice]}" ]]; then
  echo "Invalid choice. Try again, champ."
  exit 1
fi

echo "Running: ${menu[$choice]}"
bash "${menu[$choice]}"
