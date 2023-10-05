$groupName = "az204-ResourceGroup";
$location = "West US 2"; # Get-AzLocation | ft
$vNetName = "az204VNET";

# Connect-AzAccount

# Select-AzureSubscription -SubscriptionId 9af93312-1f2e-445a-a303-94c0e447ad6f

New-AzResourceGroup -Name $groupName -Location $location

# TODO: Network
# TODO: NIC
# TODO: Virtual Machine