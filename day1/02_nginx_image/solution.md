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

# Build with password and run it

```sh
docker container rm my-nginx
touch nginx/password
docker image build -t my-nginx -f nginx/Dockerfile nginx/
docker container run --name my-nginx -d my-nginx
```
# Debug

```sh
docker container exec -ti my-nginx /bin/sh
ls
exit
docker container exec -ti my-nginx ls /usr/html
```

**output**
```
Dockerfile    default.conf  index.html    nginx.conf    password
```

# Ignore

```sh
touch nginx/.dockerignore
echo "Dockerfile" >> nginx/.dockerignore
echo "password" >> nginx/.dockerignore
docker container stop my-nginx
docker container  rm my-nginx
docker image build -t my-nginx:1 -f nginx/Dockerfile nginx/
docker container run --name my-nginx -d my-nginx:1
docker container exec -ti my-nginx ls /usr/html
```

**output**
```
default.conf  index.html    nginx.conf
```

# check nginx images
```sh
docker image ls | grep my-nginx
```

**output**
```
my-nginx                      1         24595e537fd5   About a minute ago   6.99MB
my-nginx                      latest    9caa73c634db   4 minutes ago        6.99MB
```

# Port forward

```sh
docker container rm -f my-nginx
docker container run --name my-nginx -p 8080:80 -d my-nginx:1
curl localhost:8080
```

**output**
```
<!DOCTYPE html>
<htmL>
    <body>
        Docker & K8S workshops!
    </body>
</htmL>
```

# Dynamic port

```sh
echo "EXPOSE 80" >> nginx/Dockerfile
docker image build -t my-nginx:2 -f nginx/Dockerfile nginx/
docker container rm -f my-nginx
docker container run --name my-nginx -P -d my-nginx:2
docker container port my-nginx
curl localhost:49158
docker container rm -f my-nginx
```