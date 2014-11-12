FROM dockerfile/java
MAINTAINER Guido Zockoll

RUN apt-get update && apt-get install -qqy unzip wget mysql-client-5.6

RUN wget -O /tmp/sonarqube.zip http://dist.sonar.codehaus.org/sonarqube-4.5.1.zip
RUN (cd /opt && unzip /tmp/sonarqube.zip)
RUN mv /opt/sonarqube* /opt/sonarqube

RUN rm /tmp/sonarqube.zip
ADD sonar.properties /opt/sonarqube/conf/
ADD start.sh /opt/start.sh

RUN (cd /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/java/sonar-checkstyle-plugin/2.1/sonar-checkstyle-plugin-2.1.jar)
RUN (cd /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-clover-plugin/3.0/sonar-clover-plugin-3.0.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-groovy-plugin/1.0.1/sonar-groovy-plugin-1.0.1.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/javascript/sonar-javascript-plugin/1.6/sonar-javascript-plugin-1.6.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-jira-plugin/1.2/sonar-jira-plugin-1.2.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-ldap-plugin/1.4/sonar-ldap-plugin-1.4.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-motion-chart-plugin/1.6/sonar-motion-chart-plugin-1.6.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/php/sonar-php-plugin/2.2/sonar-php-plugin-2.2.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/java/sonar-pmd-plugin/2.2/sonar-pmd-plugin-2.2.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-quality-index-plugin/1.1.3/sonar-quality-index-plugin-1.1.3.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/scm-activity/sonar-scm-activity-plugin/1.7.1/sonar-scm-activity-plugin-1.7.1.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-taglist-plugin/1.0/sonar-taglist-plugin-1.0.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-timeline-plugin/1.3/sonar-timeline-plugin-1.3.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://repository.codehaus.org/org/codehaus/sonar-plugins/java/sonar-java-plugin/2.4/sonar-java-plugin-2.4.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://dist.sonarsource.com/sqale/download/sonar-sqale-plugin-2.3.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://dist.sonarsource.com/views/download/sonar-views-plugin-2.5.jar)
EXPOSE 9000

CMD /opt/start.sh
