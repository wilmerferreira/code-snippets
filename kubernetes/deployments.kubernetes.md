# Kubernetes: Deployments

Generate a `yaml` using the CLI

```sh
kubectl create deployment my-deployment --image=nginx -n my-namespace --dry-run=client -o yaml
```

Here's a basic template for a `deployment`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
  namespace: my-namespace # optional
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers: # this an example
      - name: nginx
        image: nginx:latest # version is not required, however it's a good practice to always set a specific version instead of latest (or not setting the version at all)
```

More information:

- [kubectl create deployment](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_deployment/)
