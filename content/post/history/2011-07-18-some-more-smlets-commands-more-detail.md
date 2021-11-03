---
title: Some more SMlets commands (more detail)
author: fskelly
type: post
date: 2011-07-18T11:45:18+00:00
url: /2011/07/18/some-more-smlets-commands-more-detail/
categories:
  - PowerShell
tags:
  - script
  - SCSM
  - SMLets

---
Would you like a nice graphical breakdown of all calls logged in (x) days and there status?

I know I would. So, of course I have been working on such a script using smlets v3.

So far, this is what the script does.

  1. Takes the current date and time and subtracts 7 days and presents you with a nice HTML output which is mailed to the user. (Both the date and time and who to mail the output to is configurable.)
  2. Uses the same date and time as configured above and creates a breakdown of all calls/cases created after said time. Provides a breakdown of these calls in terms of open, closed, resolved and all other statuses.

I am currently working on a way to automate this more and provide a breakdown of calls per user for the above timeframe as well.

<span style="color:#000000;">Working with get-scsmincident and get-scsmclass is tricky and I am also looking for any ideas on how to achieve this. More to come as soon as possible.</span>

Anyways, code below.

<pre style="padding-left:30px;">Import-Module smlets

$startdate = $(Get-Date).AddDays(-7)

#buillding folder path
$dir = $env:userprofile
$date = ((Get-Date).toString('yyyMMdd'))
$filepath = $dir.tostring() + "\" +$date + "\"
New-Item -path $filepath -ItemType Directory -ErrorAction "SilentlyContinue"

#building html style
$htmlstyle = "&lt;style&gt;"
$htmlstyle = $htmlstyle + "BODY{background-color:Green;}"
$htmlstyle = $htmlstyle + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$htmlstyle = $htmlstyle + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:GreenYellow}"
$htmlstyle = $htmlstyle + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:palegoldenrod}"
$htmlstyle = $htmlstyle + "&lt;/style&gt;"

#specifying file to attach to e-mail later
$filename = $filepath + "allinc.html"

#building the file and contents of all calls and piping this out a html which will be later added to the e-mail
$createdincidentsfull = Get-SCSMIncident -CreatedAfter $startdate -ComputerName &lt;nameoripofservicemanagerserver&gt; |
Select-Object -Property AffectedUser, ID, Status, AssignedTo |
Sort-Object -Property Status |
ConvertTo-Html -Head $htmlstyle | Out-File $filename

#getting the information from Service Manager to supply a count of respective calls.
$createdincidents = Get-SCSMIncident -CreatedAfter $startdate -ComputerName &lt;nameoripofservicemanagerserver&gt;
$resolvedincidents = Get-SCSMIncident -CreatedAfter $startdate -ComputerName &lt;nameoripofservicemanagerserver&gt; -Status "Resolved"
$closedincidents = Get-SCSMIncident -CreatedAfter $startdate -ComputerName &lt;nameoripofservicemanagerserver&gt; -Status "Closed"
$countresolved = $resolvedincidents.count
$countclosed = $closedincidents.count
$countpending = $countcreated - $countresolved - $countclosed

#building message content
$line1 = "Number of calls created after" + " " + $startdate + " " + "is: " + $createdincidents.count
$line2 = "Number of calls resolved created after" + " " + $startdate + " " + "is:" + $resolvedincidents.count
$line3 = "Number of calls closed after" + " " +  $startdate + " " + "is:" + $closedincidents.count
$line4 = "Number of calls remaining open after" + " " + $startdate + " " + "is:" + $countpending

$messagecontent = @"
$line1 `r`n
$line2 `r`n
$line3 `r`n
$line4 `r`n
"@

$smtpserver = "enter IP address here"
$to = "enter recipient here"
$from = "enter sending e-mail here"
Send-MailMessage -To $to -From $from -Body $messagecontent -SmtpServer $smtpserver -Attachments $filename -Subject "Call breakdown"</pre>

File can be found [here][1]

Anyone who is interested in playing with get-scsmclass (incidents in particular).

The below might be interesting.

<pre class="csharpcode" style="padding-left:30px;">Get-SCSMObject -Computername <span class="str">"&lt;nameoripofservicemanagerserver&gt;"</span> –Class (Get-SCSMClass -ComputerName &lt;nameoripofservicemanagerserver&gt; -Name System.WorkItem.Incident$) | gm | Format-Table -AutoSize -Wrap |Out-File &lt;path&gt;</pre>

&nbsp;

Hope this helps,

Follow me

[<img loading="lazy" title="facebook-small32222" src="http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg" alt="facebook-small32222" width="44" height="44" border="0" />][2] [<img loading="lazy" title="twitter-small32222" src="http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg" alt="twitter-small32222" width="44" height="44" border="0" />][3]

 [1]: http://fskelly.files.wordpress.com/2011/07/callbreakdownwithemailwithsend-mailmessage1.docx
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly