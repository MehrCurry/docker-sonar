FROM alpine:3.4
MAINTAINER Guido Zockoll

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community wget ca-certificates

ENV PLUGINS_DIR /opt/sonarqube/extensions/plugins

WORKDIR $PLUGINS_DIR
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-motion-chart-plugin/1.7/sonar-motion-chart-plugin-1.7.jar
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-timeline-plugin/1.5/sonar-timeline-plugin-1.5.jar
RUN wget http://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-1.4.1.jar
RUN wget https://bintray.com/artifact/download/stevespringett/owasp/org/sonarsource/owasp/sonar-dependency-check-plugin/1.0.3/sonar-dependency-check-plugin-1.0.3.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-1.2.jar
RUN wget https://github.com/AmadeusITGroup/sonar-stash/releases/download/1.2.0/sonar-stash-plugin-1.2.0.jar
RUN wget http://nexus.talanlabs.com/content/groups/public_release/com/synaptix/sonar-gitlab-plugin/1.7.0/sonar-gitlab-plugin-1.7.0.jar
RUN wget https://github.com/SonarQubeCommunity/sonar-groovy/releases/download/1.4-RC1/sonar-groovy-plugin-1.4-build514.jar

ENV JAVA_VERSION 4.5.0.8398
RUN wget https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-$JAVA_VERSION.jar

ENV JAVASCRIPT_VERSION 2.20.0.4207
RUN wget https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-$JAVASCRIPT_VERSION.jar

VOLUME $PLUGINS_DIR

CMD ls -asl $PLUGINS_DIR
