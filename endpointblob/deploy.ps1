
#Connect-AzAccount 
#Select-AzSubscription -SubscriptionId "xxxxxxxxxxxxxxxxx"

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$vmUser = Read-Host -Prompt "Enter the Vm UserName" 
$vmPass = Read-Host -Prompt "Enter the Vm Password or enter to autogen" -AsSecureString
$deploygw = Read-Host -Prompt "Deploy vpn Gateways (yes/no)"

if ([string]::IsNullOrEmpty($deploygw)){
    $deploygw = "yes"
}
if ([string]::IsNullOrEmpty($location)){
    $location = "eastus"
}
if ([string]::IsNullOrEmpty($vmUser)){
    $vmUser = "azureuser"
}

New-AzResourceGroup -Name $resourceGroupName -Location "$location"
if ($vmPass.Length -gt 0){
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -vmUser $vmUser -VmPass $vmPass -deploygw $deploygw -TemplateFile "./azuredeploy.json" -TemplateParameterFile "./azuredeploy.parameters.json" -Verbose
}
else {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -vmUser $vmUser -deploygw $deploygw -TemplateFile "./azuredeploy.json" -TemplateParameterFile "./azuredeploy.parameters.json" -Verbose   
}
