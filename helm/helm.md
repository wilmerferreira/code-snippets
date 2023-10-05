# Helm

## Commands

- `completion`: generate autocompletion scripts for the specified shell
- `create`: create a new chart with the given name
- `dependency`: manage a chart's dependencies
- `env`: helm client environment information
- `get`: download extended information of a named release

  ```sh
  helm get all -n metrics
  ```

- `help`: Help about any command
- `history`: prints historical revisions for a given release.

  > A default maximum of **256** revisions will be returned.

  ```sh
  # helm history RELEASE_NAME [flags]
  helm history blue-gree
  ```

- `install`: install a chart

  ```sh
  # helm install [NAME] [CHART] [flags]
  helm install kube-state-metrics bitnami/kube-state-metrics -n metrics
  ```

- `lint`: examine a chart for possible issues
- `list`: list releases

  ```sh
  helm list
  helm ls -n metrics
  ```

- `package`: package a chart directory into a chart archive
- `plugin`: install, list, or uninstall Helm plugins
- `pull`: download a chart from a repository and (optionally) unpack it in local directory
- `repo`: add, list, remove, update, and index chart repositories

  - `add`: add a chart repository

    ```sh
    helm repo add bitnami https://charts.bitnami.com/bitnami
    # Run the "helm repo update" after this to make sure we have access to the latest versions of the charts
    ```

  - `index`: generate an index file given a directory containing packaged charts

  - `list`: list chart repositories

    ```sh
    helm repo list
    ```

  - `remove`: remove one or more chart repositories
  - `update`: update information of available charts locally from chart repositories

    ```sh
    helm repo update
    ```

- `rollback`: roll back a release to a previous revision
- `search`: search for a keyword in charts
- `show`: show information of a chart
- `status`: display the status of the named release
- `template`: locally render templates

  ```sh
  # helm template [NAME] [CHART] [flags]
  ```

- `test`: run tests for a release
- `uninstall`: uninstall a release
- `upgrade`: upgrade a release
- `verify`: verify that a chart at the given path has been signed and is valid
- `version`: print the client version information

## Charts

`PENDING`

## Templates

`PENDING`

## Popular Charts

- [kube-prometheus-stack](https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack)
  - prometheus-community/kube-state-metrics
  - prometheus-community/prometheus-node-exporter
  - grafana/grafana
- [kubernetes-dashboard](https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard)

## More Information

- [helm.sh](https://helm.sh)
  - [Installing Helm](https://helm.sh/docs/intro/install/)
- [helm/helm - GitHub](https://github.com/helm/helm)
- [artifacthub.io](https://artifacthub.io), previously known as [hub.helm.sh](https://hub.helm.sh)
- [Kubernetes: Package Management with Helm](https://www.linkedin.com/learning/kubernetes-package-management-with-helm/)
- [Kubernetes: Microservices](https://www.linkedin.com/learning/kubernetes-microservices/)
