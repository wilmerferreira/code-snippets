# Kubernetes: Ingress

Generate a `yaml` using the CLI

```sh
kubectl create ingress simple --rule="foo.com/bar=svc1:8080" -n my-namespace --dry-run=client -o yaml
```

Here's a basic template for a `ingress`

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
  namespace: my-namespace
spec:
  rules:
  - host: foo.com
    http:
      paths:
      - backend:
          service:
            name: svc1
            port:
              number: 8080
        path: /bar
        pathType: Exact
```
