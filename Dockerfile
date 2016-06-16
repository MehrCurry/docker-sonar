FROM anapsix/alpine-java:8
MAINTAINER Guido Zockoll

RUN wget -O /tmp/sonarqube.zip https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.6.zip
RUN (cd /opt && unzip /tmp/sonarqube.zip)
RUN mv /opt/sonarqube* /opt/sonarqube

RUN rm /tmp/sonarqube.zip
ADD sonar.properties /opt/sonarqube/conf/
ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

WORKDIR /opt/sonarqube/extensions/plugins
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-motion-chart-plugin/1.7/sonar-motion-chart-plugin-1.7.jar
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-timeline-plugin/1.5/sonar-timeline-plugin-1.5.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-3.14.jar
RUN wget http://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-1.4.1.jar
RUN wget https://bintray.com/artifact/download/stevespringett/owasp/org/sonarsource/owasp/sonar-dependency-check-plugin/1.0.3/sonar-dependency-check-plugin-1.0.3.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-groovy-plugin/sonar-groovy-plugin-1.3.1.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-1.2.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scm-svn-plugin/sonar-scm-svn-plugin-1.3.jar
RUN wget https://github.com/SonarQubeCommunity/sonar-css/releases/download/1.10/sonar-css-plugin.jar
RUN wget https://github.com/SonarOpenCommunity/sonar-cxx/releases/download/cxx-0.9.5/sonar-cxx-plugin-0.9.5.jar
WORKDIR /opt/sonarqube

EXPOSE 9000

CMD /opt/start.sh
