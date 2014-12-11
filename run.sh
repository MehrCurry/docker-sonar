#!/bin/bash

#Setup Data Container
COUNT=$(docker ps -a |grep sonar-data |wc -l)
if [ $COUNT -eq 0 ]; then
  # Create an not running data only cotainer
  docker run -v /var/lib/mysql --name sonar-data busybox true
fi

COUNT=$(docker ps -a |grep sonar-db |wc -l)
if [ $COUNT -eq 0 ]; then
  docker run -d -p 33306:3306 --name sonar-db --volumes-from sonar-data -e MYSQL_PASS=123456 payone/mysql-5.6
fi

docker run -d -p 9000:9000 --name sonar-master --link sonar-db:db_1 sonar
