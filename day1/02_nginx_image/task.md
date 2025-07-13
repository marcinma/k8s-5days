# TASK

1. Build nginx image from parent folder `02_nginx_image`
```sh
docker image build -t my-nginx -f nginx/Dockerfile nginx/
```

2. Run nginx container from previous step , <ctr+c> to exit from being attached to container
3. Remove container
4. Create file `password` in nginx folder
5. Build image one more time
6. Run container with `-d` flag

# Exec container

1. enter container

```sh
docker container exec -ti <container_name> /bin/sh
```
2. Navigate to ` /usr/html` folder and list files. Verify password file is inside. Exit from container with `exit`.

# Ignore files

Create `.dockerignore` in `nginx/` folder

```.dockerignore
Dockerfile
password
```

1. Rebuild image but add tag version to it:

```sh
docker image build -t my-nginx:1 -f nginx/Dockerfile nginx/
```
2. Run container one more time from this version
3.Verify that password file is no longer there 
4. Check nginx images

# Forward port

You can force remove container that is running

```sh
docker container rm -f my-nginx
```

Run container one more time using `-p` flag to forward port

```sh
docker container run --name my-nginx -p 8080:80 -d my-nginx:1
curl localhost:8080
```

# Forward port dynamicaly

1. Add to Dockerfile 

```Dockerfile
EXPOSE 80
```

2. Rebuild image as `my-nginx:2`
3. Remove previous my-nginx container
4. Run container one more time with dynamic port assigned

```sh
docker container run --name my-nginx -P -d my-nginx:2
```

5. Verify what port was assigned

```sh
docker container port my-nginx
```

6. Access port
```sh
curl localhost:32768
```

7. Finaly remove containers created in this task



