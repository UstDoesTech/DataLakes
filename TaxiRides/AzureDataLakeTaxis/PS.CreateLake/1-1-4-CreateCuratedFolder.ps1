#
# Adls.CreateCuratedFolder creates the Curated folder, which is used as a final area for subscribing systems
#

#Use the name of the Azure Data Lake Store you want to use e.g. adlsDataLakeStore
$DataLakeStoreName = "pleasereplaceme"
$myrootdir = "/"

New-AzureRmDataLakeStoreItem -Folder -AccountName $dataLakeStoreName -Path $myrootdir/Curated
