```sh
docker image pull marcinmakowski/workshops:password
docker image save -o pass.tar marcinmakowski/workshops:password
tar -xvf pass.tar
cd 31a7fb2fcf8ee3eb610b32ce13797de38de8710806c5dd69b798ab659acce2d4
 tar -xvf layer.tar
 cat password
 ```
