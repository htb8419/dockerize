FROM 192.168.25.203:8080/library/openjdk:17
USER root
WORKDIR $JAVA_HOME
RUN  mkdir -p ./certs
COPY import-certs.sh ./
COPY ./certs/*.crt ./certs/

RUN  echo "JAVA_HOME=$JAVA_HOME"
RUN  chmod +x ./import-certs.sh
RUN  ./import-certs.sh

RUN keytool -list -cacerts -storepass changeit