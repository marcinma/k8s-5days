```sh
docker container run --network none -d --name nonet ewoutp/docker-nginx-curl
docker container exec -ti nonet curl google.com

docker container run --network bridge -d --name bridgenet ewoutp/docker-nginx-curl
docker container exec -ti bridgenet curl google.com
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

docker container run --network network-a -d --name a1 --net-alias n1 ewoutp/docker-nginx-curl
docker container run --network network-a -d --name a2 --net-alias n2 ewoutp/docker-nginx-curl
docker container exec -ti a1 curl n2
```

```sh
docker network create network-b

docker container run --network network-b -d --name b1 --net-alias n1 ewoutp/docker-nginx-curl
docker container run --network network-b -d --name b2 --net-alias n2 ewoutp/docker-nginx-curl

docker container exec -ti b1  curl n2
```

# Connect & disconnect
```sh
docker network disconnect network-b b1
docker container exec -ti b1  curl n2
```