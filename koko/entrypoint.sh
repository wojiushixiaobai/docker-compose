#!/bin/sh
#

if [ ! -f "/opt/coco/config.yml" ]; then
    cp /opt/coco/config_example.yml /opt/coco/config.yml
    sed -i '5d' /opt/coco/config.yml
    sed -i "5i CORE_HOST: $CORE_HOST" /opt/coco/config.yml
    sed -i "s/BOOTSTRAP_TOKEN: <PleasgeChangeSameWithJumpserver>/BOOTSTRAP_TOKEN: $BOOTSTRAP_TOKEN/g" /opt/coco/config.yml
    sed -i "s/# LOG_LEVEL: INFO/LOG_LEVEL: ERROR/g" /opt/coco/config.yml
fi

sleep 5s
while ! nc -z core 8080;
do
    echo "wait for jms_core ready"
    sleep 2s
done
sleep 5s

cd /opt/coco
./koko
