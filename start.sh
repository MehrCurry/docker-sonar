#!/bin/bash

echo "Wating for database to come up ..."
sleep 15
while true; do
/opt/sonarqube/bin/linux-x86-64/sonar.sh start && tail -f /opt/sonarqube/logs/sonar.log
done
