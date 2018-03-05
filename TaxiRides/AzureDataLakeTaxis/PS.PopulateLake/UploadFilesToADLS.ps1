#
# adls.UploadTaxiFilesToADLS loops through the folders in the VM to upload to the Data Lake Store
#

Login-AzureRmAccount
Set-AzureRmContext -SubscriptionId 0ab62d65-05dc-4f87-aa35-f3b460bbc42b

$myrootdir ="/Raw/Taxis/2013"
$dataLakeStoreName = "sqlbits2017adls"

Import-AzureRmDataLakeStoreItem -AccountName $dataLakeStoreName -Path "F:\Taxis\2013" -Destination $myrootdir

