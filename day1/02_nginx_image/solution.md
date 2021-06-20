# Init
```sh
docker image build -t my-nginx -f nginx/Dockerfile nginx/
docker container run --name my-nginx my-nginx
```
<ctrl+c>

**output**
```
Sending build context to Docker daemon  6.144kB
Step 1/8 : FROM alpine:latest
 ---> d4ff818577bc
Step 2/8 : RUN apk add --update nginx &&     rm -rf /var/cache/apk/* &&     mkdir -p /tmp/nginx
 ---> Using cache
 ---> d9fa6f73f3e9
Step 3/8 : COPY nginx.conf /etc/nginx/nginx.conf
 ---> Using cache
 ---> a7e6ca8e2f9a
Step 4/8 : COPY default.conf /etc/nginx/conf.d/default.conf
 ---> Using cache
 ---> a079b40d31e6
Step 5/8 : WORKDIR /usr/html
 ---> Using cache
 ---> 5fe4ae660876
Step 6/8 : ENV MY_ENV_VARIABLE="SET ON WORKSHOPS"
 ---> Using cache
 ---> 46759f48245a
Step 7/8 : COPY . ./
 ---> 02c896ca1c6d
Step 8/8 : CMD ["nginx"]
 ---> Running in 501d8153987a
Removing intermediate container 501d8153987a
 ---> 81b11cf2df19
Successfully built 81b11cf2df19
Successfully tagged my-nginx:latest
```

```sh
docker container rm my-nginx
touch nginx/password
docker image build -t my-nginx -f nginx/Dockerfile nginx/
docker container run --name my-nginx -d my-nginx
```
# Debug

```sh
docker container exec -ti my-nginx /bin/sh
docker container exec -ti my-nginx ls /usr/html
```

**output**
```
Dockerfile    default.conf  index.html    nginx.conf    password
```

# Ignore

```sh
touch nginx/.dockerignore
echo "password" >> nginx/.dockerignore
docker container stop my-nginx
docker container  rm my-nginx
docker image build -t my-nginx -f nginx/Dockerfile nginx/
docker container run --name my-nginx -d my-nginx
docker container exec -ti my-nginx ls /usr/html
```

**output**
```
Dockerfile    default.conf  index.html    nginx.conf
```

