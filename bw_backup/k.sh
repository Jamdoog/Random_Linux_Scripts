#!/bin/bash
yes $bwPassword | bw export --output ~/k.json --format json --session $sessionID
openssl enc -aes-256-cbc -salt -in k.json -out k.enc -k $encryptionPassword
date=`date +%Y-%m-%d--%T`
mv k.enc backup/bw/${date}
rm k.json k.sh
