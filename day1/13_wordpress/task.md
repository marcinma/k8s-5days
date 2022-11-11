# Task

Create wordpress site fronted with mysql backend 

1. Containers should be connected to same network
2. Mysql should have volume attached. Check its volume mount point by inspecting image.
3. Wordpress image is `wordpress:php7.4` check its ports and expose it properly
4. Wordpress has bellow envs for connecting to mysql
    - WORDPRESS_DB_HOST 
    - WORDPRESS_DB_USER
    - WORDPRESS_DB_PASSWORD
    - WORDPRESS_DB_NAME
5. Mysql image is `mysql:5.7` and has bellow envs:
    - MYSQL_USER 
    - MYSQL_PASSWORD 
    - MYSQL_DATABASE
    - MYSQL_RANDOM_ROOT_PASSWORD=1
6. Run containers and check everything wokrs
7. At the end remove containers, network and volumes