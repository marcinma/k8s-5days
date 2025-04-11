```sh
docker container run --network none -d --name nonet nginx:alpine3.18
docker container exec -ti nonet curl google.com
docker rm -f nonet

docker container run --network bridge -d --name bridgenet nginx:alpine3.18
docker container exec -ti bridgenet curl google.com
docker rm -f bridgenet

```
**output network none**
```
curl: (6) Could not resolve host: google.com
```
**output network bridge**
```
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="http://www.google.com/">here</A>.
</BODY></HTML>
```


```sh
docker network create network-a

docker container run --network network-a -d --name a1 --net-alias n1 nginx:alpine3.18
docker container run --network network-a -d --name a2 --net-alias n2 nginx:alpine3.18
docker container exec -ti a1 curl n2
```

```sh
docker network create network-b

docker container run --network network-b -d --name b1 --net-alias n1 nginx:alpine3.18
docker container run --network network-b -d --name b2 --net-alias n2 nginx:alpine3.18

docker container exec -ti b1  curl n2
```

# Connect & disconnect

disconnect from network
```sh
docker network inspect network-b
docker network disconnect network-b b1
docker network inspect network-b
docker container exec -ti b1  curl n2
```

connect again
```sh
docker network connect network-b b1 --alias n1
docker network inspect network-b
docker container exec -ti b1  curl n2
docker container exec -ti b2  curl n1
```

remove

```sh
docker container rm -f b1 b2 a1 a2
docker network rm network-a network-b
```