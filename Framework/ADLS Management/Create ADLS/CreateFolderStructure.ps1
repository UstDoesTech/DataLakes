# if on build agent then path = d:\a\1\s\DataContracts\*.*
$myrootdir = "//"
$dataLakeStoreName = "adventureworksadlsweu"

$PowerShellConfigFilePath = '.\DataLakeFolderStructure.json'

$resourceGroupName = "adventureworksrgweu"

Login-AzureRmAccount 
# Select a subscription
$RMContext = Set-AzureRmContext -SubscriptionId "000000-0000-0000-0000-0000000000"

Select-AzureRmSubscription -SubscriptionId "000000-0000-0000-0000-0000000000" 

$folders = Get-Content $PowerShellConfigFilePath -Raw | ConvertFrom-Json

# Register for Azure Data Lake Store
#$RmProvider =  Register-AzureRmResourceProvider -ProviderNamespace "Microsoft.DataLakeStore"
#$RmProvider
foreach ($folder in $folders)
{
    $path = $myrootdir + $folder.path
      
    $dl = Get-AzureRmDataLakeStoreItem  -AccountName $dataLakeStoreName -Path $path 

    $dl

    if (!$dl) {
        Write-Host "Attempting to create new Path" -ForegroundColor Cyan
        New-AzureRmDataLakeStoreItem -Folder -AccountName $dataLakeStoreName -Path $path -ErrorAction Stop
        Write-Host "New Path Created" -ForegroundColor Green
    }  

    #Add users
    foreach ($ACL in $folder.security)
    {
        $Type = $ACL.Type
        switch ($Type)
        {
            "User" {$ADGroup = Get-AzureRmADUser -SearchString $ACL.Name}
            "Group" {$ADGroup = Get-AzureRmADGroup -SearchString $ACL.Name}
            "Principal" {$ADGroup = Get-AzureRmADServicePrincipal -SearchString $ACL.Name
                            $Type = "User"}
            default {$ADGroup = Get-AzureRmADUser -SearchString $ACL.Name}
        }
        $ADAccount = Get-AzureRmADGroup -SearchString $ACL.Name
        $ADPermissions =  Get-AzureRmDataLakeStoreItemAclEntry -Account $dataLakeStoreName -Path $path 


        $AddSecurity = 0
        foreach($p in $ADPermissions) {
            if ($p.Id.Equals($ADGroup.Id)){
                $AddSecurity = 1
            }
        }
        
        if ($AddSecurity -eq 0){
            Write-Host "Trying to add security for user/group: $ADGroup" -ForegroundColor Cyan
            try {
                    Set-AzureRmDataLakeStoreItemAclEntry -Account $dataLakeStoreName -Path $path -AceType $Type -Permissions $ACL.Permission -Id $ADAccount.Id -Default $true -ErrorAction Stop
                }
            catch 
                {
                    $ErrorMessage = $_.Exception.Message
                    Write-Host "Failed" $ErrorMessage  -ForegroundColor Red
                    
                }
        }
        
    }
}


Get-AzureRmDataLakeStoreChildItem -AccountName $dataLakeStoreName -Path $myrootdir
