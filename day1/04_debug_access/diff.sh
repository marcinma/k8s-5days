#!/bin/bash
docker container run --name my-nginx -p 8080:80 -d my-nginx:1
docker container diff my-nginx