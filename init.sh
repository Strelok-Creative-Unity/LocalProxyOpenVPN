#!/bin/sh
iptables -t nat -A PREROUTING -i tun0 -j DNAT --to-destination 172.17.0.1
iptables -t nat -A POSTROUTING -d 172.17.0.1 -j MASQUERADE
sh /opt/scripts/start.sh
