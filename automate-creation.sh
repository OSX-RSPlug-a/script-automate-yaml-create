#!/bin/bash

directoryName=''


nameRange="script1 script2 script3 script4 script5 script6 script7 script8 script9"


yamlFile=provider.yaml


yamlTemplate="apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: providers-name
  annotations:
    argocd.argoproj.io/sync-wave: "0"
spec:
  destination:
    name: ''
    namespace: providers
    server: 'https://kubernetes.default.svc'
  source:
    path: repopath/providers-name
    repoURL: 'https://github.org/URREPO/repo'
    targetRevision: release-k8s
    helm:
      parameters:
        - name: image.tag
          value: provider_name_api-1.6.0.0-alpha.6
  project: default
  syncPolyce:
    automated:
      prune: false
      selfHeal: false
"

for name in $nameRange; do

  mkdir $directoryName$name

  echo "$yamlTemplate" >> $directoryName$name/$yamlFile

  echo -e "creating $directoryName$name $yamlFile $cssFile\nadding default yaml template to $yamlFile\n..."

done

echo done.
