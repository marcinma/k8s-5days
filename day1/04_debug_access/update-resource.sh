#!/bin/bash
docker container update nginx-resource --cpu-shares 513
docker rm -f my-nginx
docker rm -f nginx-resource

