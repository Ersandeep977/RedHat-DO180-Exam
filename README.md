# Containerization
### This Document Created by 'Sandeep Kumar Patel' for understanding Containers 
![](https://developers.redhat.com/sites/default/files/styles/article_feature/public/blog/2018/08/podman-logo-source-1.png?itok=FNzmSODk)
## Official website
### Podman 
https://podman.io/getting-started/installation
### Podman Doc Page
https://docs.podman.io/en/latest/Commands.html
### Docker Hub
https://hub.docker.com
### RedHat Container Registry(quay.io)
https://quay.io/repository
### Redhat container registry
https://catalog.redhat.com/software/containers/search?p=1

### RHEL8
Podman is included in the container-tools module, along with Buildah and Skopeo.
```
sudo yum module enable -y container-tools:rhel8
sudo yum module install -y container-tools:rhel8
podman info
```
### Ubuntu
The podman package is available in the official repositories for Ubuntu 20.10 and newer.
```
sudo apt-get -y update
sudo apt-get -y install podman
podman info
```
## Podman: Managing pods and containers in a local container runtime
![](https://developers.redhat.com/blog/wp-content/uploads/2019/01/podman-pod-architecture.png)
## Docker container lifecycle management
![](https://blog.kakaocdn.net/dn/cCeXhL/btq8b2w2tyH/nE2s8ocHe7n6YArIJOFm60/img.png)

## Podman: Managing pods and containers in a local container runtime
![](https://darumatic.com/media/blog_pics/2020_01/Docker_vs_Podman.png)

## Container
#### Mariadb Environment Variable
``` 
-e MYSQL_ROOT_PASSWORD=... 
-e MYSQL_DATABASE=...
-e MYSQL_USER=... 
-e MYSQL_PASSWORD=... 
```
## Example
### Lunch the MySql Container
```
 podman run -d --name Mysql-basic -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 -e MYSQL_ROOT_PASSWORD=r00tpa55 -e MYSQL_DATABASE=items  mysql
```
#### Container create inside webapp pod db mariadb pod 
``` 
podman run -d --pod new:webapp -e MYSQL_ROOT_PASSWORD="myrootpass" -e MYSQL_DATABASE="wp-db" -e MYSQL_USER="wp-user" -e MYSQL_PASSWORD="wordpress" -p 8080:80 --name=mydb mariadb
```
## docker persistent volume attach
![](https://miro.medium.com/max/624/1*j0g82wL5oUl3dgwIXZBIpA.png)
### Mount The Volume /var/lib/mysql
## Selinux enabled
```
mkdir -pv /var/local/mysql
semanage fcontext -a -t container_file_t '/var/local/mysql(/.*)?'
restorecon -R /var/local/mysql
ls -dZ /var/local/mysql
chown -Rv 27:27 /var/local/mysql
```
#### -v /opt/wordpr:/var/lib/mysql
```
podman run -d --name persist-db -e MYSQL_ROOT_PASSWORD=r00tpa55 -e MYSQL_DATABASE=items -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 -v /opt/wordpr:/var/lib/mysql --pod wordprs mysql
```
## Container networking
![](https://net.cloudinfrastructureservices.co.uk/wp-content/uploads/2021/08/docker-architecture.png)
### Published ports
By default, when you create or run a container using docker create or docker run, it does not publish any of its ports to the outside world. To make a port available to services outside of Docker, or to Docker containers which are not connected to the container’s network, use the --publish or -p flag. This creates a firewall rule which maps a container port to a port on the Docker host to the outside world. Here are some examples.
```
Flag --->value ---------->Description
1. -p ==>8080:80	==>Map TCP port 80 in the container to port 8080 on the Docker host.
2. -p ==>192.168.1.100:8080:80	===>Map TCP port 80 in the container to port 8080 on the Docker host for connections to host IP 192.168.1.100.
3. -p ==> 8080:80/udp ==>Map UDP port 80 in the container to port 8080 on the Docker host.
4. -p ==> 8080:80/tcp -p 8080:80/udp	==>Map TCP port 80 in the container to TCP port 8080 on the Docker host, and map UDP port 80 in the container to UDP port 8080 on the Docker host.
```
#### Wordpress Environment Variable 
```
-e WORDPRESS_DB_HOST=...
-e WORDPRESS_DB_USER=...
-e WORDPRESS_DB_PASSWORD=...
-e WORDPRESS_DB_NAME=...
```
#### Container create the wordpress
``` 
podman run -d --pod="webapp" -e WORDPRESS_DB_HOST="18.223.3.38" -e WORDPRESS_DB_USER="wp-user" -e WORDPRESS_DB_PASSWORD="wordp3" -e WORDPRESS_DB_NAME="wp-db" --name=wptest-web wordpress
```

### Create Wordpress Continer with mysql database
```
podman pod create -n wordpresspod -p 80:80

podman run -d --name persist-db -e MYSQL_ROOT_PASSWORD=r00tpa55 -e MYSQL_DATABASE=items -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 --pod wordpresspod mysql

podman pod list
podman ps

podman run -d --name my-wordpress --pod=wordpresspod -e WORDPRESS_DB_HOST=127.0.0.1 -e WORDPRESS_DB_USER=user1 -e WORDPRESS_DB_PASSWORD=mypa55 -e WORDPRESS_DB_NAME=items wordpress
```
## OpenShift
### New App using template(postgresql-ephemeral)
```
oc new-app --template="openshift/postgresql-ephemeral" -p POSTGRESQL_USER="vimal" -p POSTGRESQL_PASSWORD="redhat" -p POSTGRESQL_DATABASE="lwdb" -p DATABASE_SERVICE_NAME="mydb" -l "app=mydb" -l "mydc=india"
```
#### command in power sheel
```
\oc.exe  get pods -o wide | grep Running | grep mydb |awk '{print $6}
```
### Some other command
```
oc -n lwnewproject get po -l db=database -oname
oc get pod | grep Running | grep nodejs |awk '{print $1}'

oc logs $(oc get pod | grep Running | grep nodejs |awk '{print $1}')
oc -n lwnewproject logs –tail=10

oc rsync info.sh $(oc get pod | grep Running | grep nodejs |awk '{print $1}'):data
oc -n lwnewproject rsync info.sh $i:/data;

oc exec -it $(oc get pod | grep Running | grep nodejs |awk '{print $1}') ./data/info.sh
oc -n lwnewproject exec -it $i - ./data/info.sh; 
```
