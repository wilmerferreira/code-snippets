# Kubernetes: Storage

## Volumes

There are many [types of volumes]

## Persistent Volumes

A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. It is a resource in the cluster just like a node is a cluster resource. PVs are volume plugins like Volumes, but have a lifecycle independent of any individual Pod that uses the PV.

### Persistent Volume Claim

A PersistentVolumeClaim (PVC) is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources.

## Ephemeral Volume

TBD

## Storage Class

TBD

[types of volumes]: https://kubernetes.io/docs/concepts/storage/volumes/#volume-types
