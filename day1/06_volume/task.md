# Volumes

## display volume

`docker volume ls`

# Attach volume

1. Build image from `01_volume_ls`
2. Run container from this image with flag `--rm`
3. Check volumes
4. Run container from this image without `--rm` flag and check volumes
3. `touch /tmp/something`
3. Run container with `-v /tmp:/data <image_name> /data`

File something should be displayed

# Create new Dockerfile

1. Create new Dockerfile
2. Base image on previous
3. Change CMD to execute `"-la","/data"`
4. Run container from this image with attached volume /data to tmp folder

# Create volume and add :ro flag

1. Create volume `docker volume create my-volume`
2. List new volume
3. Run 2 containers with `my-nginx` image

First with `-v my-volume:/data:ro`
Second with `-v my-volume:/data`

4. Exec into second container and create new file in `/data` folder
5. Verify first container can read file
6. Verify first container can't write file to `/data`
7. Remove containers and volumes