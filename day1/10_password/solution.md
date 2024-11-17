```sh
docker image pull marcinmakowski/workshops:password
docker image save -o pass.tar marcinmakowski/workshops:password
tar -xvf pass.tar
cd blobs/sha256/
tar -xvf 7c86b9a8b039f5349b766a60c3cb9d26696798ebf894fa32ba9ee8684f7ac1eb
cat password
cd ../../
rm -rf pass.tar blobs/ manifest.json repositories oci-layout index.json
 ```
