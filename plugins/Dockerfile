FROM alpine:3.4
MAINTAINER Guido Zockoll

# RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community wget ca-certificates

ENV JAVA_VERSION=4.2.1.6971
ENV JAVASCRIPT_VERSION=2.17

# Download to a temporary location
ENV PLUGINS_DIR=/opt/sonarqube/extensions/plugins

WORKDIR $PLUGINS_DIR
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-motion-chart-plugin/1.7/sonar-motion-chart-plugin-1.7.jar
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-timeline-plugin/1.5/sonar-timeline-plugin-1.5.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-$JAVA_VERSION.jar
RUN wget http://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-1.4.1.jar
RUN wget https://bintray.com/artifact/download/stevespringett/owasp/org/sonarsource/owasp/sonar-dependency-check-plugin/1.0.3/sonar-dependency-check-plugin-1.0.3.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-groovy-plugin/sonar-groovy-plugin-1.3.1.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-1.2.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scm-svn-plugin/sonar-scm-svn-plugin-1.3.jar
RUN wget https://github.com/SonarQubeCommunity/sonar-css/releases/download/1.10/sonar-css-plugin.jar
RUN wget http://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-$JAVASCRIPT_VERSION.jar
RUN wget  https://github.com/AmadeusITGroup/sonar-stash/releases/download/1.2.0-rc1/sonar-stash-plugin-1.2.0-SNAPSHOT.jar
VOLUME $PLUGINS_DIR

CMD ls -asl $PLUGINS_DIR
