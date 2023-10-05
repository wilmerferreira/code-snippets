# Kubernetes: Resources

## Workloads

## Controllers

Things that maintains the system in the desired state (e.g. replica sets, deployments)

### Deployments

TBD

### Replica Sets

TBD (1-N)

### Stateful Sets

TBD

### Daemon Sets

TBD

### Jobs & CronJobs

TBD

## Pods

Single or collection of containers deployed as a single unit

- One or more containers
- It's your application or service
- The most basic unit of work
- Unit of scheduling

### Requests & Limits

TBD

### Affinity & Anti-Affinity

TBD

### Horizontal Autoscaler

Only available based on memory and cpu usage, for custom metrics is better to use prometheus (or an equivalent)

```yaml
apiVersion: autoscaling/v2beta2
kind: HorizontalPodAutoscaler
metadata:
  name: envbin
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: envbin
  minReplicas: 1
  maxReplicas: 5
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 80
```

## Containers

TBD (1-N)

## Traffic Policies

Determines how ingress traffic is routed.

1. External Traffic Policy: how traffic from external sources is routed and has two valid values.

   - Cluster: route external traffic to all ready endpoints.
   - Local: only route to ready node-local endpoints

2. Internal Traffic Policy: how traffic from internal sources is routed (has the same two values as external)

> If the traffic policy is local and there are no node-local endpoints, then kube-proxy does not forward any traffic for the relevant service

## Storage

Store objects to persist data

## Configuration

### ConfigMaps

Pods can consume `ConfigMaps` as:

- Environment variables
- Command-line arguments
- Configuration files in a volume

`ConfigMap`s support `data` and `binaryData`

> ConfigMaps can only be created, recreated and deleted, they cannot be updated

Entry types:

- Property-like keys; each key maps to a simple value

  ```yml
  apiVersion: v1
  kind: ConfigMap
  metadata:
    name: game-demo
  data:
    player_initial_lives: "3"
    ui_properties_file_name: "user-interface.properties"
  ```

- File-like keys

  ```yml
  apiVersion: v1
  kind: ConfigMap
  metadata:
    name: game-demo
  data:
    game.properties: |
      enemy.types=aliens,monsters
      player.maximum-lives=5    
    user-interface.properties: |
      color.good=purple
      color.bad=yellow
      allow.textmode=true    
  ```

> Block Scalars has three parts: Block Style Indicator, Block Chomping Indicator and Indentation Indicator, these should be taken in consideration for multiline keys

There are four different ways that you can use a ConfigMap to configure a container inside a Pod:

1. Inside a container command and args
2. Environment variables for a container
3. Add a file in read-only volume, for the application to read
4. Write code to run inside the Pod that uses the Kubernetes API to read a ConfigMap

Steps to setup a create and configure a configMap

1. Setup the ConfigMap

   ```yaml
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: colour-config
   data:
     colour: pink
   ```

2. Bind the ConfigMap data to a Pod

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: pink
   spec:
    containers:
      - name: pink
        image: mtinside/blue-gree:blue
        env:
          - name: COLOUR
            valueFrom:
              configMapKeyRef:
                name: colour-config
                key: colour
   ```

- [ConfigMaps - Unofficial Kubernetes](https://unofficial-kubernetes.readthedocs.io/en/latest/tasks/configure-pod-container/configmap/)
- [ConfigMaps - Kubernetes.io](https://kubernetes.io/docs/concepts/configuration/configmap/)
- [Block Scalars - YAML Multiline](https://yaml-multiline.info/)

### Secrets

- Generic
- TLS
  - `tls.key`: private key
  - `tls.crt`: certificate
  - `ca.crt`: ca certificate

There are some alternatives like [HashiCorp Vault](https://www.hashicorp.com/products/vault) or [Bitnami Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets)
