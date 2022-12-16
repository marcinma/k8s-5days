1. Create 3 yml replica sets
- each is matching labels for `sages`
- one matches expression with both `db` or `rest`, with `2` replicas
- one matches expression `rest` but not `db`

2. Pod template in RS should be 
- each with label `company: sages`
- one with label `component: db`
- one with label `component: rest`

3. Create each replica set
4. scale rs that mathes rest to 3 replicas
5. Remove rs withouth matching exppression  with `--cascade=orphan`
6. pod is still there
7. Remove rs that _matches_ `rest` but not `db` with `--cascade=orphan`
8. Check pods - either we have both `db` or `db` & `rest` - it is random!
9. Scale RS that matches both to 0 - all pods except from point 4 are deleted
10. At the end delete all pods
