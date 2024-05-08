```sh
mkdir output
helm template --output-dir=./output .
helm template --output-dir=./output --set req=test .
cat ./output/usage-examples/templates/example.yaml
helm template --output-dir=./output --set req=test2 .
cat ./output/usage-examples/templates/example.yaml
helm install --generate-name --dry-run --debug charts/mysubchart
helm install --generate-name --dry-run --debug --set req=test .
```
