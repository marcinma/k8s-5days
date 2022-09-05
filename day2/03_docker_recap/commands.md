Generic

```sh
docker image pull hello-world
docker container run --name mycontainer --label=type=workshop hello-world
docker container ls
docker container ls -a
docker container ls -a -f status=exited
docker container ls -a -f label=type=workshop
ID=$(docker container ls -q -a -f label=imagetype=workshops)
docker container rm $ID
```

Image & Container

```sh
docker image build -t my-nginx -f nginx/Dockerfile nginx/
docker container run --name my-nginx -d my-nginx
docker container stop my-nginx
docker container start my-nginx

docker container run --rm --name my-nginx -d my-nginx
docker container exec -ti my-nginx ls /usr/html
docker container stop my-nginx
docker container ls -a -f status=exited
```

Registry

```sh
docker image tag  my-nginx 127.0.0.1:5000/my-nginx
docker image push 127.0.0.1:5000/my-nginx
```

Carefull

```sh
docker container stop $(docker container ls -q)
docker container prune 
docker volume prune
```
