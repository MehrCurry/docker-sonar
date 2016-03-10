Docker Image for Sonarqube
==========================

Run like this:

```
#!/bin/sh

#Setup Data Container
DATA=$(docker ps -a |grep sonar-data | awk '{print $1}')
if [ -z "$DATA" ]; then
  docker run -v /var/lib/mysql --name sonar-data busybox true
fi

docker rm -f sonar-db ||:
docker rm -f sonar-master ||:

docker run -d -p 33306:3306 --name sonar-db --restart=always --volumes-from sonar-data -e MYSQL_PASS=123456 tutum/mysql:5.6
docker run -d -p 9000:9000 --name sonar-master --restart=always --link sonar-db:db gzockoll/sonar
```
