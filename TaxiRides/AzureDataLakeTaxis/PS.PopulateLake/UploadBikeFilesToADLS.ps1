Login-AzureRmAccount
Set-AzureRmContext -SubscriptionId 000000-0000-0000-000000000

$myrootdir ="/RAW/Bikes"
$dataLakeStoreName = "datalakestore"

Import-AzureRmDataLakeStoreItem -AccountName $dataLakeStoreName -Path "C:\Temp\BikeShare\Unzipped" -Destination $myrootdir
