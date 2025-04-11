# Create

```sh
docker network ls
docker network create python-redis-network
docker container run --network python-redis-network -d --name my-redis redis:5.0.10
docker container run --network python-redis-network -d -P -e REDIS_HOST=my-redis --name my-python-service my-python
docker container exec -ti  my-python-service curl 127.0.0.1:5002/api/v1/info
docker container exec -ti  my-python-service curl -XPOST 127.0.0.1:5002/api/v1/info
docker container exec -ti  my-python-service curl 127.0.0.1:5002/api/v1/info
```

**output**
```
{"counter": 0}
OK
{"counter": 1}
```

# Data

```sh
ID=$(docker container inspect -f "{{ (index .Mounts 0).Name }}" my-redis)
docker volume inspect $ID
docker image inspect -f "{{.Config.Volumes}}"  redis:5.0.10
docker container stop my-redis
docker container rm my-redis
docker container run --network python-redis-network -d --name my-redis -v $ID:/data redis:5.0.10
docker container exec -ti  my-python-service curl 127.0.0.1:5002/api/v1/info
```

**output**
```
[
    {
        "CreatedAt": "2022-09-02T13:31:55+02:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/4ea4f5f6d70c35864c57cdbd231d43bdf6f5a8a702d32417f2e02ca957759aa6/_data",
        "Name": "4ea4f5f6d70c35864c57cdbd231d43bdf6f5a8a702d32417f2e02ca957759aa6",
        "Options": null,
        "Scope": "local"
    }
]
map[/data:{}]
{"counter": 1}
```

# Clean
```sh
docker container stop my-redis
docker container stop my-python-service
docker container rm my-redis
docker container rm my-python-service
docker network ls
docker network rm python-redis-network 
docker volume ls
docker volume rm $ID
```