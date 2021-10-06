#!/bin/bash
cd /home/jam/Pictures/latest
rm -f latest.png
flameshot gui --path=/home/jam/Pictures/latest
sleep 8s
upload=$(curl -X POST -F "file=@latest.png" -H "token: tokenhere" https://lewd.se/upload | jq -r '.data.link')
wl-copy $upload
