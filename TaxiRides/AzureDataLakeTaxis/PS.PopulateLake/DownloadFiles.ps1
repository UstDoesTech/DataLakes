#
# adls.DownLoadTaxiFiles loops through text files to download files from AWS and put the files in a folder on a VM
#

foreach($file in Get-Content "F:\NycTaxi2016.txt")
{$destination = $file.Replace("https://s3.amazonaws.com/nyc-tlc/trip+data/","F:\Taxis\2016\")
Invoke-WebRequest $file -OutFile $destination }