+++
author = "Fletcher Kelly"
title = "Finding off site ready tapes for System Center Data Protection Manager with System Center Orchestrator"
date = "2013-10-20T12:30:19+00:00"
tags = [
  "DPM",
  "SCORCH",
  "PowerShell",
  "Scripting"
]
categories = [
  "PowerShell",
  "System Center"
]
type = "post"
+++

<!-- CANBEPUBLISHED -->

So, I am quite a keen user of [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.2) and [System Centre Orchestrator](https://docs.microsoft.com/en-us/system-center/orchestrator/learn-about-orchestrator?view=sc-orch-2019). Ok, so I recently had a request from a customer that went as follows “I need [DPM](https://docs.microsoft.com/en-us/system-center/dpm/dpm-overview) to alert me when tapes are ready to "be taken off-site".

DPM does not seen to have this functionality out of the box within the Graphical User Interface (GUI). All is NOT lost, [Data Protection Manager](https://docs.microsoft.com/en-us/system-center/dpm/dpm-overview) has a PowerShell component and I was sure I could figure out a way to get this to work within PowerShell. Sure enough a solution in the form of PowerShell was [found][4], so using this as a base, I modified the PowerShell script to suit my needs. It was also slightly modified to use with [System Centre Orchestrator](https://docs.microsoft.com/en-us/system-center/orchestrator/learn-about-orchestrator?view=sc-orch-2019). The custoemr also wanted some colour and wanted the result formatted in HTML. primarily for reading purposes and auditing purposes. PowerShell code below and link [here](https://github.com/fskelly/hugo-extend-blog-storageAccount/blob/main/externalFiles/2013/10/20/offsitetapesreadyv3.ps1).

```powershell
Import-Module DataProtectionManager  
$date = Get-Date -Format "M-d-yyyy"  
$path = "c:\DPMOffisteTapes\"  
$filepath = $path + $date + ".html"  
#creates the folder if it does not exist  
New-Item -itemType file -Path $filepath  
$AllLibraries = get-dpmlibrary  
$AllTapes = Get-Tape -DPMLibrary $AllLibraries  
$offistereadytape = $AllTapes | Where-Object {$_.isoffsiteready -eq $true}  
$a = ""  
$a = $a + "BODY{background-color:Green;}"  
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"  
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:GreenYellow}"  
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:palegoldenrod}"  
$a = $a + "</style>"  
$offistereadytape | Select-object location, barcode , isoffsiteready|ConvertTo-Html -Head $a -Body "<H2>Offsite Ready Tapes</H2>" | out-file -FilePath $filepath
```

OK, so now we have the data in decent format.

{{< figure src="/wp-content/uploads/2013/10/image_thumb.png" >}}

So, with the more tapes that are ready, the more rows of data will be within the HTML.

Ok, so now we need to schedule the task. I know I could have used Task Scheduler and the like, however we have [System Centre Orchestrator](https://docs.microsoft.com/en-us/system-center/orchestrator/learn-about-orchestrator?view=sc-orch-2019) and with [Service Management Automation](https://docs.microsoft.com/en-us/system-center/sma/overview-of-service-management-automation?view=sc-sma-2019#:~:text=Service%20Management%20Automation%20%28SMA%29%20is%20a%20set%20of,SMA%20runbooks%20run%20on%20the%20Windows%20PowerShell%20engine.) available, more and more tasks will be automated. With this example, i decided to use Orchestrator.

So, I simply use a Monitor/Date Time to run the required activity at set intervals

{{< figure src="/wp-content/uploads/2013/10/image_thumb1-1.png" >}}

I then run a DPM Script from the [Data Protection Manager Integration Pack](https://docs.microsoft.com/en-us/system-center/orchestrator/integration-pack-for-data-protection-manager?view=sc-orch-2019#:~:text=The%20integration%20pack%20for%20System%20Center%20-%20Data,pack%20to%20create%20runbooks%20that%20provide%20the%20following%3A).

{{< figure src="/wp-content/uploads/2013/10/image_thumb2.png" >}}

{{< figure src="/wp-content/uploads/2013/10/image_thumb3-1.png" >}}

The filepath Variable is where the html (the full path to the html file) is written, this is especially helpful when sending the Email Message. (I know this can be done with send-mailmessage directly within the PowerShell code)

{{< figure src="/wp-content/uploads/2013/10/image_thumb4-1.png" >}}

So there you have it, Some Orchestrator Magic with PowerShell and DPM.

Have fun automating.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
