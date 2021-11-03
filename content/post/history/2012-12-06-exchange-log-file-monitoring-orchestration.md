---
title: Exchange Log File Monitoring Orchestration
author: fskelly
type: post
date: 2012-12-06T11:41:28+00:00
url: /2012/12/06/exchange-log-file-monitoring-orchestration/
categories:
  - Uncategorized
tags:
  - Exchange
  - IIS
  - Logs
  - Orchestration
  - Orchestrator
  - SCORCH

---
<span style="font-family:Calibri;">So what started this is actually quite simple. We have limited space on our virtual machines and the log files for IIS keeping filling up the drive on our Hub Transport Server (Exchange Server 2010). It is a little know fact, that a certain amount of free space on C: is needed on an Exchange Hub Transport Server, the magic number happens to be 15%. There are a few ways to solve the log file issue. I found this </span>[<span style="font-family:Calibri;">solution</span>][1]<span style="font-family:Calibri;">. This deletes all files older than 7 days. This can, of course, be modified to suit your needs, I personally have chosen 14 days. Some people choose more, it is basically a case of whatever works best for.</span>

<span style="font-family:Calibri;">I could simple set this a scheduled task and allow this to run every few days and keep the log files to a reasonable size. However, I have orchestrator and was thinking that this would be a great chance to get my hands dirty and start to show the benefit of Orchestrator to some of the staff in our IT department. I know those that know Orchestrator, are saying “you have to convince them how good Orchestrator is?” and the answer is a resounding “YES”. Anyways, back onto topic here. Below is a diagram of the orchestration. I will go into more detail around my thinking for each step. Hopefully someone can learn from this and help drive the value of System Centre Orchestrator <img class="wlEmoticon wlEmoticon-smile" style="border-style:none;" alt="Smile" src="/wp-content/uploads/2012/12/wlemoticon-smile.png" /></span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb.png" width="569" height="266" /></span>][2]

<span style="font-family:Calibri;">So, the first bit is simply a monitor allowing you specify how often you would like the Runbook to Run.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb1.png" width="69" height="72" /></span>][3]

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb2.png" width="374" height="258" /></span>][4]

<span style="font-family:Calibri;">Next up, is a simple “Disk Space” monitor found under “Monitoring”</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb3.png" width="95" height="76" /></span>][5]

<span style="font-family:Calibri;">I have configured the parameters as needed.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb4.png" width="364" height="252" /></span>][6]

<span style="font-family:Calibri;">I also tweaked the security parameters as needed to an account that has the required rights for checking Drive Space on the required server.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb5.png" width="365" height="254" /></span>][7]

<span style="font-family:Calibri;">For the next step, I modified the “Link Properties” to match my needs of checking of the Disk Space to return a value that will allow the rest of the Runbook to run. It is simply a case of Clicking “Add” and then selecting the required values to check for. I chose “Percentage of Space Available” from Component Before “is less than” Desired percentage.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb6.png" width="361" height="383" /></span>][8]

<span style="font-family:Calibri;">This is why I chose to create a runbook, my staff and Company like to be informed of any changes made on servers. So now I send an e-mail stating that the free space is low to the necessary recipients.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb7.png" width="90" height="76" /></span>][9]

<span style="font-family:Calibri;">Now, I create a folder to allow for creation of text files for the logging of which files will be deleted. (more on this later)</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb8.png" width="101" height="74" /></span>][10]

<span style="font-family:Calibri;">I also use published data from earlier in the Databus to create unique folders based on date and time.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb9.png" width="369" height="253" /></span>][11]

<span style="font-family:Calibri;">Now, I create a list of all the files to be deleted and read them into a “log file” and place them in the folder created above for “Auditing” purposes. I had to run this through a PowerShell script and there are some limitations with Orchestrator and Impersonating another account within PowerShell. I will continue to work on this to clean it up.</span>

<span style="font-family:Calibri;">Please note that *subscribeddata* means data from earlier up the Databus, namely folder locations.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb10.png" width="76" height="96" /></span>][12]

<span style="font-family:Calibri;">I run the below PowerShell script.</span>

<span style="font-family:Calibri;">This reads the files to be deleted, older than 14 days, creates a log file, and reads the log file into the body of the e-mail.</span>

[sourcecode language=&#8221;powershell&#8221;]net use H: \*subsribeddata\* /user:europcar\administrator <password>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $files=get-childitem -Path \\ms-ec-exc01\C$\inetpub\logs\LogFiles -recurse | where-object {$_.lastwritetime -lt (get-date).addDays(-14)}| out-file -filepath "H:\logs.txt" -append<br>$body = (get-content \*subscribeddata>\*logs.txt -encoding ASCII | out-string)<br>send-mailmessage -attachments <subscribed data>\logs.txt -body $body -to "fletcher.kelly@europcar.co.za" -from "orchestrator@europcar.co.za" -subject "Files to be deleted" -smtpserver 172.21.195.69<br>net use h: /delete[/sourcecode]

<span style="font-family:Calibri;">Now it is time to delete the actual files</span>

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb11.png" width="81" height="85" />][13]

[sourcecode language=&#8221;powershell&#8221;]net use H: \*subsribeddata\* /user:europcar\administrator \*password\*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $files=get-childitem -Path \\ms-ec-exc01\C$\inetpub\logs\LogFiles -recurse | where-object {$_.lastwritetime -lt (get-date).addDays(-14)}| remove-item –recurse<br>net use h: /delete[/sourcecode]

<span style="font-family:Calibri;">Now it is time to check the Disk Space is at an adequate level.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb12.png" width="125" height="125" /></span>][14]

<span style="font-family:Calibri;">Modify the link Properties again to meet new requirements. So, I have tweaked the script to ensure that the free space is now above my threshold ( I have set mine to 15%)</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb13.png" width="244" height="77" /></span>][15]

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb14.png" width="443" height="302" /></span>][16]

<span style="font-family:Calibri;">And then finally send an e-mail stating that the free space is now adequate. Tweaked to meet my needs with Subscribed data in the body and subject.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb15.png" width="118" height="136" /></span>][17]

<span style="font-family:Calibri;">Please note that this information is provided as is. I can assist as much as possible. Please TEST, TEST and TEST again.</span>

<span style="font-family:Calibri;">Hope this helps,</span>

<span style="font-family:Calibri;font-size:small;">Follow me.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="facebook-small322252222" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" border="0" /></span>][18][<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="twitter-small322252222" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" border="0" /></span>][19]

<span style="font-family:Calibri;font-size:small;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" border="0" /></a></span>

 [1]: http://support.risualblogs.com/blog/2011/02/17/delete-iis-logs-after-certain-number-of-days-via-powershell/
 [2]: /wp-content/uploads/2012/12/image.png
 [3]: /wp-content/uploads/2012/12/image1.png
 [4]: /wp-content/uploads/2012/12/image2.png
 [5]: /wp-content/uploads/2012/12/image3.png
 [6]: /wp-content/uploads/2012/12/image4.png
 [7]: /wp-content/uploads/2012/12/image5.png
 [8]: /wp-content/uploads/2012/12/image6.png
 [9]: /wp-content/uploads/2012/12/image7.png
 [10]: /wp-content/uploads/2012/12/image8.png
 [11]: /wp-content/uploads/2012/12/image9.png
 [12]: /wp-content/uploads/2012/12/image10.png
 [13]: /wp-content/uploads/2012/12/image11.png
 [14]: /wp-content/uploads/2012/12/image12.png
 [15]: /wp-content/uploads/2012/12/image13.png
 [16]: /wp-content/uploads/2012/12/image14.png
 [17]: /wp-content/uploads/2012/12/image15.png
 [18]: http://www.facebook.com/fletcher.kelly
 [19]: http://twitter.com/#!/fskelly