# Kubernetes: ConfigMaps

```sh
# Empty template
kubectl create configmap my-configmap -n my-namespace --dry-run=client -o yaml

# With a key/value pair
kubectl create configmap my-configmap --from-literal=key1=value1 -n my-namespace --dry-run=client -o yaml
```

```yaml
kind: ConfigMap
metadata:
  name: my-config
  namespace: my-namespace
apiVersion: v1
data:
  key1: value1
  key2: value2
```

More information:

- [kubectl create configmap](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_configmap/)
