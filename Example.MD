root@b1488ee5a812:/# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 7
Server version: 10.9.3-MariaDB-1:10.9.3+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases
    -> ;
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

MariaDB [wp-db]> insert into pro (id,name,code) values(1,'DevOps','DO180');
ERROR 1146 (42S02): Table 'wp-db.pro' doesn't exist
MariaDB [wp-db]> insert into pro (id,name,code) values (1,'DevOps','DO180');
ERROR 1146 (42S02): Table 'wp-db.pro' doesn't exist
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
