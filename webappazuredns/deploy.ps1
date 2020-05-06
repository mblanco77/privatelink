
#Connect-AzAccount 
#Select-AzSubscription -SubscriptionId "xxxxxxxxxxxxxxxxx"

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. eastus)"
$username = Read-Host -Prompt "Enter the UserName" 
$pass = Read-Host -Prompt "Enter the Vm Password or enter to autogen" -AsSecureString
$autoApprove = Read-Host -Prompt "private link auto Approval (yes/no)"

if ([string]::IsNullOrEmpty($location)){
    $location = "eastus"
}
if ([string]::IsNullOrEmpty($username)){
    $username = "azureuser"
}
if ([string]::IsNullOrEmpty($autoApprove)){
    $autoApprove = "yes"
}

New-AzResourceGroup -Name $resourceGroupName -Location "$location"
if ($pass.Length -gt 0){
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -vmUser $username -VmPass $pass -autoApproval $autoApprove -TemplateFile "./azuredeploy.json" -TemplateParameterFile "./azuredeploy.parameters.json" -Verbose
}
else {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -vmUser $username -autoApproval $autoApprove -TemplateFile "./azuredeploy.json" -TemplateParameterFile "./azuredeploy.parameters.json" -Verbose
}
