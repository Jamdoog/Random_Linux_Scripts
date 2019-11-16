#!/bin/bash
PASS=''$(cat Password.txt)''
/usr/local/vpnserver/vpncmd /server 127.0.0.1:992 /password:$PASS /adminhub:VPN /cmd UserGet $1