```sh
docker container run my-hello-world
docker container run my-hello-world Marcin
ID=$(docker container ls -q -a -l -f label=imagetype=workshops)
docker container logs $ID
docker container rm $ID
docker container run --name my-world my-hello-world
docker container logs my-world
docker container rm my-world
docker container prune
```

**output**
```
Hello world
Hello Marcin
Hello Marcin
31acb8244051
Hello world
Hello world
my-world
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:
3283525b35554f16cdda191cffd4f42666e7910b19b8e731ae03b13e2844ff09

Total reclaimed space: 0B
```