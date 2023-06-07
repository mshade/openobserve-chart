# OpenObserve Helm Chart - Single Node

![Lint, Test, Release](https://github.com/mshade/openobserve-chart/actions/workflows/lint-test-release.yml/badge.svg)

Helm chart for single-node installation of [OpenObserve](https://github.com/openobserve/openobserve).

The [official OpenObserve chart](https://github.com/openobserve/openobserve-helm-chart/) supports HA operation, but contains many more components. This is a simpler alternative which still provides more flexibility than the bare k8s manifests.

## Installing

Clone the repository and:

1. Customize [values.yaml](./openobserve/values.yaml)
2. `helm repo add mshade-openobserve https://mshade.github.io/openobserve-chart`
3. `helm repo update`
3. `helm install openobserve openobserve -f values.yaml -n openobserve --create-namespace`

An initial root user password will be generated for you, or can be specified at install time with `--set auth.initialPassword=supersecret`.

If none is specified, retrieve the password from the generated secret:
```
$ kubectl -n openobserve get secret initial-root-password -ojsonpath="{.data.password}" | base64 -d
```
