# Kubernetes: Pods

Generate a `yaml` using the CLI

```sh
kubectl run my-pod --image=nginx -n my-namespace --dry-run=client -o yaml
```

Here's a basic template for a `pod`

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: my-namespace # optional
spec:
  containers: # this an example
  - name: nginx
    image: nginx:latest # version is not required, however it's a good practice to always set a specific version instead of latest (or not setting the version at all)
```

More information:

- [kubectl run](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_run/)

## Debug

Get terminal access in one of the pods

```sh
# Using bash
kubectl exec -it my-pod -n my-namespace -- /bin/bash

# Using sh
kubectl exec -it my-pod -n my-namespace -- /bin/sh
```

Get terminal access to a specific container in a pod

```sh
# Using bash
kubectl exec -it my-pod -c specific-container -n my-namespace -- /bin/bash

# Using sh
kubectl exec -it my-pod -c specific-container -n my-namespace -- /bin/sh
```

A good image used for debugging is `nicolaka/netshoot`, it can be created by running

```sh
k run netshoot --image=nicolaka/netshoot -n sandbox
```
