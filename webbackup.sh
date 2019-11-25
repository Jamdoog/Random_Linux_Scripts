#!/bin/bash
date=`date +%Y-%m-%d`
mysqldump -u jdog_k -p${dbPass} jdog_k > ~/web/backup.db
cp /home/jdog.icu/public_html/* ~/web/
zip -r ~/${date}.zip ~/web
rsync -avz -e "ssh -p 5106" ~/${date}.zip root@${sshServer}:~/backup/school
rm ~/${date}.zip
