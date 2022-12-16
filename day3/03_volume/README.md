# Volumes

A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes.

A PersistentVolumeClaim (PVC) is a request for storage by a user.

# Reclaim policy
* retain - requires manual delete
* recycle - use again
* delete - removes

https://kubernetes.io/docs/concepts/storage/persistent-volumes/#recycle
