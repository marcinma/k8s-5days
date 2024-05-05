Build image

```sh
docker image build -t test .
```

Get image id

```sh
ID=$(docker image ls -q test)
```

Rebuild image with same name

```sh
docker image build -t test -f Dockerfile-2 .
```

Verify old image id is dangling

```sh
docker image ls | grep $ID
```

Remove all dangling images
```sh
docker rmi $(docker image ls -q -f dangling=true)
```

Verify image is no longer dangling

```sh
docker image ls | grep $ID
```