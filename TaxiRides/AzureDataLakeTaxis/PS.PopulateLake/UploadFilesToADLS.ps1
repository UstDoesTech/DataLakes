#
# adls.UploadTaxiFilesToADLS loops through the folders in the VM to upload to the Data Lake Store
#

Login-AzureRmAccount
Set-AzureRmContext -SubscriptionId 000000-0000-0000-0000000000

$myrootdir ="/RAW/Taxis/2013"
$dataLakeStoreName = "datalakestore"

Import-AzureRmDataLakeStoreItem -AccountName $dataLakeStoreName -Path "F:\Taxis\2013" -Destination $myrootdir

