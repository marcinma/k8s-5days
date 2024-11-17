```sh
docker image build -t my-volume ./01_volume_ls
docker volume ls
docker container run --rm my-volume
docker volume ls
docker container run my-volume
docker volume ls
touch /tmp/something
docker container run --rm -v /tmp:/data my-volume /data
docker image build -t my-volume-la ./02_volume_la_solution
docker container run --rm -v /tmp:/data my-volume-la
```

# RO nginx

```sh
docker volume create my-volume
docker container run -d -v my-volume:/data:ro --name n-read my-nginx
docker container run -d -v my-volume:/data --name n-write my-nginx

docker container exec -ti n-write touch /data/test
docker container exec -ti n-read touch /data/test
```

**output**
```
touch: cannot touch '/data/test': Read-only file system
```

```sh
docker container exec -ti n-read ls /data/
```
**output**
```
test
```

# Remove containers and volumes

```sh
docker container rm -f n-read
docker container rm -f n-write
docker volume rm my-volume
```
