# List networks

`docker network ls`

# Use network

- create new network with `network create`
- run both redis image & python image builded from `03_build_python_image` task with `--network <name>`
- redis container should have name `redis` or `REDIS_HOST` should be set in python with name of redis container
- don't expose port on redis


Check network
```
curl 127.0.0.1:5002/healthz
curl -XPOST 127.0.0.1:5002/api/v1/info
curl -XPOST 127.0.0.1:5002/api/v1/info
curl 127.0.0.1:5002/api/v1/info
```

# How redis keeps data

- list volume - find one created by redis
*Use  container inspect*
```sh
-f "{{ (index .Mounts 0).Name }}"
```
- STOP container
- wait...
- Remove container

- find mount point with inspect using
*Use image inspect*
```sh
 -f "{{.Config.Volumes}}"
```
- create redis again attached to volume - check counter

# Clean up
- remove containers

- list network
- prune network

- list volumes
- prune volumes
