---
title: SLA Reporting with PowerShell and SCSM
author: fskelly
type: post
date: 2015-08-27T06:21:12+00:00
url: /2015/08/27/sla-reporting-with-powershell-and-scsm/
geo_public:
  - 0
  - 0
publicize_linkedin_url:
  - 'https://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=6042556989958090752&type=U&a=ywDC'
  - 'https://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=6042556989958090752&type=U&a=ywDC'
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - PowerShell
  - Service Manager
  - System Center

---
I always get asked about reporting from my customers, and specifically around SLA&#8217;s. SLA&#8217;s are very important to most companies as this is part of the tracking mechanism of employees and vendors and the like.

SMLETS is needed for this, [<span style="color:blue;text-decoration:underline;">SMLets</span>][1], it is built to be run from the server, if you need to run from your local machine, please install SMLets, copy the SDK Binaries folder and use the -computername where applicable with the SMLets commands.

I have customers that are &#8220;multi-sourced&#8221; and the vendors are also using the System Centre Service Manager (SCSM) environment. As such, the request came from my customer to create an easily readable and &#8220;exportable&#8221; SLA report. The requirements were as follow.

  1. All Incidents, Service Request, Change Requests and Problem Requests
  2. Assigned To Information
  3. Created By Information
  4. ID
  5. Impact
  6. Urgency
  7. Priority
  8. Classification / Area
  9. Created Date
 10. Resolved (yes / no), if yes, provide the resolution detail
 11. Last Modified Date
 12. <div>
      Last but not least SLA Information (if there was an SLO / SLA assigned)
    </div>
    
      1. SLA Name
      2. SLA Status
      3. Target End Date

As you can see the list is extensive, yes I know I could have built an SSRS Report, however my SQL skills are not the best and I LOVE PowerShell. So, I decided to do the following with PowerShell and with the use of [<span style="color:blue;text-decoration:underline;">SMLets</span>][1] I decided to build this report purely in PowerShell and write the content to an HTML file and then make the content of the HTML file the body of the email.

The full code can be found [here][2], I will highlight the main components / challenges, please feel free to use/abuse my code. Please note that this code is used at your own risk as always. <span style="background-color:yellow;">PLEASE TEST!!!</span>

The customer wanted to get the file as an attachment and as the body of email, for this I used a switch statement based on the &#8220;WorkItemType&#8221;, I then changed the class for the get-scsmobject criteria based upon the workitemtype. Once all the information was gathered, I joined all the files to create a <sup>final </sup>file containing all the information, all I can say here, is that you are going to spend a fair amount of time looking at HTML code (or at least I did), I highly recommend both [BlueGriffon][3] and [NotePad++][4] to assist with this. To get the SLA information, I used the &#8220;System.WorkItemHasSLAInstanceInformation$&#8221; class to get the SLA information with another switch to cater for an item that has no SLA. I also looked at the history to retrieve the &#8220;Last Modified Date&#8221;.

To get all the information I needed into a manageable format, I used a custom PowerShell Object and added all the information into the object. From an object the data can be easily manipulated into the required format. Basically I write the information from each object out into individual files to meet the customer&#8217;s needs and then combine these HTML files (hence spending a lot of time ensuring all my HTML Tags were properly closed) into one &#8220;complete HTML file as well.

For the emailing of the information, you need to specify the &#8220;TO&#8221;, the rest I gather from the system itself, as we know the relay that the server is using can send messages and the &#8220;From&#8221; address will be correct.

Follow me,

![][5] [Twitter (Personal & System Centre)][6]

[<img src="/wp-content/uploads/2015/08/082715_0638_slareportin2.jpg" alt="" border="0" />][7][Twitter (System Centre Focused)][7]

 [1]: http://smlets.codeplex.com/ "SMLets"
 [2]: https://gallery.technet.microsoft.com/SLA-Report-with-PowerShell-4b43aa4a
 [3]: http://bluegriffon.org/
 [4]: https://notepad-plus-plus.org/
 [5]: /wp-content/uploads/2015/08/082715_0638_slareportin1.jpg
 [6]: https://twitter.com/fskelly
 [7]: https://twitter.com/syscenterguyza