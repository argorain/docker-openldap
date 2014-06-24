#!/bin/sh

echo "docker.io run --name $testContainer $runOptions -d $testImage"
ID=`docker.io run --name $testContainer $runOptions -d $testImage`
sleep 10

echo " --> Obtaining IP"
IP=`docker.io inspect -f "{{ .NetworkSettings.IPAddress }}" $ID`
if [ "$IP" = "" ]; then
	abort "Unable to obtain container IP"
	exit 1
else
  echo " -->" $IP
fi
