## Build image

```sh
docker image build -t my-hello-world .
```

## Check images

```sh
docker image ls 
```

## Find image by label

```sh
docker image ls -f label=imagetype=workshops
```

# TASK PART

1. Run container from image
2. Run container and insert your name as last argument
3. Find latest container id
4. Find container logs by container id
5. Remove container by id
6. Run container providing name and find its logs by name of container
7. Remove container by name
8. Remove all exited containers with `prune` command