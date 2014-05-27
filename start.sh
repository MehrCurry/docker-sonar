#!/bin/bash

echo "Wating for database to come up ..."
sleep 10
echo "CREATE DATABASE IF NOT EXISTS sonar;" | mysql -u admin -h db_1 -p123456
while true; do
/opt/sonarqube/bin/linux-x86-64/sonar.sh console
done
