#!/bin/sh

SUFFIX=-rc

#Setup Data Container
DATA=$(docker ps -a |grep sonar-data$SUFFIX | awk '{print $1}')
if [ -z "$DATA" ]; then
  docker run -v /var/lib/mysql --name sonar-data$SUFFIX busybox true
fi

SONAR=$(docker ps -a |grep sonar-master$SUFFIX | awk '{print $1}')
if [ -n "$SONAR" ]; then
  docker rm -f $SONAR
fi

DB=$(docker ps -a |grep sonar-db$SUFFIX | awk '{print $1}')
if [ -n "$DB" ]; then
  docker rm -f $DB
fi

docker run -d -p 33307:3306 --name sonar-db$SUFFIX --restart=always --volumes-from sonar-data$SUFFIX -e MYSQL_PASS=123456 tutum/mysql:5.6
docker run -d -p 9001:9000 --name sonar-master$SUFFIX --restart=always --link sonar-db$SUFFIX:db gzockoll/sonar:5.0-RC3

