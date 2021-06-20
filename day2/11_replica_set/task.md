1. Create 3 yml replica sets
- each is matching labels for `sages`
- one matches expression with both db & rest, with `2` replicas
- one matches db but not rest

2. Pods in RS should be 
- each with label `company: sages`
- one with label `component: db`
- one with label `component: rest`

3. Create each replica set
4. Remove rs that _matches db but not rest_ with `--cascade=orphan`
5. check pods
6. Sale RS that matches both to 0 - all pods will be removed

