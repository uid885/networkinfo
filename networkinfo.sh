#!/bin/bash
###########################################################
# Author      : Christo Deale                  
# Date        : 2023-07-25             
# networkinfo: Utility to list Active Network Information
###########################################################
# Get the connected device
connected_device=$(ip route | awk '/default/ {print $5}')

# Get network configuration details
hostname=$(hostname -f)
config=$(nmcli connection show "$connected_device" | awk '/IP4.ADDRESS/ {address=$2} /IP4.GATEWAY/ {gateway=$2} /IP4.DNS/ {dns=$2} END {print address, gateway, dns}')

# Print the table
printf "%-15s %-15s %-15s %-15s %-15s\n" "Hostname" "Device" "Address" "Gateway" "DNS" "$hostname" "$connected_device" $config
