# Podman Containers

### mount path
``` /root/WorkSpace/DO180Exam/Mount_Data ```

### Mariadb Environment Variable
``` 
-e MYSQL_ROOT_PASSWORD=... 
-e MYSQL_DATABASE=...
-e MYSQL_USER=... 
-e MYSQL_PASSWORD=... 
```
### Containers create inside webapp pod db mariadb pod 
``` podman run -d --pod new:webapp -e MYSQL_ROOT_PASSWORD="myrootpass" -e MYSQL_DATABASE="wp-db" -e MYSQL_USER="wp-user" -e MYSQL_PASSWORD="wordpress" -v /root/WorkSpace/DO180Exam/Mount_Data:/var/lib/mysql -p 8080:80 --name=mydb mariadb ```

### Wordpress Environment Variable 
```
-e WORDPRESS_DB_HOST=...
-e WORDPRESS_DB_USER=...
-e WORDPRESS_DB_PASSWORD=...
-e WORDPRESS_DB_NAME=...
```
### Container create the wordpress
``` podman run -d --pod="webapp" -e WORDPRESS_DB_HOST="18.223.3.38" -e WORDPRESS_DB_USER="wp-user" -e WORDPRESS_DB_PASSWORD="wordp3" -e WORDPRESS_DB_NAME="wp-db" --name=wptest-web wordpress ```

