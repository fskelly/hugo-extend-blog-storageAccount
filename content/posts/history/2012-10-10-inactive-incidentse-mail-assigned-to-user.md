---
title: Inactive Incidents–E-mail assigned to User
author: fskelly
type: post
date: 2012-10-10T07:34:02+00:00
url: /2012/10/10/inactive-incidentse-mail-assigned-to-user/
categories:
  - PowerShell
  - System Center
tags:
  - Assigned to user
  - Assignedto
  - e-mail
  - notification
  - reminder
  - Service Manager
  - ServiceManager
  - workflow

---
<span style="font-family:Calibri;">Just recently I was looking for a way to notify users about Inactive incidents as I have some departments that tend to ignore their work items and an e-mail about their “untouched” incidents seems to motivate them. So after some searching I found <a href="http://gallery.technet.microsoft.com/SCSM-Mail-Notification-f0eafe10">this script</a> from <a href="http://social.technet.microsoft.com/profile/andreas%20baumgarten/">Andreas Baumgarten</a></span>

<span style="font-family:Calibri;">Please note : I only modified this script to extend its use to other Statuses to be monitored. All credit for the script goes entirely to <a href="http://social.technet.microsoft.com/profile/andreas%20baumgarten/">Andreas Baumgarten</a></span>

<span style="font-family:Calibri;">Code is below</span>

[sourcecode language=&#8221;powershell&#8221;]# Configure Last Modified Days Before  
$ModifiedBefore = 3

#Configure Incident Status  
$IncidentStatus = &#8216;Active&#8217;

# Configure your mail server, the recipient and the sender of the mail  
# $smtphost=”mailserver.yourdomain.local”  
# $from=”mail@yourdomain.local”

$smtphost=”Mailserver.demo.local”  
$from=”Helpdesk@demo.local”

# Send-Mail function  
function Send-Mail  
{  
Param($From,$To,$Subject,$Body)  
$smtp = new-object system.net.mail.smtpClient($smtphost)  
$mail = new-object System.Net.Mail.MailMessage  
$mail.from= $From  
$mail.to.add($To)  
$mail.subject= $Subject  
$mail.body= $Body  
$mail.isbodyhtml=$true  
$smtp.send($Mail)  
}

# Some other variables  
$BeforeDate = (Get-Date).AddDays(-$ModifiedBefore).ToString("MM/dd/yyy HH:mm:ss")  
$Status = Get-SCSMEnumeration IncidentStatusEnum.$IncidentStatus$  
$AssignedUserObjectRelClass = Get-SCSMRelationshipClass System.WorkItemAssignedToUser  
$IncidentClass = Get-SCSMClass -name System.WorkItem.Incident$

#Get all incidents last modfied xy days before  
$Incidents= @(Get-SCSMObject -Class $IncidentClass | Where {($\_.Status -eq $Status -AND $\_.LastModified -lt $BeforeDate)})

If ($Incidents.count -gt 0)  
{

#Get all assigned incidents from list  
foreach ($Incident in $Incidents)  
{  
# Get AssignedToUser  
$AssignedUser = Get-SCSMRelatedObject -SMObject $Incident -Relationship $AssignedUserObjectRelClass

# Incidents AssignedTo is not NULL  
If ($AssignedUser.Displayname -ne $NULL)  
{  
#Get email adress of AssignedToUser  
$EndPoint = Get-SCSMRelatedObject -SMObject $assignedUser -Relationship $UserPref|?{$_.ChannelName -like &#8216;*SMTP&#8217;}  
$Sendto = $Endpoint.Targetaddress

#Create Output  
$Output = &#8216;This Incident has been inactive for &#8216; + $ModifiedBefore + &#8216; day(s): <br>&#8217; + $Incident.ID + &#8216; &#8211; &#8216; + $Incident.Title + &#8216; &#8211; Last Modified: &#8216; + $Incident.Lastmodified  
$Output  
#Send email  
$To = $Sendto  
$Subject = &#8216;Inactive incident for &#8216; + $ModifiedBefore + &#8216; day(s): &#8216; + $Incident.Id + &#8216; &#8216; + $Incident.Title  
$Body = $Output  
Send-Mail $From $to $Subject $Body  
}  
}  
}

Remove-Module SMlets -force [/sourcecode]

<span style="font-family:Calibri;">Okay, so now that the code is there, I had to make some modifications in order for the Code to work with “NON-DEFAULT” Incident Statuses. I have created some additional Pending statuses.</span>

<span style="font-family:Calibri;">The key line in this code is</span>

[sourcecode language=&#8221;powershell&#8221;]Configure Incident Status  
$IncidentStatus = &#8216;Active'[/sourcecode]

<span style="font-family:Calibri;">and</span>

[sourcecode language=&#8221;powershell&#8221;]$Status = Get-SCSMEnumeration IncidentStatusEnum.$IncidentStatus$[/sourcecode]

<span style="font-family:Calibri;">This allows you specify the Status. However if you use additional “NON-DEFAULT” statuses, this would need to be modified to suit your needs. You would need to modify the line of code to read as follows.</span>

[sourcecode language=&#8221;powershell&#8221;]$IncidentStatus = &#8216;Enum.847741a452db4d529741005ea73aead8&#8242;[/sourcecode]

<span style="font-family:Calibri;">and </span>

[sourcecode language=&#8221;powershell&#8221;]$Status = Get-SCSMEnumeration $IncidentStatus$[/sourcecode]

<span style="font-family:Calibri;">You will notice the change of $IncidentStatus to a “ENUM” Value as this is a “NON-DEFAULT” value, you need to use the ENUM value. This can be gotten by using the following with SMLets</span>

[sourcecode language=&#8221;powershell&#8221;]Get-SCSMEnumeration | Format-list | out-file[/sourcecode]

<span style="font-family:Calibri;">Below, is a screenshot to help illustrate this further.</span>

[<img loading="lazy" style="border-width:0;padding-top:0;padding-right:0;padding-left:0;display:inline;background-image:none;" title="EnumSearch1" src="http://fskelly.files.wordpress.com/2012/10/enumsearch1_thumb1.jpg" alt="EnumSearch1" width="280" height="242" border="0" />][1]

<span style="font-family:Calibri;">Once you have a list of all your Enumerations, then search for the required value, for example “Pending &#8211; Waiting for 3rd Party”, you will then see a “Name” value and that whole string is your ENUM value.</span>

<span style="font-family:Calibri;">You will also see that the $Status line has been changed to cater for the ENUM value.</span>

<span style="font-family:Calibri;">Modify to meet your needs and create a workflow if you want to.</span>

<span style="font-family:Calibri;font-size:small;">Follow me.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" alt="facebook-small322252222" width="44" height="44" border="0" /></span>][2][<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" alt="twitter-small322252222" width="44" height="44" border="0" /></span>][3]

<span style="font-family:Calibri;font-size:small;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" alt="MCC11_Logo_Horizontal_2-color_thumb_" width="244" height="99" border="0" /></a></span>

 [1]: http://fskelly.files.wordpress.com/2012/10/enumsearch11.jpg
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly