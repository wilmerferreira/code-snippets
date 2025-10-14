# Secrets

```sh
kubectl create secret generic my-secret --from-literal=key1=value1 -n my-namespace --dry-run=client -o yaml
```

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
  namespace: my-namespace
type: Opaque # Opaque is the default type for generic secrets
stringData: # Use stringData for plain text values, Kubernetes will base64 encode it
  key1: value1
```

More information:

- [kubectl create secret](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_secret/)
