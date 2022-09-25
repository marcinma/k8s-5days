# Init

```sh
docker rmi my-python
docker image build -t my-python -f Dockerfile.solution .
docker container run --name my-python-service -P -d my-python
docker container port my-python-service
```

**output**
```
Sending build context to Docker daemon  11.26kB
Step 1/8 : FROM python:3.7.9
(...)
Successfully built ebb6e08fd327
Successfully tagged my-python:latest

b8689e572b025181ff80851c5d513cf779389c2c9467badbe22b1491c7aadd76
5002/tcp -> 0.0.0.0:49160
5002/tcp -> :::49155
```

# Check endpoint

```sh
curl localhost:<port>/healthz 
```

**output**
```
Service is OK
```

# Check logs
```sh
docker container logs my-python-service
```

**output**
```
 * Serving Flask app 'api.info' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on all addresses.
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://172.17.0.2:5002/ (Press CTRL+C to quit)
172.17.0.1 - - [01/Sep/2022 14:23:26] "GET /healthz HTTP/1.1" 200 -
```

# Redis

```sh
docker container run -d -p 6379:6379 redis:5.0.10
docker container rm -f my-python-service
docker container run -e REDIS_HOST=172.27.217.166 -d -p 45002:5002 -e LOG_LEVEL=DEBUG --name  my-python-service my-python
```

```sh
docker container port my-python-service
curl localhost:45002/api/v1/info
curl -XPOST localhost:45002/api/v1/info
curl localhost:45002/api/v1/info
docker container logs my-python-service
docker container rm -f my-python-service
```

**output**
```
{"counter": 0}
OK
{"counter": 1}
 * Serving Flask app 'api.info' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on all addresses.
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://172.17.0.2:5002/ (Press CTRL+C to quit)
2022-09-01 14:18:02,477 INFO counter var is 0
2022-09-01 14:18:02,477 DEBUG Request took 0.00027561187744140625
172.17.0.1 - - [01/Sep/2022 14:18:02] "GET /api/v1/info HTTP/1.1" 200 -
172.17.0.1 - - [01/Sep/2022 14:18:08] "POST /api/v1/info HTTP/1.1" 200 -
2022-09-01 14:18:10,240 INFO counter var is 1
2022-09-01 14:18:10,241 DEBUG Request took 0.00019216537475585938
172.17.0.1 - - [01/Sep/2022 14:18:10] "GET /api/v1/info HTTP/1.1" 200 -
```