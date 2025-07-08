# Kubernetes: Templates

## Namespace

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

## Pod

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

## Deployment

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

## Service

### ClusterIP

```sh
kubectl create service clusterip my-service --tcp=8080:8080 --dry-run=client -n my-namespace -o yaml
```

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
  namespace: my-namespace # optional
spec:
  type: ClusterIP
  selector:
    app: my-app
  ports:
    - name: http # the name of the port is optional
      protocol: TCP # if is not set it will default to TCP
      port: 8080
      targetPort: 8080
```

### ExternalName

TBC

### LoadBalancer

TBC

### NodePort

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
  namespace: my-namespace # optional
spec:
  type: NodePort
  selector:
    app: my-app
  ports:
    - name: http # optional
      port: 80 # exposed internally within the cluster
      targetPort: 8080
      nodePort: 30007 # optional, if not set, k8s will assign a port between 30000-32767
```

## ConfigMap

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

## Secret

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

## Ingress

```sh
kubectl create ingress simple --rule="foo.com/bar=svc1:8080" -n my-namespace --dry-run=client -o yaml
```

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
