# Kubernetes: Services

Provides a persistent access point to the applications in pods attaching a static IP address and DNS name for a set of pods, also allows to persist an address for a pod even if it dies and acts as a load balancer.

> A pod without a service will have a dynamic IP address. So, when the pod dies do does the IP address

```yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: my-service
  name: my-service
spec:
  ports:
  - name: http
    protocol: http
    port: 5678
    targetPort: 8080
  selector:
    app: my-service
  type: ClusterIP # If this value is omitted it will use ClusterIP as a default value (fallback type)
status:
  loadBalancer: {}
```

Services can be reached within the cluster using this format `<SERVICE>.<NAMESPACE>.svc.cluster.local`, however you can still use one of the following options:

- `my-service.default.svc.cluster.local`
- `my-service.default` if you are accessing something in another cluster (`default` is the name of the other cluster)
- `my-service` if you are accessing something in the same cluster

## Types

### ClusterIP

**default** and randomly forward traffic to any pod set with target port.

- `ClusterIP` is the default and most common service type.
- Kubernetes will assign a cluster-internal IP address to `ClusterIP` service. This makes the service **only** reachable within the cluster.
- You cannot make requests to service (pods) from outside the cluster.
- You can optionally set cluster IP in the service definition file.

### Headless

send traffic to a very specific pod, when you have stateful pods, e.g., databases

### NodePort

(external service) allows you to use a worker node IP address

- `NodePort` service is an extension of `ClusterIP` service. A `ClusterIP` Service, to which the `NodePort` Service routes, is automatically created.

  - `port`: exposes the kubernetes services on the specified port within the cluster
  - `targetPort`: port on which the service will send requests to, that your pod will be listening on. Your application oin the container will need to be listening on this port also.
  - `nodePort`: exposes a service externally to the cluster by means of the target nodes IP address and the `NodePort`.

- It exposes the service outside of the cluster by adding a cluster-wide port on top of `ClusterIP`.
- `NodePort` exposes the service on each Node’s IP at a static port (the `NodePort`). Each node proxies that port into your Service. So, external traffic has access to fixed port on each Node. It means any request to your cluster on that port gets forwarded to the service.
- You can contact the `NodePort` Service, from outside the cluster, by requesting `<NodeIP>:<NodePort>`.
- Node port must be `30000+` (ranged between `30000~32767`). Manually allocating a port to the service is optional. If it is undefined, Kubernetes will automatically assign one.
- If you are going to choose node port explicitly, ensure that the port was not already used by another service.
- There is not **external** load balancer so `NodePort` is intended for a single Kubernetes Services and for non production workloads

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nodeport-service
  labels:
    app: my-nodeport-service
spec:
  type: NodePort
  selector:
    app: my-nodeport-service
  ports:
  - name: http
    port: 80
    targetPort: 80
    nodePort: 30080
    protocol: TCP
```

### LoadBalancer

Similar to `NodePort` except leverages Cloud Service Provider's (CSPs) load balancer, allows the usage of an external load balancer which handles the routing and traffic distribution logic.

- LoadBalancer service is an extension of `NodePort` service. `NodePort` and `ClusterIP` Services, to which the external load balancer routes, are automatically created.
- It integrates `NodePort` with cloud-based load balancers.
- It exposes the Service externally using a cloud provider’s load balancer.
- Each cloud provider (AWS, Azure, GCP, etc) has its own native load balancer implementation. The cloud provider will create a load balancer, which then automatically routes requests to your Kubernetes Service.
- Traffic from the external load balancer is directed at the backend Pods. The cloud provider decides how it is load balanced.
- The actual creation of the load balancer happens asynchronously.
- Every time you want to expose a service to the outside world, you have to create a new LoadBalancer and get an IP address.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-loadbalancer-service
  labels:
    app: my-loadbalancer-service
spec:
  type: LoadBalancer
  selector:
    app: my-loadbalancer-service
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376
  clusterIP: 10.0.171.239
status:
  loadBalancer:
    ingress:
    - ip: 192.0.2.127
```

### ExternalName

Special service that does not have selectors and uses DNS names instead

- Services of type `ExternalName` map a Service to a DNS name, not to a typical selector such as `my-service`.
- You specify these Services with the `spec.externalName` parameter.
- It maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record with its value.
- No proxying of any kind is established.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-externalname-service
  labels:
    app: my-externalname-service
spec:
  type: ExternalName
  externalName: an-external-resource.com
  selector:
    app: my-externalname-service
```

## Supported protocols

- `TCP`
- `UDP`
- `SCTP`
- `HTTP`
- `PROXY` protocol
