{{/*
Expand the name of the chart.
*/}}
{{- define "frontend-react-native.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "frontend-react-native.fullname" -}}
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
{{- define "frontend-react-native.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "frontend-react-native.labels" -}}
helm.sh/chart: {{ include "frontend-react-native.chart" . }}
{{ include "frontend-react-native.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "frontend-react-native.selectorLabels" -}}
app.kubernetes.io/name: {{ include "frontend-react-native.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "frontend-react-native.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "frontend-react-native.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
```

## Structure complète du dossier `templates/` :
```
templates/
├── NOTES.txt           (affiche des infos après install)
├── _helpers.tpl        (fonctions utilitaires)
├── deployment.yaml
├── service.yaml
├── ingress.yaml
├── configmap.yaml
├── hpa.yaml
└── serviceaccount.yaml