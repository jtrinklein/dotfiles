#!/bin/bash
set -e

NET_FILE="/Library/Preferences/VMWare Fusion/networking"

if [[ -e "$NET_FILE" ]]; then
  echo "found the networking file."
  sudo gawk -i inplace '{ if ($2 == "VNET_1_HOSTONLY_SUBNET") { $3 = "192.168.56.0"; print } else { print } }' "$NET_FILE"
  echo "successfully updated HOSTONLY subnet to 192.168.56.0"
else
  echo "VMWare  networking file is missing. Please run VMWare then rerun this script"
fi
