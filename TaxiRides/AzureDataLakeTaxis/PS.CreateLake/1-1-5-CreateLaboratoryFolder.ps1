#
# Adls.CreateLaboratoryFolder creates the Laboratory folder, which is used by data scientist and analysts
# to experiment with data from various folders and areas in the data lake
#

#Use the name of the Azure Data Lake Store you want to use e.g. adlsDataLakeStore
$DataLakeStoreName = "pleasereplaceme"
$myrootdir = "/"

New-AzureRmDataLakeStoreItem -Folder -AccountName $dataLakeStoreName -Path $myrootdir/Laboratory
