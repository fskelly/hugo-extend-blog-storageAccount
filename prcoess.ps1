$gitCommitMessage = Read-Host "Plesae enter the commit message"
git add .
git commit -m $gitCommitMessage
git push


$rgname = "flkelly-weu-fletchercloudblog"
$storageaccountname = "flkellyneucloudblog"
$containerName = '$web/'
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rgname -Name $storageaccountname -ErrorAction SilentlyContinue
$context = $storageAccount.Context
if(!$storageAccount)  
{  
    $storageAccount = New-AzStorageAccount -ResourceGroupName $rgname -Name $storageaccountname -Location $rglocation -SkuName Standard_RAGRS -Kind StorageV2
    $context = $storageAccount.Context    
} 
 
$container = Get-AzStorageContainer -Name $containerName -Context $context -ErrorAction SilentlyContinue
if(!$container)  
{  
    $container = New-AzStorageContainer -Name $containerName -Context $context -Permission blob    
}

$fileslocation = "C:\repos\blog\testBlog\public"
$numberOfBatch = 10
#Upload files and get the files count
#uploaded in the blob container.
if($container)
{
    $files = Get-ChildItem -Path $fileslocation -Recurse
    for ($i = 1 ; $i -le $numberOfBatch; $i++)
    {
        write-host -ForegroundColor Yellow "Running Batch: " $i
        foreach ($file in $files)
        {
            $ext = (Split-Path -Path $file -Leaf).Split(".")[1];
            $ext
            #Set-AzStorageBlobContent -File $file -Container $containerName -Blob $([guid]::NewGuid().ToString() + "." + $ext) -Context $context
        }
    }
    $blob = Get-AzStorageBlob -Container $containerName -Context $context ` 
    $totalfiles = $blob.Count 

write-host -ForegroundColor Green "$totalfiles files are uploaded successfully"
}