# Wordpress in compose

1. Recreate wordpress with mysql from day1/13_wordpress task in docker compose file
2. Attach volumes to `/var/www/html` in wordpress service and `/var/lib/mysql` to mysql
3. Volumes can be defined at root level of compose files as:
```yml
volumes:
  vol1:
  vol2:
```
3. Run containers from docker compose and check everything works
