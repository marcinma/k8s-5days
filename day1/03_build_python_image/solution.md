# Init

```sh
docker image build -t my-python -f Dockerfile.solution .
docker container run --name my-python-service -P -d my-python
docker container port my-python-service
```

```sh
curl localhost:<port>/healthz 
```

# Redis

```sh
docker container run -d -p 6379:6379 redis:5.0.10
docker container rm -f my-python-service
docker container run -e REDIS_HOST=192.160.0.2 -d -p 49153:5002 -e LOG_LEVEL=DEBUG --name  my-python-service my-python
```

```sh
docker container port my-python-service
curl localhost:49153/api/v1/info
curl -XPOST localhost:49153/api/v1/info
curl localhost:49153/api/v1/info
docker container logs my-python-service
docker container rm -f my-python-service
```