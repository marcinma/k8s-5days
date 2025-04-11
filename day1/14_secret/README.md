# New docker

```sh
docker build --secret id=mysecret,src=mysecret -t my_secret .
docker run --rm my_secret
docker history my_secret
```