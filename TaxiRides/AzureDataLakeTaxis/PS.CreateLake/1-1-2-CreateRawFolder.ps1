#
# Adls.CreateRawFolder creates the Raw folder, which is used to stage data from various source systems
#

#Use the name of the Azure Data Lake Store you want to use e.g. adlsDataLakeStore
$DataLakeStoreName = "pleasereplaceme"
$myrootdir = "/"

New-AzureRmDataLakeStoreItem -Folder -AccountName $dataLakeStoreName -Path $myrootdir/Raw
