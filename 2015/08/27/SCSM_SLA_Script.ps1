Function writeHtmlHeader 
{ 
param($fileName) 
#$date = ( get-date ).ToString('yyyy/MM/dd') 
Add-Content $fileName "<html>" 
Add-Content $fileName "<head>" 
Add-Content $fileName "<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>" 
Add-Content $fileName '<title>SLA Report</title>' 
add-content $fileName '<STYLE TYPE="text/css">' 
add-content $fileName  "<!--" 
Add-Content $fileName ".centerImg{ display:block; background:#E8E8E8; margin:auto; }"
add-content $fileName  "td {" 
add-content $fileName  "font-family: Tahoma;" 
add-content $fileName  "font-size: 11px;" 
add-content $fileName  "border-top: 1px solid #999999;" 
add-content $fileName  "border-right: 1px solid #999999;" 
add-content $fileName  "border-bottom: 1px solid #999999;" 
add-content $fileName  "border-left: 1px solid #999999;" 
add-content $fileName  "padding-top: 0px;" 
add-content $fileName  "padding-right: 0px;" 
add-content $fileName  "padding-bottom: 0px;" 
add-content $fileName  "padding-left: 0px;" 
add-content $fileName  "}" 
add-content $fileName  "body {" 
add-content $fileName  "margin-left: 5px;" 
add-content $fileName  "margin-top: 5px;" 
add-content $fileName  "margin-right: 0px;" 
add-content $fileName  "margin-bottom: 10px;" 
add-content $fileName  "" 
add-content $fileName  "table {" 
add-content $fileName  "border: thin solid #000000;" 
add-content $fileName  "}" 
add-content $fileName  "-->" 
add-content $fileName  "</style>" 
Add-Content $fileName "</head>" 
Add-Content $fileName "<body>" 
Add-Content $filename "<div>"
#Add-Content $fileName "<img class=""centerImg"
#add-content $filename "style=""width:163px; height:74px;"" src=""bui.jpg"""
#add-content $filename "border=""0"" alt=""BUI Logo"" /></a>"
#add-content $filename "<img src=""bui.jpg"" alt=""BUI Logo"" align=""middle"">" 
 
add-content $fileName  "<table width='100%'>" 
add-content $fileName  "<tr bgcolor='#CCCCCC'>" 
add-content $fileName  "<td colspan='7' height='25' align='center'>" 
add-content $fileName  "<font face='tahoma' color='#003399' size='4'><strong>SLA Report as of $date</strong></font>" 
add-content $fileName  "</td>" 
add-content $fileName  "</tr>" 
add-content $fileName  "</table>" 

}
 
Function writeHtmlFooter 
{ 
param($fileName) 

Add-Content $fileName "</body>" 
Add-Content $fileName "</html>" 
} 

Function writeTableHeader 
{ 
param($fileName)
add-content $fileName "<table width='100%'>" 
Add-Content $fileName "<tr bgcolor=#CCCCCC>" 
Add-Content $fileName "<td>WorkItem Number</td>" 
Add-Content $fileName "<td>Workitem Title</td>"
Add-Content $fileName "<td>Status</td>"
Add-Content $fileName "<td>Area/Category/Group</td>"
Add-Content $fileName "<td>Assigned To</td>"
Add-Content $fileName "<td>Created Date</td>"
Add-Content $fileName "<td>Last Modified Date Date</td>"
Add-Content $fileName "<td>SLA Information</td>"
Add-Content $fileName "<td>SLA Status</td>"
Add-Content $fileName "</tr>" 
} 

Function writeTableFooter
{ 
param($fileName) 
Add-Content $fileName "</tr>"
Add-Content $fileName "</table>"
} 

Function writeScriptInfo 
{ 
param($fileName,$executedby) 
add-content $fileName  "<font face='tahoma' color='#003399' size='2'>Script run by $executedby</font>" 
} 

Function writeWorkItemInfo 
{ 
    param($fileName,$IncidentID,$IncidentDescription,$Status,$SupportGroup,$AssignedTo,$CreatedDate,$LastModifiedDate,$SLAInformation,$SLAStatus) 
    Add-Content $fileName "<tr>" 
    Add-Content $fileName "<td>$IncidentID</td>" 
    Add-Content $fileName "<td>$IncidentDescription </td>"
    Add-Content $fileName "<td>$Status</td>"
    Add-Content $fileName "<td>$SupportGroup</td>"
    Add-Content $fileName "<td>$AssignedTo</td>"
    Add-Content $fileName "<td>$CreatedDate</td>"
    Add-Content $fileName "<td>$LastModifiedDate</td>"
    Add-Content $fileName "<td>$SLAInformation</td>"
    switch ($SLAInformation) 
    { 
        deafult {Add-Content $fileName "<td bgcolor=""#00FF00"">$SLAInformation</td>"} 
        "" {Add-Content $fileName "<td bgcolor=""#669999"">NO SLA</td>"} 
    }
    switch ($SLAStatus) 
    { 
        "Breached" {Add-Content $fileName "<td bgcolor=""#FF0000"">$SLAStatus</td>"} 
        "Met" {Add-Content $fileName "<td bgcolor=""#00FF00"">$SLAStatus</td>"}
        "Active" {Add-Content $fileName "<td bgcolor=""#00BFFF"">$SLAStatus</td>"}
        "" {Add-Content $fileName "<td bgcolor=""#669999"">$SLAStatus</td>"} 
    }
} 

Function getWorkItemInfo
{
    param($WorkItemType) 
    #build File Name
    switch ($WorkItemType)
    {
        IR 
            {
                $workItemTypeABBR = "IR"
                $CId = (Get-SCSMEnumeration IncidentStatusEnum.Closed$).id
                $RId = (Get-SCSMEnumeration IncidentStatusEnum.Resolved$).id
                $ClassName = "System.WorkItem.Incident$"
                #$ACG = $WI.TierQueue.DisplayName
            }
        SR 
            {
                $workItemTypeABBR = "SR"
                $CId = (Get-SCSMEnumeration ServiceRequestStatusEnum.Closed$).id
                $RId = (Get-SCSMEnumeration ServiceRequestStatusEnum.Completed$).id
                $ClassName  = "System.WorkItem.ServiceRequest$"
                #$ACG  = $WI.SupportGroup.DisplayName
            }
        CR 
            {
                $workItemTypeABBR = "CR"
                $CId = (Get-SCSMEnumeration ChangeStatusEnum.Closed$).id
                $RId = (Get-SCSMEnumeration ChangeStatusEnum.Completed$).id
                $ClassName = "System.WorkItem.ChangeRequest$"
                #$ACG  = $WI.Area.DisplayName
            }
        PR 
            {
                $workItemTypeABBR = "PR"
                $CId = (Get-SCSMEnumeration ProblemStatusEnum.Closed$).id
                $RId = (Get-SCSMEnumeration ProblemStatusEnum.Resolved$).id
                $ClassName = "System.WorkItem.Problem$"
                #$ACG  = $WI.Classification.DisplayName
            }
    }

    $workItemfileName = "$folderpath\SLAReport-$workItemTypeABBR-v2-complete-$date.html"
    add-content $workItemfileName "<table width='100%'>"
    add-content $workItemfileName "<tr bgcolor='#CCCCCC'>"
    add-content $workItemfileName "<td colspan='7' height='25' align='center'>"
    add-content $workItemfileName "<font face='tahoma' color='#003399' size='2'><strong>$workItemType as of $date</strong></font>"
    add-content $workItemfileName "</tr>"
    add-content $workItemfileName "</table>"  
    writeTableHeader $workItemfileName

    $Class = Get-SCSMClass -Name $ClassName
    $cType = "Microsoft.EnterpriseManagement.Common.EnterpriseManagementObjectCriteria"
    $cString = "Status = '$RId'"
    $crit = new-object $cType $cString,$Class

    $workItems = Get-SCSMObject -criteria $crit

    $EscalatedWorkItems = $workItems | Where-Object {$_.Status.Displayname -ne "Cancelled" -and $_.status.DisplayName -ne "Failed"}

    $workItemInfo = @()
    foreach ($Workitem in $EscalatedWorkItems)
    {
        $id = $Workitem.id
        $WI = Get-SCSMObject -Class (Get-SCSMClass -Name $ClassName) -Filter "Name = $id"
        $rel = Get-SCSMRelationshipClass -Name "System.WorkItemHasSLAInstanceInformation$"
        $SLA = Get-SCSMRelatedObject -SMObject $WI -Relationship $rel | Where-Object {$_.iscancelled -eq $false}

        $AssignedToRel = get-scsmrelationshipclass -name System.WorkItemAssignedToUser$ 
        $AssignedToUser = Get-SCSMRelatedObject -SMObject $WI -Relationship $AssignedToRel
        $AssignedToUserDisplayName = $AssignedToUser.DisplayName
        $Status = $WI.Status.DisplayName
        switch ($WorkItemType)
        {
            IR {$ACG = $WI.TierQueue.DisplayName}
            SR {$ACG = $WI.SupportGroup.DisplayName}
            CR {$ACG = $WI.Area.DisplayName}
            PR {$ACG = $WI.Classification.DisplayName}
        }
        $CreatedDate = $WI.CreatedDate
        $FormattedCreateddDate = ($CreatedDate).ToString('dd/MM/yyyy HH:mm:ss')

        $history = Get-SCSMObjectHistory -object $WI
        $lastModified = ($history.History | select -Last 1).lastmodified

        $i=1
        $SLA = Get-SCSMRelatedObject -SMObject $WI -Relationship $rel | Where-Object {$_.iscancelled -eq $false}

        $allworkItemInfo = New-Object system.object
        $allworkItemInfo | Add-Member NoteProperty -name ID -value $ID
        $allworkItemInfo | Add-Member NoteProperty -name Description -value $WI.Title
        $allworkItemInfo | Add-Member NoteProperty -name Status -value $Status
        $allworkItemInfo | Add-Member NoteProperty -name AreaCAtGroup -value $ACG
        $allworkItemInfo | Add-Member NoteProperty -name CreatedDate -value $FormattedCreateddDate
        $allworkItemInfo | Add-Member NoteProperty -name AssignedTo -value $AssignedToUserDisplayName
        $allworkItemInfo | Add-Member NoteProperty -name LastModified -value $lastModified

        foreach ($SLAObject in $SLA)
        { 
            $SLATarget = $SLA.targetenddate
            $SLAEndDate = ($SLATarget).ToString('dd/MM/yyyy HH:mm:ss')
            $SLAStatus = $SLA.Status.DisplayName
            $SLADisplayName = $SLA.Displayname
            $allworkItemInfo | Add-Member NoteProperty -name "SLAInformation" -value "$SLADisplayName ($SLAEndDate)"
            $allworkItemInfo | Add-Member NoteProperty -name "SLAStatus" -value "$SLAStatus"
            $i++
        }
        $workItemInfo += $allworkItemInfo
    }
    foreach ($wi in $workItemInfo)
    { 
        writeWorkItemInfo $workItemfileName $wi.ID $wi.Description $wi.Status $wi.AreaCAtGroup $wi.AssignedTo $wi.CreatedDate $wi.LastModified $wi.SLAInformation $wi.SLAStatus
    }
    writeTableFooter $workItemfileName
    $WIbody = Get-Content $workItemfileName  | Out-String
    $body = $body + $WIbody
}

$to = "<youremailaddresshere>"
$channel = Get-SCSMChannel
$smtpServer = $channel.ConfigurationSources.server
$from = $channel.ReturnAddress


$date = ( Get-Date ).ToString('dd.MM.yyyy')
$folderpath = "C:\Temp\Reports\$date"
new-item -ItemType Directory -Path $folderpath

$executedby = [environment]::UserDomainName + "\" + [environment]::UserName

Import-Module 'C:\Program Files\Common Files\SMLets\SMLets.psd1'
$Now = (get-date)
$DateString = $Now.toString()

getWorkItemInfo IR
getWorkItemInfo SR
getWorkItemInfo CR
getWorkItemInfo PR

cd $folderpath

$files = gci | Where-Object {$_.name -notlike "*Failed*"} | Select-Object -Property Name
foreach ($file in $files)
{
    $content = Get-Content $file.name | out-string
    $body = $body + $content
}

$completeHTMLFILE = $folderpath+"\completedResolved.html"

writeHtmlHeader $completeHTMLFILE
$body | Add-Content $completeHTMLFILE
writeScriptInfo $completeHTMLFILE $executedby
writeHtmlFooter $completeHTMLFILE

$htmlbody = Get-Content $completeHTMLFILE| out-string
cd $folderpath
Get-ChildItem | Send-MailMessage -From $from -To $to -Subject "Open Work Items $date" -SmtpServer $smtpServer -Body $htmlbody -BodyAsHtml
