FROM amazoncorretto:8-al2-full

LABEL project="corretto-tomcat"
LABEL maintainer "charly.loggar"

EXPOSE 8080

RUN yum -y update && \
  yum install -y wget gzip tar git

# tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz -P /tmp && \
  tar xvf /tmp/apache-tomcat-9.0.50.tar.gz -C /opt && \
  ln -s /opt/apache-tomcat-9.0.50/ /opt/tomcat

# maven
RUN wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz -P /tmp && \
  tar xvf /tmp/apache-maven-3.8.1-bin.tar.gz -C /opt && \
  ln -s /opt/apache-maven-3.8.1 /opt/apache-maven

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
