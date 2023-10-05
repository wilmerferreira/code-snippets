#!/bin/bash

groupName='az204-ResourceGroup'
location='westus2'
vNetName='az204VNET'
vNetAddress='172.16.0.0/16'
subnetName='az204Subnet'
subnetAddress='172.16.0.0/24'
nicName='az204NIC'
vmName='az204VMTesting'
adminUser='azureadminuser'
adminPassword='Pa$$w0rd!2019'

# az login

# az account set --subscription 9af93312-1f2e-445a-a303-94c0e447ad6f

# az group create \
#     --name $groupName \
#     --location $location

# az network vnet create \
#     --name $vNetName \
#     --location $location \
#     --resource-group $groupName \
#     --address-prefixes $vNetAddress \
#     --subnet-name $subnetName \
#     --subnet-prefixes $subnetAddress

# az network nic create \
#     --name $nicName \
#     --location $location \
#     --resource-group $groupName \
#     --vnet-name $vNetName \
#     --subnet $subnetName

# az vm image list --location $location --publisher MicrosoftWindowsServer --output table
# az vm list-sizes --location $location --output table

az vm create \
    --name $vmName \
    --location $location \
    --resource-group $groupName \
    --nics $nicName \
    --image Win2012R2Datacenter \
    --admin-username $adminUser \
    --admin-password $adminPassword \
    --computer-name $vmName \
    --size Standard_D2_v2