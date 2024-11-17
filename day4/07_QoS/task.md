
1. Write deployment with cpu & memory limits and requests
2. Write resource quota for limiting in namespace `limits` cpu to 1 & memory to 1Gi
3. Create deployment in namespace `limits`
4. Verify usage of resource quota
5. Update deployment to exceed quota and verify pod cannot be created
6. Delete things from this task
