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
Write-Host "-------------------`n"
Write-Host "Creating Service Request"
Write-Host "-------------------"
$i =1

while ($i -le $SRCount)
{

#Variable / Class Setup
$srClass = Get-SCSMClass -name System.WorkItem.ServiceRequest$
$srprior = Get-SCSMEnumeration -Name ServiceRequestPriorityEnum.Medium
$srurg = Get-SCSMEnumeration -Name ServiceRequestUrgencyEnum.Medium
$ararea = get-SCSMEnumeration -Name ServiceRequestAreaEnum.Other

#building your own SR Title
$title = "Fletcher Load Testing $i - " + (get-date)

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
Write-Host "_______________________`n"
$EndTime = get-date
Write-Host = "Finished"
Write-Host $EndTime
#End of Script
#