# Volumes

A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes.

A PersistentVolumeClaim (PVC) is a request for storage by a user.

1. Create PVC for redis
2. Use PVC in redis deployment
3. Confirm data stays after deployment is scaled to `0` and then to `1` for redis


retain - requires manual delete
recycled - use again
deleted - removes (CHECK!)

https://kubernetes.io/docs/concepts/storage/persistent-volumes/#recycle