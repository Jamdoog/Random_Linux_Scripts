#!/bin/bash
# This script installs telegraf on debian. 
apt update && apt -y upgrade
apt install -y gnupg2 curl wget
wget -qO- https://repos.influxdata.com/influxdb.key | apt-key add -
echo "deb https://repos.influxdata.com/debian buster stable" | tee /etc/apt/sources.list.d/influxdb.list
apt update -y 
apt install telegraf -y
rm /etc/telegraf/telegraf.conf
cat > /etc/telegraf/telegraf.conf << EOF

[global_tags]


# Configuration for telegraf agent
[agent]
    interval = "10s"
    debug = false
    hostname = ""
    round_interval = true
    flush_interval = "10s"
    flush_jitter = "0s"
    collection_jitter = "0s"
    metric_batch_size = 1000
    metric_buffer_limit = 10000
    quiet = false
    logfile = ""
    omit_hostname = false

###############################################################################
#                                  OUTPUTS                                    #
###############################################################################

[[outputs.influxdb]]
    urls = ["http://host:port"]
    database = "database"
    timeout = "0s"
    username = "user"
    password = "password"

###############################################################################
#                                  INPUTS                                     #
###############################################################################

[[inputs.cpu]]
    percpu = true
    totalcpu = true
    collect_cpu_time = false
    report_active = false
[[inputs.disk]]
    ignore_fs = ["tmpfs", "devtmpfs", "devfs"]
[[inputs.io]]
[[inputs.mem]]
[[inputs.net]]
[[inputs.system]]
[[inputs.swap]]
[[inputs.netstat]]
[[inputs.processes]]
[[inputs.kernel]]
EOF
