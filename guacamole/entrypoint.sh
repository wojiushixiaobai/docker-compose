#!/bin/bash
#

rm -rf /config/guacamole/data/log/*
rm -rf /config/tomcat9/logs/*

sleep 5s
while ! nc -z core 8080;
do
    echo "wait for jms_core ready"
    sleep 2s
done
sleep 5s

guacd &
cd /config/tomcat9/bin && ./startup.sh

echo "Guacamole version 1.5.2, more see https://www.jumpserver.org"
echo "Quit the server with CONTROL-C."

if [ ! -f "/config/guacamole/data/log/info.log" ]; then
    echo "" > /config/guacamole/data/log/info.log
fi

tail -f /config/guacamole/data/log/info.log
