docker container create --name backup-container my-nginx
docker container cp backup-container:/usr/html/index.html ./
cat index.html
rm index.html
docker rm backup-container