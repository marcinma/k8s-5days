FROM busybox:1.37.0
RUN --mount=type=secret,id=mysecret,target=/mysecret cat /mysecret >> /tmp/mysecret
CMD ["cat", "/tmp/mysecret"]
