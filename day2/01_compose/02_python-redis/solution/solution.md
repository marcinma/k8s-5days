```sh
docker-compose up -d --scale web=3
docker-compose exec python-redis curl web
docker-compose down
docker-compose up -d python-redis

docker-compose up -d
docker-compose exec web /bin/bash

docker-compose up -d --scale web=3

docker-compose exec python-redis curl web
docker-compose exec python-redis curl web
docker-compose exec python-redis curl web

docker-compose logs
docker-compose logs -f web

docker-compose down
docker-compose up -d python-redis
curl localhost:5002/api/v1/info
docker-compose down
```