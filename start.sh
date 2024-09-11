#!/bin/bash

function restore_dns {
    echo "Restoring DNS to default..."
    sudo networksetup -setdnsservers Wi-Fi empty
    sudo networksetup -setdnsservers Ethernet empty
}

trap restore_dns EXIT

echo "Setting DNS server to 127.0.0.1..."
sudo networksetup -setdnsservers Wi-Fi 127.0.0.1
sudo networksetup -setdnsservers Ethernet 127.0.0.1


if [ $? -ne 0 ]; then
  echo "Failed to set DNS server. Exiting..."
  exit 1
fi

echo "Starting Docker containers..."
docker compose up
