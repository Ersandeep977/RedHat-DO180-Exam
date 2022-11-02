# JBoss Application Server
![](https://www.endpointdev.com/blog/2017/07/jboss-456-to-wildfly-migration-tips/image-0.jpeg)
https://www.dnsstuff.com/what-is-jboss-application-server
https://www.endpointdev.com/blog/2017/07/jboss-456-to-wildfly-migration-tips/image-0.jpeg
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
## Run Command
```
podman images
podman build -t jbossapp:v1 .
podman run -it --name wbjbos1 -p 8080:8080 -p 9990:9990 jbossapp:v1
podman ps
podman logs wbjbos1
podman logs --tail 10 wbjbos1
```
## Testing 
```
<local ip>:8080 ---> show Wildfly show the web page
<local ip>:9990 ----> User Name = admin , PW = docker pull jboss/base-jdk
```
## Some Script 
### Running.sh
```
#! /bin/bash
# this script for running container in background
podman run -dit --name webcon1 -p 12080:8080 -p 12990:9990 -p 12999:9999  jbossapp:v1
```
```
ls
chmod +x Running.sh
./Running.sh
``` 
### Stop.sh
```
#! /bin/bash
# this script stop the runnig webcon1 container
podman stop webcon1 
```
```
ls
chmod +x Stop.sh
./Stop.sh
```
### Delete.sh
```
#! /bin/bash
# this script for delete container 
podman rm -f webcon1 
```
```
ls
chmod +x  Delete.sh
./ Delete.sh
```
### ShowLog.sh
```
#! /bin/bash
# this script for Show log only 10 line  
podman logs --tail 10 webcon1 
```
```
ls
chmod +x ShowLog.sh
./ShowLog.sh
```
