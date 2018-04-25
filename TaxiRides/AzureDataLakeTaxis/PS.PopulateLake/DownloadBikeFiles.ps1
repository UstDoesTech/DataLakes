foreach($file in Get-Content "C:\Temp\NycBikeShare.txt")
{$destination = $file.Replace("https://s3.amazonaws.com/tripdata/","C:\Temp\BikeShare\")
Invoke-WebRequest $file -OutFile $destination }


Get-ChildItem 'C:\Temp\BikeShare\' -Filter *.zip | Expand-Archive -DestinationPath 'C:\Temp\BikeShare\Unzipped\' -Force
