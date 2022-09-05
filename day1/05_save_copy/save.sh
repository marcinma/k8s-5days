#!/bin/bash
docker image save -o my-nginx.tar my-nginx
tar -tvf my-nginx.tar
