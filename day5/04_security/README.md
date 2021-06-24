1. https://www.cyberark.com/resources/threat-research-blog/kubernetes-pentest-methodology-part-1
2. https://www.cyberark.com/resources/threat-research-blog/kubernetes-pentest-methodology-part-2

```sh
git clone https://github.com/cyberark/kubernetes-rbac-audit
cd kubernetes-rbac-audit
kubectl get roles --all-namespaces -o json > Roles.json
kubectl get clusterroles -o json > clusterroles.json
kubectl get rolebindings --all-namespaces -o json > rolebindings.json
kubectl get clusterrolebindings -o json > clusterrolebindings.json
python3 ExtensiveRoleCheck.py --clusterRole clusterroles.json  --role Roles.json --rolebindings rolebindings.json --cluseterolebindings clusterrolebindings.json
```