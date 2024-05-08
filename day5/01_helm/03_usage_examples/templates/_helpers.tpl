{{- define "mytemplate" -}}
Some text
{{- end -}}

{{- define "myreq" -}}
Comming from Values {{ tpl .Values.req . }}
{{- end -}}
