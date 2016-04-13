FROM anapsix/alpine-java:8
MAINTAINER Guido Zockoll

RUN wget -O /tmp/sonarqube.zip https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.4.zip
RUN (cd /opt && unzip /tmp/sonarqube.zip)
RUN mv /opt/sonarqube* /opt/sonarqube

RUN rm /tmp/sonarqube.zip
ADD sonar.properties /opt/sonarqube/conf/
ADD start.sh /opt/start.sh

RUN (cd  /opt/sonarqube/extensions/plugins && wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-jira-plugin/1.2/sonar-jira-plugin-1.2.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-motion-chart-plugin/1.7/sonar-motion-chart-plugin-1.7.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-timeline-plugin/1.5/sonar-timeline-plugin-1.5.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-3.13.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget http://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-1.4.1.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget https://bintray.com/artifact/download/stevespringett/owasp/org/sonarsource/owasp/sonar-dependency-check-plugin/1.0.3/sonar-dependency-check-plugin-1.0.3.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget https://sonarsource.bintray.com/Distribution/sonar-groovy-plugin/sonar-groovy-plugin-1.3.1.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-1.2.jar)
RUN (cd  /opt/sonarqube/extensions/plugins && wget https://sonarsource.bintray.com/Distribution/sonar-scm-svn-plugin/sonar-scm-svn-plugin-1.3.jar)

EXPOSE 9000

CMD /opt/start.sh
