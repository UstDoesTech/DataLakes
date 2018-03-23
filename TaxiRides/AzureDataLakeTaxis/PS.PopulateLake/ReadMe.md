# Populate The Data Lake

A data lake is able to store lots of data. A good, freely available data set is the NYC Taxi data set. http://www.nyc.gov/html/tlc/html/about/trip_record_data.shtml
This has been used in many examples of using big data because it is unstructured data sets, which include geospatial data.
It also numbers over a billion rows: which is pretty useful for exploring concepts at scale!

## Process of Population
I've found that it is not possible to download the files directly from NYC's repository (AWS) to Azure Data Lake Store (ADLS). 
Therefore, I've found it necessary to have an intermediary to download the files, in order to upload them. 
This intermediary is either a local machine, like a laptop, or an Azure VM. 

I've found that an Azure VM is more reliable and has better connection speeds than I am able to produce locally. 

The locations for each data set is within a text file. 
There is PowerShell script to loop through the contents of the file and download the data sets. 
There is another PowerShell script which loops through the downloaded files and uploads them to a designated location in ADLS.
