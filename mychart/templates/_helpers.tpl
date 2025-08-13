{{- define "sample-nodejs-app.name" -}}
docker-best-practices
{{- end }}

{{- define "sample-nodejs-app.fullname" -}}
{{ include "sample-nodejs-app.name" . }}
{{- end }}
