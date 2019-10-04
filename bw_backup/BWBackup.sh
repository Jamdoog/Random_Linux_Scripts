#!/bin/bash
rsync -avz -e "ssh -p $sshPort" ~/Desktop/k.sh root@$serverIP:~/
ssh root@$serverIP -p $sshPort "chmod +x k.sh && ./k.sh"
