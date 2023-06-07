# openobserve-chart
Helm chart for [OpenObserve](https://github.com/openobserve/openobserve)

Currently supports single-node operation.

## Installing
Clone the repository and:

1. Customize values
2. helm install openobserve ./openobserve -f values.yaml -n openobserve --create-namespace
