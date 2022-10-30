#! /bin/bash

# Delete the all the continer
echo "Delete the all the continer.."
podman pod rm -f wordprs
sleep 2

# Create podman pod Name is wordprs
echo "Create podman pod Name is wordprs..."
podman pod create -n wordprs -p 80:80
echo ""
echo "Pod Creation .... 'OK'"
echo ""

# Create Podman Container MySQL
echo "Create Podman Container MySQL..."
sleep 2
podman run -d --name persist-db -e MYSQL_ROOT_PASSWORD=r00tpa55 -e MYSQL_DATABASE=items -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 --pod wordprs mysql
echo ""
echo "MYSQL Container......'OK'"

# Crate podman Container Wordpress
echo "Crate podman Container Wordpress..."
sleep 2
podman run -d --name my-wordpress --pod wordprs -e WORDPRESS_DB_HOST=127.0.0.1 -e WORDPRESS_DB_USER=user1 -e WORDPRESS_DB_PASSWORD=mypa55 -e WORDPRESS_DB_NAME=items wordpress
echo ""
echo "WORDPRESS Container.....'OK'"

# Show the Pod and Container
echo ""
sleep 3
echo "Pod list Show ..."
podman pod list

# Show the list of the container
echo "Show the list of the Running container.."
sleep 3
podman ps
echo ""
echo ".....Thank You..."
