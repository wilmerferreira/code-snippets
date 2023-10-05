# Kubernetes: kubectl

```sh
# kubectl < get | delete | create > < resource_type >

#  Get Pods
kubectl get pods
# Get specific pod
kubectl get pod my-pod

# kubectl < create | apply > -f ./my-pod-config.yml
```

## Imperative vs Declarative Commands

TBC

## Contexts

`kubectl` is a client CLI tool, it runs under a context, so that means that `kubectl` is going to send the commands to the current (selected) context

```sh
# List
kubectl config get-contexts

# Create or update
kubectl config set-context <CONTEXT-NAME> –user=cluster-admin

# Delete
kubectl config delete-context <CONTEXT-NAME>

# Switch
kubectl config use-context <CONTEXT-NAME>
```

## Namespaces

```sh
# List
kubectl get namespace
kubectl get ns

# Create
kubectl create namespace <NAMESPACE-NAME>

# Delete
kubectl delete namespace <NAMESPACE-NAME>

# Filter resources by namespace
kubectl get pods --namespace=<NAMESPACE-NAME>

# Set the default namespace
kubectl config set-context --current --namespace=<NAMESPACE-NAME>
```

## Commands

- Basic Commands (Beginner)

  - `create`: Create a resource from a file or from stdin.
  - `expose`: Take a replication controller, service, deployment or pod and expose it as a new Kubernetes Service

    ```sh
    kubectl expose pod green --port 8008 --name blue-green

    kubectl expose deployment -my-app --type=NodePort --name=my-service --port=80 --targetPort=8080 --nodePort=3000
    ```

  - `run`: Run a particular image on the cluster

    > We shouldn't be arbitrarily running pods in the cluster, we should be given the desired state and leave k8s to do it

  - `set`: Set specific features on objects

- Basic Commands (Intermediate)

  - `explain`: Documentation of resources

    ```sh
    kubectl explain pod
    kubectl explain pod.spec.restartPolicy
    ```

  - `get`: Display one or many resources

    > Use `kubectl api-resources` for a complete list of supported resources

    ```sh
    # List all the namespaces in ps output format.
    kubectl get ns

    # List all pods in ps output format.
    kubectl get pod
    kubectl get pods

    # Watch all pods
    kubectl get pods --watch

    # Get the full information about a single pod in YAML output format.
    kubectl get pod web-pod-13je7 -o yaml

    # Get the full information about a single pod in YAML output format and save it into a file
    kubectl get pod web-pod-13je7 -o yaml > web-pod.yaml

    # List all pods in ps output format with more information (such as node name).
    kubectl get pods -o wide

    # List a single replication controller with specified NAME in ps output format.
    kubectl get replicationcontroller web

    # List deployments in JSON output format, in the "v1" version of the "apps" API group:
    kubectl get deployments.v1.apps -o json

    # List a single pod in JSON output format.
    kubectl get -o json pod web-pod-13je7

    # List a pod identified by type and name specified in "pod.yaml" in JSON output format.
    kubectl get -f pod.yaml -o json

    # List resources from a directory with kustomization.yaml - e.g. dir/kustomization.yaml.
    kubectl get -k dir/

    # Return only the phase value of the specified pod.
    kubectl get -o template pod/web-pod-13je7 --template={{.status.phase}}

    # List resource information in custom columns.
    kubectl get pod test-pod -o custom-columns=CONTAINER:.spec.containers[0].name,IMAGE:.spec.containers[0].image

    # List all replication controllers and services together in ps output format.
    kubectl get rc,services

    # List one or more resources by their type and names.
    kubectl get rc/web service/frontend pods/web-pod-13je7
    ```

  - `edit`: Edit a resource on the server
  - `delete`: Delete resources by filenames, stdin, resources and names, or by resources and label selector

    ```sh
    # This deletes the specified service
    kubectl delete service blue-green
    
    # This deletes all the resources in the current namespace
    kubectl delete all --all

    # This deletes all the resources in the specified namespace
    kubectl delete all --all -n NAMESPACE
    ```

- Deploy Commands

  - `rollout`: Manage the rollout of a resource
  - `scale`: Set a new size for a Deployment, ReplicaSet or Replication Controller
  - `autoscale`: Auto-scale a Deployment, ReplicaSet, StatefulSet, or ReplicationController

- Cluster Management Commands

  - `certificate`: Modify certificate resources.
  - `cluster-info`: Display cluster info
  - `top`: Display Resource (CPU/Memory) usage.

    ```sh
    kubectl top pods
    ```

    > Metrics server isn't included with Docker Desktop's installation of Kubernetes and to install it we will have to download the latest components.yaml file from [Metrics-Server](https://github.com/kubernetes-sigs/metrics-server/releases) releases page and open it in your text editor.

    ```sh
    kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.7.0/components.yaml
    ```

  - `cordon`: Mark node as unschedulable
  - `uncordon`: Mark node as schedulable
  - `drain`: Drain node in preparation for maintenance
  - `taint`: Update the taints on one or more nodes

- Troubleshooting and Debugging Commands

  - `describe`: Show details of a specific resource or group of resources

    ```sh
    kubectl describe pod my-pod
    ```

  - `logs`: Print the logs for a container in a pod

    ```sh
    # kubectl logs [POD] [flags]
    # kubectl logs [POD/CONTAINER] [flags]
    kubectl logs my-pod
    kubectl logs kube-state-metrics-84bc8877d7-p6md9 -n metrics

    # This will show all the logs across all the pods with the run=hello-world label
    kubectl logs --selector=run=hello-world
    ```

  - `attach`: Attach to a running container
  - `exec`: Execute a command in a container

    ```sh
    kubectl exec -it pod/YOUR_POD_NAME /bin/sh
    ```

    Some images are built from _scratch_, so it is not possible to run this command since the image does not have a _shell_. In this case there are some options:

    - Use `kubectl debug` instead and attach the pod
    - Use a _sidecar_, an easy way to do this is to run an _imperative_ command

      > The `nixery.dev` is an special image that creates an dynamic image using the arguments after shell, in the following case is adding `curl`, `wget` and `htop`

      ```sh
      kubectl run -it net-debug --image=nixery.dev/shell /bin/bash
      kubectl run -it net-debug --image=nixery.dev/shell/curl/wget/htop /bin/bash
      ```

  - `port-forward`: Forward one or more local ports to a pod

    ```sh
    # Listen on ports 5000 and 6000 locally, forwarding data to/from ports 5000 and 6000 in the pod
    kubectl port-forward pod/mypod 5000 6000

    # Listen on ports 5000 and 6000 locally, forwarding data to/from ports 5000 and 6000 in a pod selected by the deployment
    kubectl port-forward deployment/mydeployment 5000 6000

    # Listen on port 8443 locally, forwarding to the targetPort of the service's port named "https" in a pod selected by the service
    kubectl port-forward service/myservice 8443:https

    # Listen on port 8888 locally, forwarding to 5000 in the pod
    kubectl port-forward pod/mypod 8888:5000

    # Listen on port 8888 on all addresses, forwarding to 5000 in the pod
    kubectl port-forward --address 0.0.0.0 pod/mypod 8888:5000

    # Listen on port 8888 on localhost and selected IP, forwarding to 5000 in the pod
    kubectl port-forward --address localhost,10.19.21.23 pod/mypod 8888:5000

    # Listen on a random port locally, forwarding to 5000 in the pod
    kubectl port-forward pod/mypod :5000
    ```

    > It seems like when the `port-forward` is used only with pods, the requests are forwarded to the first available pod instead load balance the requests

  - `proxy`: Run a proxy to the Kubernetes API server
  - `cp`: Copy files and directories to and from containers.
  - `auth`: Inspect authorization
  - `debug`: Create debugging sessions for troubleshooting workloads and nodes

     ```sh
     kubectl debug my-pod-name --attach
     ```

- Advanced Commands

  - `diff`: Diff live version against would-be applied version

    ```sh
    kubectl diff -f definition.yaml
    ```

  - `apply`: Apply a configuration to a resource by filename or stdin

    ```sh
    # This will apply the changes mentioned in the my-pod.yaml
    kubectl apply -f ./my-pod.yaml

    # This will apply all the changes mentioned in all yaml within the current folder
    kubectl apply -f .
    ```

    > The apply command does NOT delete resources, this leads to orphan resources

  - `patch`: Update field(s) of a resource
  - `replace`: Replace a resource by filename or stdin
  - `wait`: Experimental: Wait for a specific condition on one or many resources.
  - `kustomize`: Build a kustomization target from a directory or URL.

- Settings Commands

  - `label`: Update the labels on a resource
  - `annotate`: Update the annotations on a resource
  - `completion`: Output shell completion code for the specified shell (bash or zsh)

- Other Commands

  - `api-resources`: Print the supported API resources on the server
  - `api-versions`: Print the supported API versions on the server, in the form of "group/version"
  - `config`: Modify kubeconfig files

    ```sh
    # This switch the "default" namespace in commands
    kubectl config set-context --current --namespace=NAMESPACE
    ```

    > To access resources in another namespaces you must provide the name in the following format `<resource>.<namespace>`

  - `plugin`: Provides utilities for interacting with plugins.
  - `version`: Print the client and server version information

## Plugins

### Sniff

This is a plugin used to sniff network traffic using WireShark

```sh
kubectl sniff my-pod
```

## Helpful Scripts

- Shorter Aliases PowerShell for `kubectl`

  ```ps1
  # Allows to run kubectl with just "k" instead "kubectl"
  New-Alias -Name k -Value kubectl
  ```

- Use `--dry-run` to check what could happen if you apply a given command

  ```sh
  kubectl create configmap website --from-file=index.html --dry-run -o yaml > website.yaml
  ```

## More Information

- [Commands](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
- [Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Reference](https://kubernetes.io/docs/reference/kubectl/overview/)
