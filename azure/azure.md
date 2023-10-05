# Azure

## Tooling

- [Azure Portal](https://portal.azure.com/)
  - [Azure Portal (Preview)](https://preview.portal.azure.com/)
- [Azure CLI](https://docs.microsoft.com/en-gb/cli/azure/install-azure-cli-windows?view=azure-cli-latest)
- [PowerShell AZ](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
- [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview)
- [Azure Management SDK for .NET](https://github.com/Azure/azure-libraries-for-net)
  - [Quickstart Tutorial - Resource Management](https://github.com/Azure/azure-sdk-for-net/blob/main/doc/mgmt_preview_quickstart.md)

> Most of the code examples made in C# needs a security principal in your Azure subscription  
> [How to: Use the portal to create an Azure AD application and service principal that can access resources](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)

## Resources

- [Azure Virtual Machines](virtual-machines/virtual-machines.md)
- [Azure App Service Web Apps](app-service/app-service.md)
- [Azure Functions](functions/functions.md): Serverless platform

### Azure Blob Storage

- Types
  - Block blobs: up to 100MB
  - Append blobs: 
  - Page blobs: 512b pages, up to 8TB

- Durability options
  - Single Region
    - Local redundant storage (LRS): 3 replicas, one region
    - Zone-redundant storage (ZRS): 3 replicas, 3 zones, one region
    - Geo-redundant storage (GRS): 6 replicas, 2 regions, 3 per region
    - Read-access geo-redundant storage (RA-GRS)
  - Multiple Regions
    - Geo-zone-redundant storage (GZRS)
    - Read-access geo-zone-redundant storage (RA-GZRS)

- Storage tiers
  - Premium: Low and consistent latency data
  - Access tiers
    - Hot: Frequently accessed data
    - Cool: Less frequently accessed data
    - Archive: Rarely frequently accessed data

[Storage use Emulator](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-emulator)

### Azure Cosmos DB

[Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15)

### Azure Container Registry

### Azure Container Instances

### Azure Key Vault

Management of app sensitive information (secrets, key and  certificates)

### Azure API Management services

### Azure Logic Apps

### Azure Event Grid

### Azure Event Hubs

### Azure Notification Hubs

### Azure Monitor

## More Information

- [AZ-204: Developing solutions for Microsoft Azure | GitHub](https://github.com/MicrosoftLearning/AZ-204-DevelopingSolutionsforMicrosoftAzure)