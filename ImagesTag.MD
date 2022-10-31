```
podman commit offical-httpd patelsandeep88-httpd
 1035  podman commit offical-httpd patelsandeep88/httpd
 1036  podman ps
 1037  podman images
 1038  podman tag patelsandeep88/httpd quay.io/patelsandeep88/httpd:v1
 1039  podman images
 1040  podman quay.io
 1041  podman login quay.io
 1042  podman login quay.io -u patelsandeep88 -p patel@97700
 1043  podman login quay.io -u patelsandeep88@gmail.com -p patel@97700
 1045  podman push
 1046  podman push quay.io/patelsandeep88/httpd:v1
 1047  podman images
 1048  docker info
 1049  docker login -u patel977 
 1050  podman images
 1053  docker tag docker.io/library/mariadb docker.io/patel977/mariyadb:v1
 1054  podman images
 1055  docker push docker.io/patel977/mariyadb:v1
 1056  podman login quay.io -u patelsandeep88 -p patel@97700
 1057  podman images
 1058  podman push quay.io/patelsandeep88/httpd:v1
 1060  podman tag docker.io/patel977/mariyadb:v1 quay.io/patelsandeep88/mariyadb:v1
 1061  podman images
 1062  podman push quay.io/patelsandeep88/mariyadb:v1

```
```
[root@ip-172-31-47-238 WorkSpace]# docker login -u patel977 -p patel@97700
Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
Login Succeeded!

[root@ip-172-31-47-238 WorkSpace]# podman images
REPOSITORY                      TAG         IMAGE ID      CREATED         SIZE
localhost/patelsandeep88/httpd  latest      c8a4773d739a  13 minutes ago  150 MB
quay.io/patelsandeep88/httpd    v1          c8a4773d739a  13 minutes ago  150 MB
localhost/patelsandeep88-httpd  latest      c1237ceec8cf  16 minutes ago  150 MB
docker.io/library/mysql         latest      c2c2eba5ae85  3 days ago      548 MB
docker.io/library/mariadb       latest      7d424d763ecb  5 days ago      390 MB
docker.io/library/httpd         latest      fe8735c23ec5  6 days ago      150 MB

[root@ip-172-31-47-238 WorkSpace]# docker tag docker.io/library/mariadb docker.io/patel977/mariyadb:v1
Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.

[root@ip-172-31-47-238 WorkSpace]# podman images
REPOSITORY                      TAG         IMAGE ID      CREATED         SIZE
quay.io/patelsandeep88/httpd    v1          c8a4773d739a  16 minutes ago  150 MB
localhost/patelsandeep88/httpd  latest      c8a4773d739a  16 minutes ago  150 MB
localhost/patelsandeep88-httpd  latest      c1237ceec8cf  18 minutes ago  150 MB
docker.io/library/mysql         latest      c2c2eba5ae85  3 days ago      548 MB
docker.io/library/mariadb       latest      7d424d763ecb  5 days ago      390 MB
docker.io/patel977/mariyadb     v1          7d424d763ecb  5 days ago      390 MB
docker.io/library/httpd         latest      fe8735c23ec5  6 days ago      150 MB

[root@ip-172-31-47-238 WorkSpace]# docker push docker.io/patel977/mariyadb:v1
Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
Getting image source signatures
Copying blob 277ba65b7b58 skipped: already exists
Copying blob b781bd302033 skipped: already exists
Copying blob 4c212c849be3 skipped: already exists
Copying blob 601d852bb0dd skipped: already exists
Copying blob 03b161233052 skipped: already exists
Copying blob 301a8b74f71f skipped: already exists
Copying blob 8bb6c9c85752 skipped: already exists
Copying blob 95e7aaf8abc4 skipped: already exists
Copying blob 080fe63cadbf skipped: already exists
Copying blob dc7f64710d12 skipped: already exists
Copying blob 7a77a75bba5d skipped: already exists
Copying config 7d424d763e done
Writing manifest to image destination
Storing signatures

[root@ip-172-31-47-238 WorkSpace]# podman login quay.io -u patelsandeep88
Login Succeeded!

[root@ip-172-31-47-238 WorkSpace]# podman images
REPOSITORY                      TAG         IMAGE ID      CREATED         SIZE
quay.io/patelsandeep88/httpd    v1          c8a4773d739a  20 minutes ago  150 MB
localhost/patelsandeep88/httpd  latest      c8a4773d739a  20 minutes ago  150 MB
localhost/patelsandeep88-httpd  latest      c1237ceec8cf  22 minutes ago  150 MB
docker.io/library/mysql         latest      c2c2eba5ae85  3 days ago      548 MB
docker.io/library/mariadb       latest      7d424d763ecb  5 days ago      390 MB
docker.io/patel977/mariyadb     v1          7d424d763ecb  5 days ago      390 MB
docker.io/library/httpd         latest      fe8735c23ec5  6 days ago      150 MB

[root@ip-172-31-47-238 WorkSpace]# podman push quay.io/patelsandeep88/httpd:v1
Getting image source signatures
Copying blob 36de10a434ef done
Copying blob 13fb8799144c done
Copying blob 6437b1170b0b done
Copying blob f9a57612d059 done
Copying blob 1617cfaff5dd done
Copying blob a12586ed027f done
Copying config c8a4773d73 done
Writing manifest to image destination
Storing signatures

[root@ip-172-31-47-238 WorkSpace]# podman tag docker.io/patel977/mariyadb:v1 quay.io/patelsandeep88/mariyadb:v1

[root@ip-172-31-47-238 WorkSpace]# podman images
REPOSITORY                       TAG         IMAGE ID      CREATED         SIZE
localhost/patelsandeep88/httpd   latest      c8a4773d739a  23 minutes ago  150 MB
quay.io/patelsandeep88/httpd     v1          c8a4773d739a  23 minutes ago  150 MB
localhost/patelsandeep88-httpd   latest      c1237ceec8cf  26 minutes ago  150 MB
docker.io/library/mysql          latest      c2c2eba5ae85  3 days ago      548 MB
docker.io/patel977/mariyadb      v1          7d424d763ecb  5 days ago      390 MB
quay.io/patelsandeep88/mariyadb  v1          7d424d763ecb  5 days ago      390 MB
docker.io/library/mariadb        latest      7d424d763ecb  5 days ago      390 MB
docker.io/library/httpd          latest      fe8735c23ec5  6 days ago      150 MB

[root@ip-172-31-47-238 WorkSpace]# podman push quay.io/patelsandeep88/mariyadb:v1
Getting image source signatures
Copying blob 2366cc4369f7 done
Copying blob aae57931aee1 done
Copying blob bcc8c46ce4fa done
Copying blob 7ea4455e747e done
Copying blob ef25aac237e1 done
Copying blob ce4104715936 done
Copying blob e38e2890064a done
Copying blob 31ad68c05ee7 done
Copying blob ec0a80c55bf7 done
Copying blob dada546c2562 done
Copying blob 61f0af7ffc0b done
Copying config 7d424d763e done
Writing manifest to image destination
Storing signatures
```
