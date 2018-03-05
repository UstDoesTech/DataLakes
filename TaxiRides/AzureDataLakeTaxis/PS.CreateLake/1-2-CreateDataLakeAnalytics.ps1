#
# adla.ps1
#

Login-AzureRmAccount

Get-AzureRmSubscription

Set-AzureRmContext -SubscriptionId <00000000-0000-0000-0000-000000000000>

#Use the name of the resource group you want to use e.g. rgResourceGroup
$ResourceGroupName = "PleaseReplaceMe"

#The location of your resources. 
$LocationName = "East US 2"

#Use the name of the Azure Data Lake Store you want to use e.g. adlsDataLakeStore
$DataLakeStoreName = "pleasereplaceme"

#Use the name of the Azure Data Lake Store you want to use e.g. adlsDataLakeStore
$DataLakeAnalyticsName = "pleasereplaceme"

Write-Host "Create a Data Lake Analytics account ..."  -ForegroundColor Green
 New-AzureRmDataLakeAnalyticsAccount `
     -Name $DataLakeAnalyticsName `
     -ResourceGroupName $ResourceGroupName `
     -Location $LocationName `
     -DefaultDataLake $DataLakeStoreName

Write-Host "The newly created Data Lake Analytics account ..."  -ForegroundColor Green
 Get-AzureRmDataLakeAnalyticsAccount `
     -ResourceGroupName $ResourceGroupName `
     -Name $DataLakeAnalyticsName 