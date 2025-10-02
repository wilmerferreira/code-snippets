# Kubernetes

## Main Components (key players)

- Master
  - Cluster Store (`etcd`): key/value store
  - Scheduler
  - Controller Manager
  - API Server: This is used by `kubectl`, `kubernetes dashboard`, gateway and authentication/authorization

  > It is recommended to at least have 2 master nodes in live clusters

- Slave/worker nodes
  - Kubelet
    - Monitors API Server for changes
    - Responsible for changes
    - Reports Node & Pod state
    - Pod liveness probes
  - Kube-proxy
    - Network proxy iptables
    - Implements Services
    - Routing traffic to Pods
    - Load Balancing
  - Container Runtime (e.g. Docker)
    - Download images & runs containers
    - Container Runtime Interface

  > It is recommended to at least have 3 slave/worker nodes in live clusters

## Scheduled/Add-on Pods

- DNS
- Ingress
- Dashboard

## Namespaces

The built-in namespaces are:

- `default`
- `kube-public`
- `kube-system`
- `kube-node-lease`

## Plugins

- In-tree: internal plugins
- Out-of-tree: external plugins

## Selectors

- Label selector
- Field selector (e.g. metadata, status, etc.)
- Node selector

## Distributions

- [minikube](https://minikube.sigs.k8s.io/)
- [k3s](https://k3s.io/)
- [k3d](https://k3d.io/)
- [kind](https://kind.sigs.k8s.io/)
- [microk8s](https://microk8s.io/)

## Managed Kubernetes Providers

- Google Kubernetes Engine (GKE)
- Amazon Elastic Kubernetes Service (EKS)
- Azure Kubernetes Service (AKS)
- IBM Cloud Kubernetes Service (IKS)
- Oracle Container Engine for Kubernetes
- DigitalOcean Kubernetes (DOKS)
- CIVO Kubernetes

## Management Layers

- Weave Kubernetes Platform
- [Rafay](https://rafay.co/)
- [VMWare Tanzu](https://tanzu.vmware.com/)
- [Azure ARC](https://azure.microsoft.com/en-gb/products/azure-arc/)
- [Google Anthos](https://cloud.google.com/anthos/)
- [Platform 9](https://platform9.com/managed-kubernetes/)
- [RedHat OpenShift](https://www.redhat.com/en/technologies/cloud-computing/openshift)
- [Rancher Kubernetes Engine (RKE)](https://www.rancher.com/products/rke)

### Standalone Management Applications

- [Aptakube](https://aptakube.com/)
- [Infra App](https://infra.app/)
- [Kubenav](https://kubenav.io/)
- [K9s](https://k9scli.io/)
- [Kubernetes Dashboard](https://github.com/kubernetes/dashboard)
- [Kubernetes Operational View](https://codeberg.org/hjacobs/kube-ops-view)
- [Kubernator](https://github.com/smpio/kubernator)
- [Kubernetic](https://www.kubernetic.com/)
- [Kubevious](https://kubevious.io/)
- [Kui](https://github.com/kubernetes-sigs/kui)
- [Lens Desktop](https://k8slens.dev/desktop.html)
- [Octant](https://octant.dev/)
- [Portainer](https://www.portainer.io/)
- [Skooner](https://skooner.io/) (formerly K8Dash)
- [Weave Scope](https://www.weave.works/oss/scope/)

## Container Runtime Interface

- Orchestration: Docker + k8s
- CRI: [containerd](https://containerd.io/), [CRI-O](https://cri-o.io/])

## Container Runtimes

- Virtualized runtimes (lightweight VMs)
- Traditional containers

## Container Storage Interface

- Azure Disk
- AWS EBS
- NetApp Trident
- OpenStack Cinder
- Google Cloud Storage
- 100+ storage plugins/drivers

## Linux Containers (LXC)

TBC

### CGroups

Allows to group processes in linux in order to apply certain limitations:

- Resource limiting: configuration that sets the memory usage limit or file system cache
- Prioritization: limits the CPU utilization or disk I/O throughput
- Accounting: measures the resource usage
- Control: freezing group of processes, their checkpointing and restarting

Think of `cgroups` as a way to limit programs on linux from overusing CPU, memory or storage

> The primary design goal for `cgroups` was to provide a unified interface to manage processes or whole operative-system-level virtualization, including Linux Containers (LXC)

## Networking

### Requirements

- All Pods can communicate with each other on all Nodes
- All Nodes can communicate with all Pods
- No Network Address Translation (NAT)

## Volumes

TBD

## Network Policies

- Denying Access

  ```yaml
  apiVersion: networking.k8s.io/v1
  kind: NetworkPolicy
  metadata:
    name: deny-all
  spec:
    podSelector: {}
    policyTypes:
      - Ingress
  ```

- Allowing Access

  ```yaml
  apiVersion: networking.k8s.io/v1
  kind: NetworkPolicy
  metadata:
    name: allow-blue
  spec:
    podSelector:
      matchLabels:
        colour: blue
    policyTypes:
      - Ingress
    ingress:
      - from:
          - podSelector:
              matchLabels:
                app: shell
        ports:
          - protocol: TCP
            port: 8080
  ```

## Role Bindings & Service Accounts

TBD

## Kubernetes Dashboard

Is a web-based Kubernetes user interface. You can use Dashboard to deploy containerized applications to a Kubernetes cluster, troubleshoot your containerized application, and manage the cluster resources. You can use Dashboard to get an overview of applications running on your cluster, as well as for creating or modifying individual Kubernetes resources (such as Deployments, Jobs, DaemonSets, etc).

1. [Provision the kubernetes dashboard in the cluster](https://github.com/kubernetes/dashboard#install)

   ```sh
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
   ```

   This deploys a set of resources in a new namespace called `kubernetes-dashboard`, you can check the deployed resources by running

   ```sh
   kubernetes get all -n kubernetes-dashboard
   ```

   > Remember to check that all the resources are up and running as expected

2. Port forward to the dashboard

   ```sh
   kubectl proxy
   ```

3. [Access the dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)

4. _Login_ using either a token or the kubeconfig file

   **TBD**, see more here [creating-sample-user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)

## Krew

Is the plugin manager for `kubectl` command-line tool. It  helps you:

- discover kubectl plugins,
- install them on your machine,
- and keep the installed plugins up-to-date.

## Glossary

- Pod
- Replica Set
- DaemonSet

## Investigate

- metrics-server
- Rolling upgrade / rollback
- jobs / cronjobs
- resource requests/limits (memory and cpu): `requests` is the **minimum size** required for this resource, `limits` is the **maximum size** allowed for this resource

  ```yaml
  apiVersion: v1
  kind: Pod
  spec:
    containers:
      - name: your-container-name-goes-here
        # ...
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
  ```

  These uses the following suffixes for sizes

  | Unit      | One digit | Two digits  |
  |-----------|-----------|-------------|
  | Kilobytes | K         | Ki          |
  | Megabytes | M         | Mi          |
  | Gigabytes | G         | Gi          |
  | Terabytes | T         | Ti          |
  | Petabytes | P         | Pi          |
  | Exabytes  | E         | Ei          |

- zero trust networking or beyond corp
- service mesh
- `kubectx`
- `kubens`
- `kube-ps1`
- `linkerd` (check & dashboard)
- `helm` package manager mainly used with artifacts you own
- `kustomaze` package manager mainly used with artifacts you DO NOT own

## More Information

- [Kubernetes Essential Training: Application Development](https://www.linkedin.com/learning/kubernetes-essential-training-application-development/)
- [Kubernetes: Microservices](https://www.linkedin.com/learning/kubernetes-microservices/)
- [Kubernetes — Service Types Overview](https://medium.com/devops-mojo/kubernetes-service-types-overview-introduction-to-k8s-service-types-what-are-types-of-kubernetes-services-ea6db72c3f8c)
- [Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
- [Krew](https://krew.sigs.k8s.io/)
- [TrailMap](https://github.com/cncf/trailmap)
