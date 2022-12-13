# Create compose file for nginx, python, redis

1. Web (nginx) service
- create index.htm and mount with `volumes` in yaml to `/usr/share/nginx/html/`
- use image `nginx:1.15.5`

2. Python service
- add service with `python` image builded in day1/03_build_python_image and expose on port `5002`
- alternatively you can use hub image `marcinmakowski/python-api:redis`
- add `depends_on:` to python to depend on redis
- don't use port forward nginx
- scale service `docker-compose up -d --scale web=3`
- `docker-compose exec python curl web` should access created index.htm
- `docker-compose down` stops & removes all stuff (see help)
- run single service `docker-compose up -d python`, should start redis

# check containers 

`docker-compose up -d`
enter into service

```sh
docker-compose exec web /bin/bash
```

# Load balancing

- scale web service to 3 instances
- execute multiple curls to nginx service from python service
- check all logs
- follow logs only from service with nginx image

