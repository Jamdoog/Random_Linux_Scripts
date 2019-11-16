#!/bin/bash
PASS=''$(cat Password.txt)''
/usr/local/vpnserver/vpncmd /server 127.0.0.1:992 /password:$PASS /adminhub:VPN /cmd UserCreate $1 /GROUP: Discord /REALNAME: $1 /NOTE:$1
/usr/local/vpnserver/vpncmd /server 127.0.0.1:992 /password:$PASS /adminhub:VPN /cmd UserPasswordSet $1 /Password:$2
