
#Connect-AzAccount 
#Select-AzSubscription -SubscriptionId "xxxxxxxxxxxxxxxxx"

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. eastus)"
$vmUser = Read-Host -Prompt "Enter the Vm UserName" 
$vmPass = Read-Host -Prompt "Enter the Vm Password or enter to autogen" -AsSecureString
$autoApprove = Read-Host -Prompt "private link auto Approval (yes/no)"

if ([string]::IsNullOrEmpty($resourceGroupName)){
    $location = "rgprivatelinkpvtwebapp"
}
if ([string]::IsNullOrEmpty($location)){
    $location = "eastus"
}
if ([string]::IsNullOrEmpty($vmUser)){
    $vmUser = "azureuser"
}

if ([string]::IsNullOrEmpty($autoApprove)){
    $autoApprove = "yes"
}


New-AzResourceGroup -Name $resourceGroupName -Location "$location"
if ($vmPass.Length -gt 0){
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -vmUser $vmUser -VmPass $vmPass -autoApproval $autoApprove -TemplateFile "./azuredeploy.json" -TemplateParameterFile "./azuredeploy.parameters.json" -Verbose
}
else {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -vmUser $vmUser -autoApproval $autoApprove -TemplateFile "./azuredeploy.json" -TemplateParameterFile "./azuredeploy.parameters.json" -Verbose
}
