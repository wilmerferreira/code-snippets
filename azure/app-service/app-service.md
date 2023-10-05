# Azure App Service

This includes Web Apps and Web Jobs

## Supported Languages

- .NET & .NET Core
- Java
- Node.js
- PHP
- Python
- Ruby
- HTML
- Docker

## App Service plan

Brings together everything you need to create websites, mobile back-ends and web APIs for any platform or device.

- Pricing Categories & Tiers
  - Dev/test
    - F1: Shared Infrastructure
    - D1: Shared Infrastructure
    - B1: 100 Total ACU
  - Production
  - Isolated

There're some restrictions or limitations around them, some tiers might not be available for some publish options (code or container), operative systems or regions.

### Resources

- RAM
- ACU (Azure Compute Units)
- Scale: number of running instances
- Staging Slot: enables multiple versions of an app
- Backup: limited number of backup
- Storage
- Region
- Number of VM instances
- Size of VM instances
  - Shared compute
    - Free
    - Shared (preview)
  - Dedicated compute
    - Basic
    - Standard
    - Premium
    - PremiumV2
  - Isolated
  - Consumption

## Scaling

The scaling options are linked to the app service plan

- Scaling out: Allows to change the number of running instances in the app service
  `Settings > Scale out (App Service plan) > Configure > Manual Scale > Instance count`

- Scaling up: Allows to change the tier of the app service plan
  `Settings > Scale up (App Service plan) > Configure > Manual Scale > Instance count`

  > This is split per groups (Dev / Test, Production and Isolated)

### Autoscaling

The autoscaling limits per pricing tier are:

- Basic: Up to 3 (manual)
- Standard: Up to 10
- Premium: Up to 20

The custom autoscale structure are

- Autoscaling setting (only one per app service)
  - Profile: this contains the capacity limits (mininum and maximum)
    - Rules

Autoscale profile types

- Regular profile
- Fixed date profile
- Recurrence profil

- Condition
- Metric
- Criteria
- Sample
- Action

> Run history

## Deployment Slots

They are only available in the Standard, Premium, or Isolated tiers.

These are located at `App Service Plan > App Service > Deployment Slot`

Deploy > Confirm > Promote Workflow (via IP swap)
http://SITENAME-SLOTNAME.azurewebsites.net
A/B testing by percentage (App Service > Deployment > Deployment Slots)
`az webapp`

## Deployments

Publish profile: web or FTP

- Continuous Deployment (CI/CD)
  - [Continuous deployment](https://docs.microsoft.com/en-us/azure/app-service/deploy-continuous-deployment)
    - Azure DevOps
    - GitHub
    - BitBucket
  - [Local Git](https://docs.microsoft.com/en-us/azure/app-service/deploy-local-git)
- Manual Deployments (push/sync)
  - [Cloud Sync](https://docs.microsoft.com/en-us/azure/app-service/deploy-content-sync)
    - OneDrive
    - Dropbox
  - [ZIP/WAR](https://docs.microsoft.com/en-us/azure/app-service/deploy-zip)
  - External Git
  - [FTP/S](https://docs.microsoft.com/en-us/azure/app-service/deploy-ftp)
- [Custom Containers](https://docs.microsoft.com/en-us/azure/app-service/deploy-ci-cd-custom-container)
- [Github Actions](https://docs.microsoft.com/en-us/azure/app-service/deploy-github-actions)
- [Github Actions for Containers](https://docs.microsoft.com/en-us/azure/app-service/deploy-container-github-action)
- ???
  - Git
  - Azure CLI
  - Visual Studio
  - Web Apps for Containers
    - Docker Hub
    - Azure Container Registry
    - Private Container Registry

These options are found in `Web App > Deployment > Deployment Center`

### Auto swap

1. Go to `Web App > Configuration / Deployment Slot`
2. Enable `Auto swap`
3. Select the `Auto swap deployment slot`

## Logging

- Enable logging in the App Service (Monitoring > App Service logs), choose `Application Logging (Filesystem)` if is for a short period
  - Select the logging Level and click on Save
- Check the App Service logs (Monitoring > Log stream), choose `Application Logging (Filesystem)` if is for a short period
  - Make sure the `Application logs` is selected

## Azure Traffic Manager

- Priority
- Weighted
- Performance
- Geographic

## Other tools

- Kudu & Kudu Lite

## Pending to review in code

- Different deployment types
- Containers
- Autoscale (Scale out)
- Swap
- Azure Traffic Manager
- App Service with C# in linux machines (.net core or .net 5)
