```sh
DOCKER_BUILDKIT=1 docker build --secret id=mysecret,src=mysecret -t my_secret .
docker run --rm my_secret
```