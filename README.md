# Podman Containers

### mount path
``` /root/WorkSpace/DO180Exam/Mount_Data ```

### Containers create inside webapp pod db mariadb pod 
```
podman run -d --pod webapp 
-e MYSQL_ROOT_PASSWORD=root 
-e MYSQL_DATABASE=db 
-e MYSQL_USER=root 
-e MYSQL_PASSWORD=root 
-v /root/WorkSpace/DO180Exam/Mount_Data:/var/lib/mysql 
--name=mydb mariadb
```
``` podman run -d --pod new:webapp -e MYSQL_ROOT_PASSWORD="myrootpass" -e MYSQL_DATABASE="wp-db" -e MYSQL_USER="wp-user" -e MYSQL_PASSWORD="wordpress" -v /root/WorkSpace/DO180Exam/Mount_Data:/var/lib/mysql -p 8080:80 --name=mydb mariadb ```

### Container create the wordpress 
```
-e WORDPRESS_DB_HOST=...
-e WORDPRESS_DB_USER=...
-e WORDPRESS_DB_PASSWORD=...
-e WORDPRESS_DB_NAME=...
```
```
podman run -d --pod="webapp" -e WORDPRESS_DB_HOST="18.223.3.38" -e WORDPRESS_DB_USER="wp-user" -e WORDPRESS_DB_PASSWORD="wordp3" -e WORDPRESS_DB_NAME="wp-db" --name=wptest-web wordpress 
```
