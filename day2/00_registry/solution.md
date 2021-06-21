```sh
docker container run -d --name registry --restart=always  -p 5000:5000 registry:2
curl 127.0.0.1:5000/v2/_catalog
```

**output**
```
{"repositories":[]}
```

```sh
docker image tag  my-nginx 127.0.0.1:5000/my-nginx
docker image push 127.0.0.1:5000/my-nginx
curl 127.0.0.1:5000/v2/_catalog
```

**output**
```
{"repositories":["my-nginx"]}
```