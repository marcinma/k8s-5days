# Run first container

## Pull image hello-world

```sh
docker image pull hello-world
```
**output**
```
Using default tag: latest
latest: Pulling from library/hello-world
b8dfde127a29: Pull complete
Digest: sha256:9f6ad537c5132bcce57f7a0a20e317228d382c3cd61edae14650eec68b2b345c
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest
```

## Run container hello-world

```sh
docker container run --name mycontainer --label=type=workshop hello-world
```

**output**
```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
 ```

## Check listing options

```sh
docker container ls --help
```

## List working containers

```sh
docker container ls
```

**output**
```
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
```

## List all containers

```sh
docker container ls -a
```

**output**
```
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
743d95cfc646   hello-world   "/hello"   21 seconds ago   Exited (0) 20 seconds ago             mycontainer
```

## List all containers IDs

```sh
docker container ls -a -q
```

**output**
```
743d95cfc646
```

## List all containers by status or label

```
docker container ls -a -f status=exited
docker container ls -a -f label=type=workshop
```

**output**
```
CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
2ab87c26c39f   hello-world   "/hello"   5 minutes ago   Exited (0) 5 minutes ago             mycontainer
```

## Check logs

```sh
docker container logs 2ab87c26c39f
docker container logs mycontainer
``` 

## Remove

```sh
docker container rm mycontainer
```

## Check container does not exist anymore

```sh
docker container ls -a
```

**output**
```
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
```