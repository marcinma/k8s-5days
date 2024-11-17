# On build

Register advance instructions to run later, during the next build stage. Prepare base dockerfile without access to code.

```sh
docker image build -t base-python:on-build base/
docker image build -t python-redis .
docker container run --name test -d -p 5008:5002 python-redis
curl localhost:5008/healthz
docker rm -f test
```