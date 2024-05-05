1. Scale statefulset to 4 replicas
2. Watch how replicas wait for each other
3. Scale to 0 replicas
4. Describe statefulset and see events
5. See created pvc for statefulset
6. Scale back to 2 replicas
7. curl localhost endpoint in each replica to see that previous volume was assigned
8. remove unused pvc
9. remove statefulset