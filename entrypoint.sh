#!/bin/sh

pkill -9 nginx
/usr/sbin/nginx
# Start the second process
/usr/bin/python3 /opt/dns.py --ip ENV --whitelist all --allow-all
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start dns: $status"
  exit $status
fi
