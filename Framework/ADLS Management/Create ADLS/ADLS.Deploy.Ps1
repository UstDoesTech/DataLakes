<#
 .SYNOPSIS
    Deploys a template to Azure

 .DESCRIPTION
    Deploys an Azure Resource Manager template

 .PARAMETER subscriptionId
    The subscription id where the template will be deployed.

 .PARAMETER resourceGroupName
    The resource group where the template will be deployed. Can be the name of an existing or a new resource group.

 .PARAMETER resourceGroupLocation
    Optional, a resource group location. If specified, will try to create a new resource group in this location. If not specified, assumes resource group is existing.

 .PARAMETER deploymentName
    The deployment name.

 .PARAMETER templateFilePath
    Optional, path to the template file. Defaults to template.json.

 .PARAMETER parametersFilePath
    Optional, path to the parameters file. Defaults to parameters.json. If file is not found, will prompt for parameter values based on template.
#>

param(
 [Parameter(Mandatory=$True)]
 [string]
 $subscriptionId,

 [Parameter(Mandatory=$True)]
 [string]
 $resourceGroupName,

 [string]
 $resourceGroupLocation,

 [Parameter(Mandatory=$True)]
 [string]
 $deploymentName,

 [string]
 $templateFilePath,
 #= "template.json",

 [string]
 $parametersFilePath
 #= "parameters.json"
)

<#
.SYNOPSIS
    Registers RPs
#>
#Function RegisterRP {
#   Param(
#        [string]$ResourceProviderNamespace
#    )
#
#    Write-Host "Registering resource provider '$ResourceProviderNamespace'";
#    Register-AzureRmResourceProvider -ProviderNamespace $ResourceProviderNamespace;
#}

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************
$ErrorActionPreference = "Stop"

# sign in
Write-Host "Logging in...";
Login-AzureRmAccount;

# select subscription
Write-Host "Selecting subscription '$subscriptionId'";
Select-AzureRmSubscription -SubscriptionID $subscriptionId;

# Register RPs
#$resourceProviders = @("microsoft.datalakestore");
#if($resourceProviders.length) {
#    Write-Host "Registering resource providers"
#    foreach($resourceProvider in $resourceProviders) {
#        RegisterRP($resourceProvider);
#    }
#}

#Create or check for existing resource group
$resourceGroup = Get-AzureRmResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if(!$resourceGroup)
{
    Write-Host "Resource group '$resourceGroupName' does not exist. To create a new resource group, please enter a location.";
    if(!$resourceGroupLocation) {
        $resourceGroupLocation = Read-Host "resourceGroupLocation";
    }
    Write-Host "Creating resource group '$resourceGroupName' in location '$resourceGroupLocation'";
    New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
}
else{
    Write-Host "Using existing resource group '$resourceGroupName'";
}

# Start the deployment
Write-Host "Starting deployment... AzureDataLakeStore";
if(Test-Path $parametersFilePath) {
    New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath -TemplateParameterFile $parametersFilePath -Force ;
} else {
    New-AzureRmResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath -Force;
}
Write-Host $deploymentName ' has been created' -ForegroundColor Cyan

# Set service principal permissions

Write-Host 'Setting service principal permissions ...'

$appname = “ServicePrincipal”
$resourceName = “adventureworksadlsweudev”

$app = Get-AzureRmADApplication -DisplayName $appname

$servicePrincipal = Get-AzureRmADServicePrincipal  -SearchString $appname

Set-AzureRmDataLakeStoreItemAclEntry -AccountName $resourceName -Path / -AceType User -Id $servicePrincipal.Id -Permissions All -Default

#Set-AzureRmDataLakeStoreItemAclEntry -AccountName $dataLakeStoreName -Path /system -AceType User -Id $servicePrincipal.Id -Permissions All -Default
Write-Host 'Service principal security has been assigned' -ForegroundColor Cyan

