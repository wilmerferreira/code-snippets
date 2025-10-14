# Jobs

```sh
kubectl create job my-job -n my-namespace --image=busybox --dry-run=client -o yaml
```

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: my-job
  namespace: my-namespace # optional
spec:
  template:
    spec:
      containers:
      - name: my-job
        image: busybox
      restartPolicy: OnFailure
```

More information:

- [kubectl create job](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_job/)
