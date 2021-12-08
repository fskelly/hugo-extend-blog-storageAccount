+++

title = "Service Request Load Testing for SCSM"
date = "2013-09-11T19:30:51+00:00"
tags = [
  "Load Testing",
  "Scripting",
  "PowerShell"
]
categories = [
  "SCSM",
]
type = "post"
author = "Fletcher Kelly"

+++

<!-- CANBEPUBLISHED -->

I have found a great for load testing [SCSM with Incidents](https://www.catapultsystems.com/blogs/powershell-script-to-load-test-scsm/) and copy [here](https://github.com/fskelly/hugo-extend-blog-storageAccount/blob/main/externalFiles/2013/09/11/SCSM_Load_Test.ps1). The script uses [SMLets](https://github.com/SMLets/SMLets) to generate Incidents and you can then gauge how your system would handle the load you are planning within your Production Environment.

I will not go into the detail of the script as this [blog post](https://www.catapultsystems.com/blogs/powershell-script-to-load-test-scsm/) does a great job of explaining it. So this got me to thinking about other Load Testing you could perform. The most common Load Test is with Incidents. However, i decided that another good load test would be Service Requests. What is nice about this load test, is that it uses a Management Pack which I have included in this post. The Management Pack contains a Service Request Template with a Manual Activity added as the first Activity. This will allow you to test Service Requests and well as Activities, which would in turn, test any workflows or runbooks that you have configured.

For my environment, I have additional runbooks which are also triggered when Manual Activities are completed or when Review Activities are completed. So with this Load Test script it also test my runbooks and other workflows.

Remember, to set a different Implementer for the Manual Activity to allow the runbooks or workflows to be triggered off correctly. Remember, no Manual Activity Implementer or if the implementer has no email address, your emails will not be triggered correctly. Below, is a breakdown of the script I am using.

Script  

```powershell
#SMLets is needed for the script to work  
Import-Module SMlets

#the number of Service requests to be created  
$SRCount = 10

#the delay between attempts  
$delay = 10

# Display Start Time  
$StartTime = get-date  
Write-Host "Started"  
Write-Host $StartTime  
Write-Host "---------`n"  
Write-Host "Creating Service Request"  
Write-Host "---------"  
$i =1

while ($i -le $SRCount)  
{

#Variable / Class Setup  
$srClass = Get-SCSMClass -name System.WorkItem.ServiceRequest$  
$srprior = Get-SCSMEnumeration -Name ServiceRequestPriorityEnum.Medium  
$srurg = Get-SCSMEnumeration -Name ServiceRequestUrgencyEnum.Medium  
$srarea = get-SCSMEnumeration -Name ServiceRequestAreaEnum.Other

#building your own SR Title  
$title = "Fletcher Load Testing $i - " + (get-date)

#Service Request Arguments  
$srargs = @{  
Title = $title;  
Urgency = $srurg;  
Priority = $srprior;  
ID = "SR{0}";  
Area = $srarea;  
Description = "Created by Script"  
}

#Create Service Request  
New-SCSMOBject -Class $srClass -PropertyHashtable $srargs

#Get Projection & Object for Created Service Request  
$srTypeProjection = Get-SCSMTypeProjection -name System.WorkItem.ServiceRequestProjection$  
$SRProj = Get-scsmobjectprojection -ProjectionName $srTypeProjection.Name -filter "title -eq $title"

#Get Template  
$template = Get-SCSMObjectTemplate -DisplayName "Load Test SR Template"

#Set Template  
Set-SCSMObjectTemplate -Projection $SRProj -Template $template  
$SR = Get-SCSMObject -Class (Get-SCSMClass -Name System.WorkItem.ServiceRequest$) -filter "Title -eq $title"  
$SRName = $SR.name  
$SRTitle = $SR.Title  
Write-Host $SRName " - " $SRTitle  
#$SRName

# Pause before creating next SR  
Start-Sleep -s 5

#getting the above created Service Request  
$ServiceRequestToUpdate = Get-SCSMObject -Class (Get-SCSMClass -Name System.WorkItem.ServiceRequest$) -Filter "Id -eq $SRName"

#get the Realted Child Manual Activity  
$ChildActivities = (Get-SCSMRelationshipObject -BySource $ServiceRequestToUpdate | ?{$_.RelationshipID -eq "2DA498BE-0485-B2B2-D520-6EBD1698E61B"})

$get the ID Value  
$MAIDToUpdate = $ChildActivities.targetobject.values[9].value

#getting the MA Class  
$Class = Get-SCSMClass -Name System.WorkItem.Activity.ManualActivity

#getting the "Active" Status  
$StatusActive = Get-SCSMEnumeration -name ActivityStatusEnum.Active

$Activity = Get-SCSMObject -Class $Class | ? {$_.ID -eq $MAIDToUpdate}

#setting MA to Active  
Set-SCSMObject -SMObject $Activity -Property "Status" -Value $StatusActive

#showing current status  
Write-host $MAIDToUpdate " is now " $StatusActive  
$i +=1  
Start-Sleep -s $delay  
}

# Display End Time  
Write-Host "----------`n"  
$EndTime = get-date  
Write-Host = "Finished"  
Write-Host $EndTime  
#End of Script  
#  
```

The script can also be downloaded from the ~~Technet Gallery~~, I am the authour, found [here](https://github.com/fskelly/hugo-extend-blog-storageAccount/blob/main/externalFiles/2013/09/11/SCSM_Load_Test-SR-v1.ps1) now.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
