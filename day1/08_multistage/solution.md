```sh
HASH=$(git rev-parse --short HEAD)
docker image build -t java-spring --build-arg GITHASH=$HASH .
docker container run -d -P --name java-spring java-spring
PORT=$(docker container port java-spring | awk 'NR==1{split($3,a,":"); print a[2]}')
curl localhost:$PORT
docker exec -ti java-spring env | grep GITHASH
docker container rm -f java-spring
docker rmi java-spring
```

**output**
```
8080/tcp -> 0.0.0.0:49164
8080/tcp -> :::49159
Hello Docker World
GITHASH=ab99933
```
