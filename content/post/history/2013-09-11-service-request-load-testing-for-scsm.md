---
title: Service Request Load Testing for SCSM
author: fskelly
type: post
date: 2013-09-11T19:30:51+00:00
url: /2013/09/11/service-request-load-testing-for-scsm/
publicize_twitter_user:
  - fskelly
categories:
  - Service Manager
  - System Center
tags:
  - load testing
  - powershell
  - script
  - SCSM
  - SCSM 2012
  - workflow

---
I have found a great for load testing [SCSM with Incidents][1]. The script uses [SMLets][2] to generate Incidents and you can then gauge how your system would handle the load you are planning within your Production Environment.

I will not go into the detail of the script as this [blog post][1] does a great job of explaining it. SO this got me to thinking about other Load Testing you could perform. The most common Load Test is with Incidents. However, i decided that another good load test would be Service Requests. What is nice about this load test, is that it uses a Management Pack which I have included in this post. The Management Pack contains a Service Request Template with a Manual Activity added as the first Activity. This will allow you to test Service Requests and well as Activities, which would in turn, test any workflows or runbooks that you have configured.

For my environment, i have additional runbooks which are also triggered when Manual Activities are completed or when Review Activities are completed. So with this Load Test script it also test my runbooks and other workflows.

Remember, to set a different Implementer for the Manual Activity to allow the runbooks or workflows to be triggered off correctly. Remember, no Manual Activity Implementer or if the implementer has no email address, your emails will not be triggered correctly. Below, is a breakdown of the script I am using.

Script  
[code language=&#8221;powershell&#8221;]  
#SMLets is needed for the script to work  
Import-Module SMlets

#the number of Service requests to be created  
$SRCount = 10

#the delay between attempts  
$delay = 10

\# Display Start Time  
$StartTime = get-date  
Write-Host "Started"  
Write-Host $StartTime  
Write-Host "&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;-\`n"  
Write-Host "Creating Service Request"  
Write-Host "&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;-"  
$i =1

while ($i -le $SRCount)  
{

#Variable / Class Setup  
$srClass = Get-SCSMClass -name System.WorkItem.ServiceRequest$  
$srprior = Get-SCSMEnumeration -Name ServiceRequestPriorityEnum.Medium  
$srurg = Get-SCSMEnumeration -Name ServiceRequestUrgencyEnum.Medium  
$ararea = get-SCSMEnumeration -Name ServiceRequestAreaEnum.Other

#building your own SR Title  
$title = "Fletcher Load Testing $i &#8211; " + (get-date)

#Service Request Arguements  
$srargs = @{  
Title = $title;  
Urgency = $srurg;  
Priority = $srprior;  
ID = “SR{0}”;  
Area = $ararea;  
Description = “Created by Script”  
}

#Create Service Request  
New-SCSMOBject -Class $srClass -PropertyHashtable $srargs

#Get Projection & Object for Created Service Request  
$srTypeProjection = Get-SCSMTypeProjection -name System.WorkItem.ServiceRequestProjection$  
$SRProj = Get-scsmobjectprojection -ProjectionName $srTypeProjection.Name -filter “title -eq $title”

#Get Template  
$template = Get-SCSMObjectTemplate -DisplayName "Load Test SR Template"

#Set Template  
Set-SCSMObjectTemplate -Projection $SRProj -Template $template  
$SR = Get-SCSMObject -Class (Get-SCSMClass -Name System.WorkItem.ServiceRequest$) -filter "Title -eq $title"  
$SRName = $SR.name  
$SRTitle = $SR.Title  
Write-Host $SRName " &#8211; " $SRTitle  
#$SRName

\# Pause before creating next SR  
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

\# Display End Time  
Write-Host "\___\___\___\___\___\___\_____\`n"  
$EndTime = get-date  
Write-Host = "Finished"  
Write-Host $EndTime  
#End of Script  
#  
[/code]  
The script can also be downloaded from the Technet Gallery [here.][3]

[(E-Mail me)][4]

![][5] 

Follow me.

![][6] Facebook (Personal)

![][7] Twitter (Personal & System Centre)

![][8] Twitter (System Centre Focused)

![][9]

 [1]: http://blogs.catapultsystems.com/mdowst/archive/2013/07/10/powershell-script-to-load-test-scsm.aspx
 [2]: http://smlets.codeplex.com/
 [3]: http://gallery.technet.microsoft.com/Service-Manager-Service-42a964e6
 [4]: mailto:systemcenterguyza@live.com
 [5]: /wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png?w=497
 [6]: http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg?w=44&h=44
 [7]: http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg?w=44&h=44
 [8]: /wp-content/uploads/2013/02/scsmlogo25232.jpg?w=56&h=43
 [9]: http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg?w=244&h=99