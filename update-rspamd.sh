#!/bin/bash
cd rspamd_rules
git pull https://github.com/mxroute/rspamd_rules/
cp local.d/force_actions.conf /opt/mailcow-dockerized/data/conf/rspamd/local.d -u
cp local.d/multimap.conf /opt/mailcow-dockerized/data/conf/rspamd/local.d -u
cp local.d/mx_check.conf /opt/mailcow-dockerized/data/conf/rspamd/local.d -u
cp -u lists/* /opt/mailcow-dockerized/data/conf/rspamd/custom 
cp -u override.d/* /opt/mailcow-dockerized/data/conf/rspamd/override.d 
cd /opt/mailcow-dockerized
docker-compose down
docker-compose up -d
