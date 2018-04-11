#! /bin/bash

service postgresql start 2>&1 | tee -a /tmp/log.txt
sleep 3
kong start --vv 2>&1 | tee -a /tmp/log.txt

while true; do sleep 10000; done;