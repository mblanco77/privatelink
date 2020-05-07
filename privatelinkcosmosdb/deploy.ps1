
#Connect-AzAccount 
#Select-AzSubscription -SubscriptionId "xxxxxxxxxxxxxxxxx"

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. eastus)"
$autoApprove = Read-Host -Prompt "private link auto Approval (yes/no)"

if ([string]::IsNullOrEmpty($location)){
    $location = "eastus"
}

if ([string]::IsNullOrEmpty($autoApprove)){
    $autoApprove = "yes"
}

New-AzResourceGroup -Name $resourceGroupName -Location "$location"

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName  -autoApproval $autoApprove -TemplateFile "./azuredeploy.json" -TemplateParameterFile "./azuredeploy.parameters.json" -Verbose
