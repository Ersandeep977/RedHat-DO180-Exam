# Lunch MariaDB DataBase Inside Container
```
podman run -d -e MYSQL_ROOT_PASSWORD="myrootpass" -e MYSQL_DATABASE="wp-db" -e MYSQL_USER="wp-user" -e MYSQL_PASSWORD="wordpress" -p 8080:80 --name=mydb mariadb
```
## Output -
```
[root@ip-172-31-47-238 WorkSpace]# podman run -d -e MYSQL_ROOT_PASSWORD="myrootpass" -e MYSQL_DATABASE="wp-db" -e MYSQL_USER="wp-user" -e MYSQL_PASSWORD="wordpress" -p 8080:80 --name=mydb mariadb
Resolved "mariadb" as an alias (/var/cache/containers/short-name-aliases.conf)
Trying to pull docker.io/library/mariadb:latest...
Getting image source signatures
Copying blob 601d852bb0dd done
Copying blob 301a8b74f71f done
Copying blob 277ba65b7b58 done
Copying blob 03b161233052 done
Copying blob b781bd302033 done
Copying blob 4c212c849be3 done
Copying blob 95e7aaf8abc4 done
Copying blob 8bb6c9c85752 done
Copying blob 080fe63cadbf done
Copying blob dc7f64710d12 done
Copying blob 7a77a75bba5d done
Copying config 7d424d763e done
Writing manifest to image destination
Storing signatures
b1488ee5a812998003ef742945dd09e64de50b0ffff682b3e6be1825ac09cd5d

[root@ip-172-31-47-238 WorkSpace]# podman ps
CONTAINER ID  IMAGE                             COMMAND     CREATED        STATUS            PORTS                 NAMES
b1488ee5a812  docker.io/library/mariadb:latest  mariadbd    9 seconds ago  Up 9 seconds ago  0.0.0.0:8080->80/tcp  mydb

[root@ip-172-31-47-238 WorkSpace]# podman exec -it mydb /bin/bash

root@b1488ee5a812:/# whoami

root@b1488ee5a812:/# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 7
Server version: 10.9.3-MariaDB-1:10.9.3+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| wp-db              |
+--------------------+
5 rows in set (0.002 sec)

MariaDB [(none)]> use wp-db;
Database changed

MariaDB [wp-db]> CREATE TABLE Pro(id int(10) NOT NULL,name varchar(100) DEFAULT NULL,code varchar(100) DEFAULT NULL,PRIMARY KEY (id));
Query OK, 0 rows affected (0.010 sec)

MariaDB [wp-db]> show tables;
+-----------------+
| Tables_in_wp-db |
+-----------------+
| Pro             |
+-----------------+
1 row in set (0.000 sec)

MariaDB [wp-db]> insert into Pro (id,name,code) values (1,'DevOps','DO180');
Query OK, 1 row affected (0.003 sec)

MariaDB [wp-db]> select *from Pro;
+----+--------+-------+
| id | name   | code  |
+----+--------+-------+
|  1 | DevOps | DO180 |
+----+--------+-------+
1 row in set (0.000 sec)

MariaDB [wp-db]> insert into Pro (id,name,code) values (2,'SQL','Ex200');
Query OK, 1 row affected (0.003 sec)

MariaDB [wp-db]> select *from Pro;
+----+--------+-------+
| id | name   | code  |
+----+--------+-------+
|  1 | DevOps | DO180 |
|  2 | SQL    | Ex200 |
+----+--------+-------+
2 rows in set (0.000 sec)
```
## docker persistent volume attach
```
podman run -d --name persist-db -e MYSQL_ROOT_PASSWORD=r00tpa55 -e MYSQL_DATABASE=items -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 -v /opt/wordpr:/var/lib/mysql --pod wordprs mysql
```
selinux enabled


