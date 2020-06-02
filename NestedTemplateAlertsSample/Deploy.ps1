# Connect to Azure
Connect-AzAccount

# Set the values to use for the deployment
$DeploymentName = "DeployMonitorAlerts"
$rgName = "AzureMonitor"
$location = "westeurope"
$Subscription = "YourSubscruptionNameHere"

# Set the AZ Subscription to work against
Get-AzSubscription -SubscriptionName $Subscription | Set-AzContext

# Deploy the resource group
New-AzResourceGroup -Name $rgName -Location $location

# Deploy the resources from the ARM template
New-AzResourceGroupDeployment `
-Name $DeploymentName `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\AzureDeploy.parameters.json