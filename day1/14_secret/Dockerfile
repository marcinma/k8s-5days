FROM busybox
RUN --mount=type=secret,id=mysecret,target=/mysecret cat /mysecret >> /tmp/mysecret
CMD ["cat", "/tmp/mysecret"]
