#!/bin/bash
set -e

service netdata start &

source /etc/apache2/envvars
/usr/local/bin/docker-entrypoint.sh apache2

tail -f /dev/null