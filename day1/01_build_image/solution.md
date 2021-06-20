```sh
docker container run my-hello-world
docker container run my-hello-world Marcin
ID=$(docker container ls -q -a -f label=imagetype=workshops)
docker container logs $ID
docker container rm $ID
```