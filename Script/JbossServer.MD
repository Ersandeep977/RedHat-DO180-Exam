# JBoss Application Server

### Pull jboss server inside JDK  
```
docker pull jboss/base-jdk
```
### Downlod the soft where 
```
wget https://github.com/wildfly/wildfly/releases/download/27.0.0.Beta1/wildfly-27.0.0.Beta1.tar.gz
```

## DockerFile
```
FROM jboss/base-jdk:11

MAINTAINER Sandeep Kumar Patel

LABEL "team"="devOps"

# this packegs is download "wget https://github.com/wildfly/wildfly/releases/download/27.0.0.Beta1/wildfly-27.0.0.Beta1.tar.gz" and in local 
COPY wildfly-27.0.0.Beta1.tar.gz .

RUN tar -xzvf wildfly-27.0.0.Beta1.tar.gz

ENV JBOSS_HOME /opt/jboss/wildfly-27.0.0.Beta1

ENV LAUNCH_JBOSS_IN_BACKGROUND true

USER jboss

EXPOSE 8080
EXPOSE 9990
EXPOSE 9999

RUN /opt/jboss/wildfly-27.0.0.Beta1/bin/add-user.sh admin Admin#70365 --silent

CMD ["/opt/jboss/wildfly-27.0.0.Beta1/bin/standalone.sh","-b","0.0.0.0","-bmanagement","0.0.0.0"]
```

## Testing 
```
<local ip>:8080 ---> show Wildfly show the web page
<local ip>:9990 ----> User Name = admin , PW = docker pull jboss/base-jdk
```
