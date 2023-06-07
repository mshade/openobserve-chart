# openobserve-chart
Helm chart for [OpenObserve](https://github.com/openobserve/openobserve)

Currently supports single-node operation.

## Installing
Clone the repository and:

1. Customize values
2. `helm install openobserve ./openobserve -f myvalues.yaml -n openobserve --create-namespace`

An initial root user password will be generated for you, or can be specified at install time with `--set auth.initialPassword=supersecret`.

If none is specified, retrieve the password from the generated secret:
```
$ kubectl -n openobserve get secret initial-root-password -ojsonpath="{.data.password}" | base64 -d
```
