# openobserve

Helm chart for single-node deployment of OpenObserve observability platform

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.4.7](https://img.shields.io/badge/AppVersion-v0.4.7-informational?style=flat-square)

## Additional Information

The [official OpenObserve chart](https://github.com/openobserve/openobserve-helm-chart/) supports HA operation, but contains many more components.
This is a simpler alternative which still provides more flexibility than the bare k8s manifests.

See the [official project repo](https://github.com/openobserve/openobserve) for operation and
configuring ingestion of logs, metrics, and traces.

## Installing the Chart

To install the chart as "openobserve" in the namespace "openobserve":

1. Customize [values.yaml](./values.yaml)
2. `helm repo add mshade-openobserve https://mshade.github.io/openobserve-chart`
3. `helm install openobserve mshade-openobserve/openobserve -f values.yaml -n openobserve --create-namespace`

An initial root user password will be generated for you, or can be specified at install time with `--set auth.initialPassword=supersecret`.

If none is specified, retrieve the password from the generated secret:
```
$ kubectl -n openobserve get secret initial-root-password -ojsonpath="{.data.password}" | base64 -d
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| auth.initialPassword | string | `""` | A random initial password will be set if left empty |
| auth.rootUserEmail | string | `"admin@example.com"` | email address for root user |
| config | object | `{}` | Env vars for OpenObserve configuration see https://github.com/openobserve/openobserve-helm-chart/blob/main/values.yaml#L70 |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"public.ecr.aws/zinclabs/openobserve"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext.fsGroup | int | `2000` |  |
| podSecurityContext.runAsGroup | int | `3000` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `10000` |  |
| resources.limits.cpu | string | `"4096m"` |  |
| resources.limits.memory | string | `"2048Mi"` |  |
| resources.requests.cpu | string | `"256m"` |  |
| resources.requests.memory | string | `"50Mi"` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| storage.dataDir | string | `"/data"` |  |
| storage.storageClassName | string | `""` |  |
| storage.volumeSize | string | `"10Gi"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)