```sh
docker network create cms
docker volume create mysqldb
docker image pull mysql:5.7
docker image pull wordpress:php7.4
docker image inspect -f '{{.Config.Volumes}}' mysql:5.7
docker image inspect -f '{{.Config.ExposedPorts}}' wordpress:php7.4

docker container run --name wordpress --network cms -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=exampleuser -e WORDPRESS_DB_PASSWORD=examplepass -e WORDPRESS_DB_NAME=exampledb -p 8080:80 -d wordpress:php7.4

docker container run --name mysql --network cms -e MYSQL_USER=exampleuser -e MYSQL_PASSWORD=examplepass -e MYSQL_DATABASE=exampledb -e MYSQL_RANDOM_ROOT_PASSWORD=1 -d -v mysqldb:/var/lib/mysql mysql:5.7

curl -v http://localhost:8080/wp-admin/install.php
docker container rm -f wordpress mysql
docker network rm cms
docker volume rm mysqldb
```

With MariaDB
```sh
docker container run --name mysql --network cms -e MARIADB_USER=exampleuser -e MARIADB_PASSWORD=examplepass -e MARIADB_DATABASE=exampledb -e MARIADB_ROOT_PASSWORD=examplepass -d -v mysqldb:/var/lib/mysql mariadb:10.9.4
```