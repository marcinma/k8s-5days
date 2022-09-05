# Run first container

## Pull image hello-world

```sh
docker image pull hello-world
```

## Run container hello-world

```sh
docker container run --name <myname> --label=type=workshop hello-world
```

## Check listing options

```sh
docker container ls --help
```

## List working containers

```sh
docker container ls
```

## List all containers

```sh
docker container ls -a
```

## List all containers IDs

```sh
docker container ls -a -q
```

## List all containers by status or label

```
docker container ls -a -f status=exited
docker container ls -a -f label=type=workshop
```

## Check logs

```sh
docker container logs <myname|id>
``` 

## Remove

```sh
docker container rm <myname>
```

## Check container does not exist anymore

```sh
docker container ls -a
```