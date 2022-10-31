# Podman Containers
![](https://developers.redhat.com/sites/default/files/styles/article_feature/public/blog/2018/08/podman-logo-source-1.png?itok=FNzmSODk)
## Official website
### Podman 
https://podman.io/getting-started/installation
### Docker Hub
https://hub.docker.com
### Redhat container registry
https://catalog.redhat.com/software/containers/search?p=1

## RHEL8
Podman is included in the container-tools module, along with Buildah and Skopeo.
```
sudo yum module enable -y container-tools:rhel8
sudo yum module install -y container-tools:rhel8
podman info
```
## Ubuntu
The podman package is available in the official repositories for Ubuntu 20.10 and newer.
```
sudo apt-get -y update
sudo apt-get -y install podman
podman info
```
## Container
#### Mariadb Environment Variable
``` 
-e MYSQL_ROOT_PASSWORD=... 
-e MYSQL_DATABASE=...
-e MYSQL_USER=... 
-e MYSQL_PASSWORD=... 
```
#### Containers create inside webapp pod db mariadb pod 
``` podman run -d --pod new:webapp -e MYSQL_ROOT_PASSWORD="myrootpass" -e MYSQL_DATABASE="wp-db" -e MYSQL_USER="wp-user" -e MYSQL_PASSWORD="wordpress" -v            /root/WorkSpace/DO180Exam/Mount_Data:/var/lib/mysql -p 8080:80 --name=mydb mariadb ```

#### Wordpress Environment Variable 
```
-e WORDPRESS_DB_HOST=...
-e WORDPRESS_DB_USER=...
-e WORDPRESS_DB_PASSWORD=...
-e WORDPRESS_DB_NAME=...
```
#### Container create the wordpress
``` podman run -d --pod="webapp" -e WORDPRESS_DB_HOST="18.223.3.38" -e WORDPRESS_DB_USER="wp-user" -e WORDPRESS_DB_PASSWORD="wordp3" -e WORDPRESS_DB_NAME="wp-db" --name=wptest-web wordpress ```

### Create Wordpress Continer with mysql database
```
podman pod create -n wordpresspod -p 80:80

podman run -d --name persist-db -e MYSQL_ROOT_PASSWORD=r00tpa55 -e MYSQL_DATABASE=items -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 --pod wordpresspod mysql

podman pod list
podman ps

podman run -d --name my-wordpress --pod=wordpresspod -e WORDPRESS_DB_HOST=127.0.0.1 -e WORDPRESS_DB_USER=user1 -e WORDPRESS_DB_PASSWORD=mypa55 -e WORDPRESS_DB_NAME=items wordpress
```
