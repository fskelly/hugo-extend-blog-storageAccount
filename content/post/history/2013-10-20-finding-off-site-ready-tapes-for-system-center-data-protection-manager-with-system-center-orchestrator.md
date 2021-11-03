---
title: Finding off site ready tapes for System Center Data Protection Manager with System Center Orchestrator
author: fskelly
type: post
date: 2013-10-20T12:30:19+00:00
url: /2013/10/20/finding-off-site-ready-tapes-for-system-center-data-protection-manager-with-system-center-orchestrator/
publicize_twitter_user:
  - fskelly
  - fskelly
publicize_twitter_url:
  - http://t.co/f9to2MgDRj
  - http://t.co/f9to2MgDRj
publicize_linkedin_url:
  - 'http://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=5797671001047191552&type=U&a=ZmGA'
  - 'http://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=5797671001047191552&type=U&a=ZmGA'
categories:
  - Uncategorized
tags:
  - DPM
  - powershell
  - SCORCH
  - script

---
So, I am quite a keen user of [PowerShell][1] and [System Centre Orchestrator][2]. Ok, so I recently had a request from a customer that went as follows “I need [DPM][3] to alert me when tapes are ready to&#160; be taken off-site.&#8221;

DPM does not seen to have this functionality out of the box within the Graphical User Interface (GUI). All is NOT lost, [Data Protection Manager][3] has a PowerShell component and i was sure i could figure out a way to get this to work within PowerShell. Sure enough a solution in the form of PowerShell was [found][4], so using this as a base, I modified the PowerShell script to suit my needs. It was also slightly modified to use with [System Centre Orchestrator][2]. The custoemr also wanted some colour and wanted the result formatted in HTML. primarily for reading purposes and auditing purposes. PowerShell code below and link [here][5].

[code language=&#8221;powershell&#8221;]Import-Module DataProtectionManager  
$date = Get-Date -Format "M-d-yyyy"  
$path = "c:\DPMOffisteTapes\"  
$filepath = $path + $date + ".html"  
#creates the folder if it does not exist  
New-Item -itemType file -Path $filepath  
$AllLibraries = get-dpmlibrary  
$AllTapes = Get-Tape -DPMLibrary $AllLibraries  
$offistereadytape = $AllTapes | Where-Object {$_.isoffsiteready -eq $true}  
$a = "<style>"  
$a = $a + "BODY{background-color:Green;}"  
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"  
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:GreenYellow}"  
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:palegoldenrod}"  
$a = $a + "</style>"  
$offistereadytape | Select-object location, barcode , isoffsiteready|ConvertTo-Html -Head $a -Body "<H2>Offsite Ready Tapes</H2>" | out-file -FilePath $filepath[/code]

OK, so now we have the data in decent format.

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/10/image_thumb.png" width="625" height="69" />][6]

So, with the more tapes that are ready, the more rows of data will be within the HTML.

Ok, so now we need to schedule the task. I know i could have used Task Scheduler and the like, however we have [System Centre Orchestrator][2] and with [Service Management Automation][7] available, more and more tasks will be automated. With this example, i decided to use Orchestrator.

So, I simply use a Monitor/Date Time to run the required activity at set intervals

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/10/image_thumb1-1.png" width="562" height="268" />][8]

I then run a DPM Script from the [Data Protection Manager Integration Pack][9].

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/10/image_thumb2.png" width="569" height="272" />][10]

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/10/image_thumb3-1.png" width="533" height="365" />][11]

The filepath Variable is where the html (the full path to the html file) is written, this is especially helpful when sending the Email Message. (I know this can be done with send-mailmessage directly within the PowerShell code)

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/10/image_thumb4-1.png" width="509" height="244" />][12]

So there you have it, Some Orchestrator Magic with PowerShell and DPM.

[(E-Mail me)][13]

![][14] 

Follow me.

![][15] Facebook (Personal)

![][16] Twitter (Personal & System Centre)

![][17] Twitter (System Centre Focused)

 [1]: http://technet.microsoft.com/en-us/library/bb978526.aspx
 [2]: http://www.google.co.za/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&cad=rja&ved=0CDUQFjAA&url=http%3A%2F%2Ftechnet.microsoft.com%2Fen-us%2Flibrary%2Fhh237242.aspx&ei=PMNjUuzfJoqPtQb0uICYAg&usg=AFQjCNHe_k_azRZpbqkjWNihkTAi7Sa8TA&sig2=gtvsjQw1WlO-1_z9DOaoWw
 [3]: http://www.google.co.za/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&cad=rja&ved=0CCoQFjAA&url=http%3A%2F%2Ftechnet.microsoft.com%2Fen-us%2Flibrary%2Fhh758173.aspx&ei=p8NjUsHrM-Gk0QWr5IDoDA&usg=AFQjCNHp7-kW7roL5xjnRh8RaTTo47J6DQ&sig2=79y8wIROrx6zRLRap0fgIQ
 [4]: http://risualblogs.com/blog/2010/04/09/dpm-powershell-script-to-show-offsite-ready-tapes/
 [5]: http://gallery.technet.microsoft.com/Which-tapes-are-ready-for-79f7e194
 [6]: /wp-content/uploads/2013/10/image-1.png
 [7]: http://blogs.technet.com/b/privatecloud/archive/2013/08/09/automation-an-introduction-to-service-management-automation.aspx
 [8]: /wp-content/uploads/2013/10/image1.png
 [9]: http://technet.microsoft.com/en-us/library/hh830726.aspx
 [10]: /wp-content/uploads/2013/10/image2.png
 [11]: /wp-content/uploads/2013/10/image3-1.png
 [12]: /wp-content/uploads/2013/10/image4-1.png
 [13]: mailto:systemcenterguyza@live.com
 [14]: /wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png?w=497
 [15]: http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg?w=44&h=44
 [16]: http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg?w=44&h=44
 [17]: /wp-content/uploads/2013/02/scsmlogo25232.jpg?w=56&h=43