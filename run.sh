#!/bin/sh

docker rm -f sonar-master ||:
docker run -d -p 9000:9000 --name sonar-master --restart=always -v $(pwd)/sonar.properties:/opt/sonarqube/conf/sonar.properties gzockoll/sonar
