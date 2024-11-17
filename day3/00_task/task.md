# Recreate Python+Redis on Kubernetes


1. Create Deployment for redis with image `redis:5.0.10`
2. Create Deployment for python with image `marcinmakowski/python-api:redis`, point ENVS:
    - REDIS_HOST to redis service
    - REDIS_PORT to redis port
3. Create service for each of those deployments.
4. Access to python with port-forward and check `/api/v1/info` endpoint (python listnens on 5002)
    - POST to this endpoint should work with *OK*
    - GET should return counter
5. Delete everything

# Recreate wordpress + mysql

1. Create Deployment for `mysql:5.7`
2. Create Deployment for `wordpress:php7.4`
3. Create service for each of those deployments
4. Wordpress has bellow envs for connecting to mysql
    - WORDPRESS_DB_HOST
    - WORDPRESS_DB_USER
    - WORDPRESS_DB_PASSWORD
    - WORDPRESS_DB_NAME
5. Mysql has bellow envs:
    - MYSQL_USER
    - MYSQL_PASSWORD
    - MYSQL_DATABASE
    - MYSQL_RANDOM_ROOT_PASSWORD=1
5. Access to wordpress with port-forward (it listens on 80) - `/wp-admin/install.php` should work
6. Delete everything
