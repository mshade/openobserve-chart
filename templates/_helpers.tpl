{{/*
Expand the name of the chart.
*/}}
{{- define "openobserve.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openobserve.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openobserve.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "openobserve.labels" -}}
helm.sh/chart: {{ include "openobserve.chart" . }}
{{ include "openobserve.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "openobserve.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openobserve.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "openobserve.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "openobserve.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "openobserve.initialPassword" -}}
  {{- if empty .Values.auth.initialPassword }}
    {{- $secretObj := (lookup "v1" "Secret" .Release.Namespace "initial-root-password") | default dict }}
    {{- $secretData := (get $secretObj "data") | default dict }}
    {{- $rootPass := (get $secretData "initial-root-password") | default (randAlphaNum 16) }}
    {{- if empty $rootPass }}
      {{- $rootPass := "dry-run" }}
    {{- end }}
    {{- printf "%s" $rootPass }}
  {{- else }}
    {{- $initialPassword := .Values.auth.initialPassword }}
    {{- printf "%s" $initialPassword }}
  {{- end}}
{{- end }}
