#!/bin/bash
ssh root@$serverIP -p $sshPort "ls && openssl enc -aes-256-cbc -d -in backup/bw/k.enc -out k.json -k $encryptionPassword && cat k.json && rm k.json && ls"
