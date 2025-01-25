#!/bin/bash

# br-test
BRIDGE_NAME="br-test"

# interface
SLAVE_INTERFACE="enp7s0"


nmcli connection add type bridge con-name "$BRIDGE_NAME" ifname "$BRIDGE_NAME"

nmcli connection add type bridge-slave ifname "$SLAVE_INTERFACE" master "$BRIDGE_NAME"

nmcli connection modify "$BRIDGE_NAME" ipv4.method auto

nmcli connection up "$BRIDGE_NAME"

service NetworkManager restart

systemctl restart systemd-networkd

ip link set "$BRIDGE_NAME" up

