# Recreate Python+Redis on Kubernetes


1. Create Deployment for redis
2. Create Deployment for marcinmakowski/python-api:redis
3. Create service for each of those deployments. Service for python should be NodePort
4. Access to python with port-forward
5. Access to python with node port 
