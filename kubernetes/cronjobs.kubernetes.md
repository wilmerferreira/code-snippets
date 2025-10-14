# CronJobs

```sh
kubectl create cronjob my-cronjob -n my-namespace --image=busybox --schedule '* * * * *' --dry-run=client -o yaml
```

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: my-cronjob
  namespace: my-namespace # optional
spec:
  schedule: '* * * * *'
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: my-cronjob
            image: busybox
          restartPolicy: OnFailure
```

Suspend a job using the CLI

```sh
kubectl patch cronjob my-cronjob -n my-namespace -p '{"spec":{"suspend":true}}'
```

More information:

- [kubectl create cronjob](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_cronjob/)
