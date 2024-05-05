# Attach AKS

*Install az*

- https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
- https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt



```sh
az login --tenant f37e3e30-0f6f-478b-952b-143b9f1b4aa2
az account set --subscription aa746456-a787-436c-aa63-689f4a7ec42c
az aks get-credentials --resource-group DefaultResourceGroup-WEU --name trener
```

*install kubectl*