docker-compose up -d
docker-compose up -d --scale web=3
docker-compose exec python-redis curl web
docker-compose exec python-redis curl web
docker-compose exec python-redis curl web
docker-compose logs -f web