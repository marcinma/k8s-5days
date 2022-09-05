```sh
docker image build -t java-spring --build-arg GITHASH=ab99933 .
docker container run -d -P --name java-spring java-spring
docker container port java-spring
curl localhost:49164
docker exec -ti java-spring env | grep GITHASH
```

**output**
```
8080/tcp -> 0.0.0.0:49164
8080/tcp -> :::49159
Hello Docker World
GITHASH=ab99933
```