```sh
docker network create cms
docker volume create mysqldb
docker image inspect -f '{{.ContainerConfig.Volumes}}' mysql:5.7
docker image inspect -f '{{.ContainerConfig.ExposedPorts}}' wordpress:php7.4

docker container run --name wordpress --network cms -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=exampleuser -e WORDPRESS_DB_PASSWORD=examplepass -e WORDPRESS_DB_NAME=exampledb -p 8080:80 -d wordpress:php7.4

docker container run --name mysql --network cms -e MYSQL_USER=exampleuser -e MYSQL_PASSWORD=examplepass -e MYSQL_DATABASE=exampledb -e MYSQL_RANDOM_ROOT_PASSWORD=1 -d -v mysqldb:/var/lib/mysql mysql:5.7

docker container rm -f wordpress mysql
docker network rm cms
docker volume rm mysqldb
```