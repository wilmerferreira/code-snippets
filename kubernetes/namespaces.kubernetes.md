# Kubernetes: Namespace

Generate a `yaml` using the CLI

```sh
kubectl create namespace my-namespace --dry-run=client -o yaml
```

Here's a basic template for a `namespace`

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: my-namespace
```

More information:

- [kubectl create namespace](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_namespace/)
