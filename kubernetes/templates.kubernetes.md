# Kubernetes: Templates

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
    - name: http # optional if is only one port
      protocol: TCP # if is not set it will default to TCP
      port: 8080
      targetPort: 8080
```

### ExternalName

TBC

### LoadBalancer

TBC

### NodePort

```sh
kubectl create service nodeport kuard-service --tcp=80:8080 -n my-namespace --dry-run=client -o yaml
```

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
    - name: http # optional if is only one port
      port: 80 # exposed internally within the cluster
      targetPort: 8080 # this should match the port exposed in the pod
      nodePort: 30007 # optional, if not set, k8s will assign a port between 30000-32767
```
