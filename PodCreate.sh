#! /bin/bash

# Delete all the pod in wepapp
echo ""
echo ""
echo "Show all Pod.."
echo""
podman pod list
echo ""
echo "Now Delete all the container inside pod webapp "
podman pod rm -f webapp
echo ""
echo ""
echo "Created the MYSQL container  inside the webapp"
echo ""
podman run -d --pod new:webapp -e MYSQL_ROOT_PASSWORD="myrootpass" -e MYSQL_DATABASE="wp-db" -e MYSQL_USER="wp-user" -e MYSQL_PASSWORD="wordpress" -v /root/WorkSpace/DO180Exam/Mount_Data:/var/lib/mysql -p 8080:80 --name=mydb mariadb
echo "Mariadb container created..."
echo "show the runing container "
podman pod list
echo ""
podman ps
echo ""
echo "Created the Wordpress container.."
echo""
podman run -d --pod="webapp" -e WORDPRESS_DB_HOST="18.223.3.38" -e WORDPRESS_DB_USER="wp-user" -e WORDPRESS_DB_PASSWORD="wordp3" -e WORDPRESS_DB_NAME="wp-db" --name=wptest-web wordpress
echo ""
echo "Show the running container.."
podman pod list
echo ""
podman ps
echo ""
echo "######################################......THANK YOU........###################################"
