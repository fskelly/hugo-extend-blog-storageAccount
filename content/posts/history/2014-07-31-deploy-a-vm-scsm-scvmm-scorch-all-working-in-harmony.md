+++
author = "Fletcher Kelly"
title = "Deploy a VM – SCSM, SCVMM, SCORCH – all working in harmony"
date = "2014-07-31T12:19:03+00:00"
tags = [
  "Grey Agent",
  "ITSM",
  "Runbook",
  "SCO",
]
categories = [
  "Virtual Machine Manager",
  "PowerShell",
  "System Center",
  "Orchestrator",
  "Service Manager"
]
type = "post"
+++

<!-- CANBEPUBLISHED -->

So, it has been a while.

So, the requirement for this project was as follow.

1. Use Service Manager.
2. Provide a portal for logging a VM Creation request.
3. Build the computername based on a predetermined pattern.
4. Determine first available name.
5. Perform a capacity check.
6. Deploy the set number of VMs.

I am going to skip over the first 2 Points, there are numerous topics covering this. So, onto point 3, I created a Service Request Extension, if anyone would like some info on this, also plenty of articles, please let me know and I can do a blog post on the Extension, or I can make the extension available for you to seal yourselves. Anyways, I mapped all the prompts required within the Request Offering and published it to SharePoint Service Manager Portal.

So, now it is onto the Computername Pattern, for the sake of my customer's privacy, I will not use there exact naming pattern, but rather use XX-YY-Z type of naming, to give you the idea. Of course, Loving [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.1) the way I do, I turned to old faithful.

I will provide the basic PowerShell code in snippets and allow you to expand onto it as you see fit, I built in a fair amount of specific error checking for my customer which will NOT be included in this post.

The [Quest Commandlets](http://www.quest.com/powershell/activeroles-server.aspx) will be needed for these scripts. The code is being re-formatted due to the blog hoster. Please change the required values.

```powershell
#build computer name

$businessApplication = "<>" #now from ORC as part of SR  
$function = "<>" #now from ORC as part of SR  
$location = "<>" #now from ORC as part of SR  
$affinity = "<>" #now from ORC as part of SR  
$role = "<>" #now from ORC as part of SR  
$businessUnit = "<>" #now from ORC as part of SR

#naming convention  
#1 letter - BusinessUnit  
$businessUnit = $businessUnit.Substring(0,1)  
$businessApplication  
#3 letters - location  
$location = $location.Substring(0,3)  
$location

#placecholder (-)

#1 letter - role  
$role = $role.Substring(0,1)  
$role

#1 letter - Function  
$function = $function.Substring(0,1)  
$function

#tiebreaker (XXX)

#3 Letters &#8211; Business Application  
$businessApplication = $businessApplication.Substring(0,3)  
$businessApplication

#1 letter - Affinity  
$affinity = $affinity.Substring(0,1)  
$affinity

$computernamepattern = $businessUnit + $location +"-"+ $role + $function+"XXX" + $businessApplication+$affinity  
$computernamepattern

$computernametocheck = $computernamepattern.Replace("XXX&","001")  
$computernametocheck

$part1 = $computernamepattern.Substring(0,7)  
$part3 = $computernamepattern.Substring(10,4)  
$part2 = $computernamepattern.Substring(7,3)

#==============================================================  
#Check if computer name exists

Add-PSSnapin quest.ActiveRoles.ADManagement  
$i = 1  
do  
{  
$computername = $part1 + "{0:D3}"; -f $i + $part3  
";testing $computername";  
$test = get-qadcomputer $computername  
if ($test)  
{"Computer Exists"}  
Else  
{$computerstartname = $computername}  
$i++  
}  
until ($computerstartname -ne $null)

#==========================================================  
#create computers

$part1 = $computerstartname.Substring(0,7)  
$part3 = $computerstartname.Substring(10,4)  
$part2 = $computerstartname.Substring(7,3)  
[int]$partnumber = $part2.Substring(2,1)  
$computerstobeCreated = "";  
$computersRequested = "Value_from_Orc";

$computersCreated = 0  
$filepath = "C:\Tools\testing.txt";  
New-Item -Path $filepath -ItemType file

do  
{  
$newcomputer = $part1 + "{0:D3}"; -f $partnumber + $part3  
#New-QADComputer -Name $newcomputer -ParentContainer ";OU=Test Computer Accounts,OU=System Accounts,DC=bui,DC=co,DC=za";  
write-host $newcomputer  
write-host $computersCreated  
Add-Content -Path $filepath -Value $newcomputer  
$computersCreated++  
$partnumber++  
$computerstobeCreated = $computerstobeCreated + "" + $newcomputer  
}  
while ($computersCreated -le ($computersRequested-1))

$computerstobeCreated = $computerstobeCreated.Substring(1)

```

I  check the nodes within the Cluster and then find the node with the least amount of Virtual Machines on it. Then use this node information for the creation of the VM. Now time for the free space, since this was a Cluster. I get all the CSV information and then sort by the free space and select the first object as this one would have the most amount of free space.

This is a basic capacity check as per the customer's requirement, as part of this a field within Service Manager is updated to allow some more information to be shared within the members of the team working on this request.

```powershell
#==========================================================  
#Check for placement issues

$VMCluster = "<>"

$VMMServer = "<>"

$numberOfVMS = "<>"

$hostmachinedomain = (gwmi WIN32_ComputerSystem -ComputerName $VMMServer).Domain

$ClusterFQDN = $VMCluster + "." +$hostmachinedomain

$nodes = (get-scvmhostcluster -Name $VMCluster).nodes 

$colPlacementInfo = @()

#$placementInfo = New-Object system.object

foreach ($node in $nodes)  
{  
$placementInfo = New-Object system.object

$placement = (Get-SCVMHost $node).AvailableForPlacement

switch($placement)  
{  
  "True"  
{  
$placementInfo | Add-Member NoteProperty -name Placement -value "True";  
}  
"False"  
{  
$placementInfo | Add-Member NoteProperty -name Placement -value "False";  
}  
}  
$colPlacementInfo += $placementInfo  
} 

If ($colPlacementInfo.placement -ccontains "False";)  
{$Proceed="No"}  
else  
{$Proceed="Yes"}

#capacity check

$VMCluster = "<value_from_orc>"

$VMMServer = "<value_from_orc>"

$numberOfVMS = "<value_from_orc>"

$hostmachinedomain = (gwmi WIN32_ComputerSystem -ComputerName $VMMServer).Domain

$ClusterFQDN = $VMCluster +";.";+$hostmachinedomain

$nodes = (get-scvmhostcluster -Name $VMCluster).nodes 

foreach ($node in $nodes)  
{  
#get Memory Information  
$memoryAvailable = (Get-SCVMHost $node.name).AvailableMemory # MB  
$memoryAvailableCluster = $memoryAvailableCluster + $memoryAvailable

[int]$memoryTotal = ((Get-SCVMHost $node.name).TotalMemory) /1mb #bytes "{0:D3}" -f  
$memoryTotalCluster = $memoryTotalCluster + $memoryTotal

#get CPU Information  
$CpuCoreCount = (Get-SCVMHost $node.name).CoresPerCpu  
$CpuCoreTotalCluster = $CpuCoreTotalCluster + $CPUCoreCount  
$CpuCoreTotalCluster

$CpuCount = (Get-SCVMHost -ComputerName $node.name).PhysicalCPUCount  
$CpuTotalClusterCount = $CpuTotalClusterCount + $CpuCount  
$CpuTotalClusterCount

}  
#$memoryAvailableCluster = ($memoryAvailableCluster \*1024\*1024) /1GB  
#$memoryTotalCluster = ($memoryTotalCluster \*1024\*1024) /1GB  
$memoryAvailableClusterdisplay = $memoryAvailableCluster *1024 *1024 /1GB  
#$memoryAvailableCluster = ($memoryAvailableCluster) /1GB  
$memoryTotalClusterdisplay = $memoryTotalCluster *1024 *1024 /1GB  
#$memoryTotalCluster = ($memoryTotalCluster) /1GB

$VMTemplate = Get-SCVMTemplate -Name "<Name>"

$TemplateMemory = $vmtemplate.Memory * $numberOfVMS

$TemplateCPU = $vmtemplate.CPUCount * $numberOfVMS

#Memory Calculation

$memoryAvailbleAfterVm = $memoryAvailableCluster - $TemplateMemory  
$memoryAvailbleAfterVmdisplay = $memoryAvailbleAfterVm *1024 *1024 /1GB  
#$memoryAvailbleAfterVm = $memoryAvailbleAfterVm /1GB  
$memoryAvailbleAfterVm  
$memoryAvailbleAfterVmdisplay  
#$memoryAvailbleAfterVm = $memoryAvailbleAfterVm.tostring() + ";GB"; 

$Storage = (get-scvmhostcluster $VMCluster).SharedVolumes  
$StorageCapacity = ($Storage | Measure-Object -Property Capacity -Sum).sum  
$StorageFreeSpace = ($Storage | Measure-Object -Property FreeSpace -Sum).sum  
$StorageUsed = $StorageCapacity - $StorageFreeSpace

$VMVHDUsedSpace = $VMTemplate.TotalVHDCapacity * $numberOfVMS  
$freeSpaceAfterVMS = $StorageFreeSpace - $VMVHDUsedSpace

#=============================================  
```

So, I have been using bits and pieces of Orchestrator to string these activities together. However the real power comes in now after using all the pieces from other steps to now, the ACTUAL Deployment. For the sake of simplicity, I am attaching a screenshot of the runbook. Please feel free to contact me (details below) should you want any additional information.

Most of the PowerShell within the Runbook is as a result of unique constraints within this environment, and most cannot be shared. However, like I said, should you want specifics, feel free to contact me and will provide what I can.

The runbook is attached as well, please use at your own discretion, PROVIDED AS IS. [DeployVMRunbook](https://github.com/fskelly/hugo-extend-blog-storageAccount/blob/main/externalFiles/2014/07/31/deployvmrunbook.ois_export)

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
