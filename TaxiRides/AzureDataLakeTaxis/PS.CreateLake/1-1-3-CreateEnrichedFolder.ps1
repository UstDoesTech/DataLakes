#
# Adls.CreateEnrichedFolder creates the Enriched folder, which is used to enrich data from various source systems into 
# a format for subscriber systems
#

#Use the name of the Azure Data Lake Store you want to use e.g. adlsDataLakeStore
$DataLakeStoreName = "pleasereplaceme"
$myrootdir = "/"

New-AzureRmDataLakeStoreItem -Folder -AccountName $dataLakeStoreName -Path $myrootdir/Enriched
