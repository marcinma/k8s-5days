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

Image

```sh
docker image build -t my-nginx -f nginx/Dockerfile nginx/
docker container stop my-nginx
docker container  rm my-nginx
docker image build -t my-nginx -f nginx/Dockerfile nginx/
docker container run --name my-nginx -d my-nginx
docker container exec -ti my-nginx ls /usr/html
```