#
# Adla.CreateDataLakeStore creates the data lake store and Resource Group for the solution through Powershell
#

Login-AzureRmAccount

Get-AzureRmSubscription

Set-AzureRmContext -SubscriptionId <00000000-0000-0000-0000-000000000000>

#Use the name of the resource group you want to use e.g. rgResourceGroup
$ResourceGroupName = "PleaseReplaceMe"

#The location of your resources. 
$LocationName = "East US 2"

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $LocationName

#Use the name of the Azure Data Lake Store you want to use e.g. adlsDataLakeStore
$DataLakeStoreName = "pleasereplaceme"

#Creates the new Azure Data Lake Store
New-AzureRmDataLakeStoreAccount -ResourceGroupName $resourceGroupName -Name $dataLakeStoreName -Location $LocationName

#Tests that the newly created Azure Data Lake store has been created successfully
Test-AzureRmDataLakeStoreAccount -Name $dataLakeStoreName
