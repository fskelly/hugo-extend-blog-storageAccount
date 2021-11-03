---
title: Deploy a VM – SCSM, SCVMM, SCORCH – all working in harmony
author: fskelly
type: post
date: 2014-07-31T12:19:03+00:00
url: /2014/07/31/deploy-a-vm-scsm-scvmm-scorch-all-working-in-harmony/
categories:
  - Orchestrator
  - PowerShell
  - Service Manager
  - System Center
  - Virtual Machine Manager

---
<span style="font-family:Calibri;">So, it has been a while.</span>

<span style="font-family:Calibri;">SO, the requirement for this project was as follow.</span>

<span style="font-family:Calibri;">1. Use Service Manager</span>

<span style="font-family:Calibri;">2. Provide a portal for logging a VM Creation request.</span>

<span style="font-family:Calibri;">3. Build the computername based on a predetermined pattern.</span>

<span style="font-family:Calibri;">4. Determine first available name</span>

<span style="font-family:Calibri;">5. Perform a capacity check.</span>

<span style="font-family:Calibri;">6. Deploy the set number of VMs.</span>

<span style="font-family:Calibri;">I am going to skip over the first 2 Points, there are numerous topics covering this. So, onto point 3, I created a Service Request Extension, if anyone would like some info on this, also plenty of articles, please let me know and I can do a blog post on the Extension, or I can make the extension available for you to seal yourselves. Anyways, I mapped all the prompts required within the Request Offering and published it to SharePoint Service Manager Portal.</span>

<span style="font-family:Calibri;">So, now it is onto the Computername Pattern, for the sake of my customer&#8217;s privacy, I will not use there exact naming pattern, but rather use XX-YY-Z type of naming, to give you the idea. Of course, Loving </span>[<span style="font-family:Calibri;">PowerShell</span>][1]<span style="font-family:Calibri;"> the way I do, I turned to old faithful.</span>

<span style="font-family:Calibri;">I will provide the basic PowerShell code in snippets and allow you to expand onto it as you see fit, I built in a fair amount of specific error checking for my customer which will NOT be included in this post.</span>

<span style="font-family:Calibri;">The </span>[<span style="font-family:Calibri;">Quest Commandlets</span>][2]<span style="font-family:Calibri;"> will be needed for these scripts. The code is being re-formatted due to the blog hoster. Please change the required values.<br /> </span>

[code language=&#8221;powershell&#8221;]  
#================================================================================  
#build computer name

$businessApplication = <"value"> #now from ORC as part of SR  
$function = <"value"> #now from ORC as part of SR  
$location = <"value"> #now from ORC as part of SR  
$affinity = <"value"> #now from ORC as part of SR  
$role = <"value"> #now from ORC as part of SR  
$businessUnit = <"value"> #now from ORC as part of SR

#naming convention  
#1 letter &#8211; BusinessUnit  
$businessUnit = $businessUnit.Substring(0,1)  
$businessApplication  
#3 letters &#8211; location  
$location = $location.Substring(0,3)  
$location

#placecholder (-)

#1 letter &#8211; role  
$role = $role.Substring(0,1)  
$role

#1 letter &#8211; Function  
$function = $function.Substring(0,1)  
$function

#tiebreaker (XXX)

#3 Letters &#8211; Business Application  
$businessApplication = $businessApplication.Substring(0,3)  
$businessApplication

#1 letter &#8211; Affinity  
$affinity = $affinity.Substring(0,1)  
$affinity

$computernamepattern = $businessUnit+$location+&quot;-&quot;+$role+$function+"XXX"+$businessApplication+$affinity  
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
$computername = $part1 + &quot;{0:D3}&quot; -f $i + $part3  
&quot;testing $computername&quot;  
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
$computerstobeCreated = &#8221;  
$computersRequested = "<Value\_from\_Orc>";

$computersCreated = 0  
$filepath = &#8216;C:\Tools\testing.txt&#8217;  
New-Item -Path $filepath -ItemType file

do  
{  
$newcomputer = $part1 + &quot;{0:D3}&quot; -f $partnumber + $part3  
#New-QADComputer -Name $newcomputer -ParentContainer &quot;OU=Test Computer Accounts,OU=System Accounts,DC=bui,DC=co,DC=za&quot;  
write-host $newcomputer  
write-host $computersCreated  
Add-Content -Path $filepath -Value $newcomputer  
$computersCreated++  
$partnumber++  
$computerstobeCreated = $computerstobeCreated + "" + $newcomputer  
}  
while ($computersCreated -le ($computersRequested-1))

$computerstobeCreated = $computerstobeCreated.Substring(1)

#======================================================================================= 

[/code]

<span style="font-family:Calibri;">I  check the nodes within the Cluster and then find the node with the least amount of Virtual Machines on it. Then use this node information for the creation of the VM. Now time for the free space, since this was a Cluster, I simply used the free space attribute within </span>[<span style="font-family:Calibri;">PowerShell</span>][1]<span style="font-family:Calibri;"> and </span>[<span style="font-family:Calibri;">Virtual Machine Commandlets</span>][3]<span style="font-family:Calibri;">. I get all the CSV information and then sort by the free space and select the first object as this one would have the most amount of free space.</span>

<span style="font-family:Calibri;">This is a basic capacity check as per the customer&#8217;s requirement, as part of this a field within Service Manager is updated to allow some more information to be shared within the members of the team working on this request.</span>

[code language=&#8221;powershell&#8221;]  
#==========================================================  
#Check for placement issues

$VMCluster = <"value">

$VMMServer = <"value">

$numberOfVMS = <"value">

$hostmachinedomain = (gwmi WIN32_ComputerSystem -ComputerName $VMMServer).Domain

$ClusterFQDN = $VMCluster +&quot;.&quot;+$hostmachinedomain

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
$placementInfo | Add-Member NoteProperty -name Placement -value &quot;False&quot;  
}  
}  
$colPlacementInfo += $placementInfo  
} 

If ($colPlacementInfo.placement -ccontains &quot;False&quot;)  
{$Proceed="No"}  
else  
{$Proceed="Yes"}

#=========================================================================

#capacity check

$VMCluster = "<value\_from\_orc>"

$VMMServer = "<value\_from\_orc>"

$numberOfVMS = "<value\_from\_orc>"

$hostmachinedomain = (gwmi WIN32_ComputerSystem -ComputerName $VMMServer).Domain

$ClusterFQDN = $VMCluster +&quot;.&quot;+$hostmachinedomain

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
$memoryAvailableClusterdisplay = $memoryAvailableCluster \*1024 \*1024 /1GB  
#$memoryAvailableCluster = ($memoryAvailableCluster) /1GB  
$memoryTotalClusterdisplay = $memoryTotalCluster \*1024 \*1024 /1GB  
#$memoryTotalCluster = ($memoryTotalCluster) /1GB

$VMTemplate = Get-SCVMTemplate -Name &#8216;<Name>&#8217;

$TemplateMemory = $vmtemplate.Memory * $numberOfVMS

$TemplateCPU = $vmtemplate.CPUCount * $numberOfVMS

#Memory Calculation

$memoryAvailbleAfterVm = $memoryAvailableCluster &#8211; $TemplateMemory  
$memoryAvailbleAfterVmdisplay = $memoryAvailbleAfterVm \*1024 \*1024 /1GB  
#$memoryAvailbleAfterVm = $memoryAvailbleAfterVm /1GB  
$memoryAvailbleAfterVm  
$memoryAvailbleAfterVmdisplay  
#$memoryAvailbleAfterVm = $memoryAvailbleAfterVm.tostring() + &quot;GB&quot; 

$Storage = (get-scvmhostcluster $VMCluster).SharedVolumes  
$StorageCapacity = ($Storage | Measure-Object -Property Capacity -Sum).sum  
$StorageFreeSpace = ($Storage | Measure-Object -Property FreeSpace -Sum).sum  
$StorageUsed = $StorageCapacity &#8211; $StorageFreeSpace

$VMVHDUsedSpace = $VMTemplate.TotalVHDCapacity *$numberOfVMS  
$freeSpaceAfterVMS = $StorageFreeSpace &#8211; $VMVHDUsedSpace

#=============================================  
[/code]

<span style="font-family:Calibri;">So, I have been using bits and pieces of Orchestrator to string these activities together. However the real power comes in now after using all the pieces from other steps to now, the ACTUAL Deployment. For the sake of simplicity, I am attaching a screenshot of the runbook. Please feel free to contact me (details below) should you want any additional information.</span>

<span style="font-family:Calibri;">Most of the PowerShell within the Runbook is as a result of unique constraints within this environment, and most cannot be shared. However, like I said, should you want specifics, feel free to contact me and will provide what I can.</span>

<span style="font-family:Calibri;">The runbook is attached as well, please use at your own discretion, PROVIDED AS IS. <a title="DeployVMRunbook" href="http://fskelly.files.wordpress.com/2014/07/deployvmrunbook.doc">DeployVMRunbook</a><br /> </span>

&nbsp;

<img title="2014-07-31_14-11-46" src="/wp-content/uploads/2014/07/2014-07-31_14-11-46.png" alt="2014-07-31_14-11-46" border="0" /> 

[(E-Mail me)][4]

<img title="BlogEmailIcon" src="/wp-content/uploads/2014/07/blogemailicon.png" alt="BlogEmailIcon" border="0" /> 

Follow me,

<img loading="lazy" src="/wp-content/uploads/2013/11/111913_0952_sendemailto5-1.jpg?w=55&h=55" alt="" width="55" height="55" /> [Twitter (Personal & System Centre)][5]

[<img loading="lazy" src="/wp-content/uploads/2013/11/111913_0952_sendemailto6-1.jpg?w=70&h=54" alt="" width="70" height="54" />][6] [Twitter (System Centre Focused)][6]

<div class="bjtags">
  Tags: <a href="http://technorati.com/tag/SCSM" rel="tag">SCSM</a>, <a href="http://technorati.com/tag/SCORCH" rel="tag">SCORCH</a>, <a href="http://technorati.com/tag/PowerShell" rel="tag">PowerShell</a>, <a href="http://technorati.com/tag/SSP" rel="tag">SSP</a>, <a href="http://technorati.com/tag/Self+Service" rel="tag">Self+Service</a>
</div>

 [1]: http://technet.microsoft.com/en-us/library/bb978526.aspx
 [2]: http://www.quest.com/powershell/activeroles-server.aspx
 [3]: http://technet.microsoft.com/en-us/library/hh801697.aspx
 [4]: mailto:systemcenterguyza@live.com
 [5]: https://twitter.com/fskelly
 [6]: https://twitter.com/syscenterguyza