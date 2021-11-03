+++
authors = [
    "Fletcher Kelly",
]
title = "SLA Reporting with PowerShell and SCSM"
date = "2015-08-27T06:21:12+00:00"
tags = [
  "SLA",
  "SMLets",
  "PowerShell",
]
categories = [
  "Service Manager",
  "PowerShell",
  "System Center"
]
+++

<!-- CANBEPUBLISHED -->

I always get asked about reporting from my customers, and specifically around SLA's. SLA's are very important to most companies as this is part of the tracking mechanism of employees and vendors and the like.

[SMLETS](https://github.com/SMLets/SMLets/releases) is needed for this, it is built to be run from the server, if you need to run from your local machine, please install SMLets, copy the SDK Binaries folder and use the -computername where applicable with the SMLets commands.

I have customers that are "multi-sourced" and the vendors are also using the System Centre Service Manager (SCSM) environment. As such, the request came from my customer to create an easily readable and "exportable" SLA report. The requirements were as follow.

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
  12. Last but not least SLA Information (if there was an SLO / SLA assigned)
      1. SLA Name
      2. SLA Status
      3. Target End Date

As you can see the list is extensive, yes I know I could have built an SSRS Report, however my SQL skills are not the best and I LOVE PowerShell. So, I decided to do the following with PowerShell and with the use of [SMLets](https://github.com/SMLets/SMLets/releases) I decided to build this report purely in PowerShell and write the content to an HTML file and then make the content of the HTML file the body of the email.

The full code can be found [here](https://github.com/fskelly/hugo-extend-blog-storageAccount/blob/main/externalFiles/2015/08/27/SCSM_SLA_Script.ps1), I will highlight the main components / challenges, please feel free to use/abuse my code. Please note that this code is used at your own risk as always. **PLEASE TEST!!!**

The customer wanted to get the file as an attachment and as the body of email, for this I used a switch statement based on the "WorkItemType", I then changed the class for the get-scsmobject criteria based upon the workitemtype. Once all the information was gathered, I joined all the files to create a **final** file containing all the information, all I can say here, is that you are going to spend a fair amount of time looking at HTML code (or at least I did), I highly recommend both [BlueGriffon](http://bluegriffon.org/) and [NotePad++](https://notepad-plus-plus.org/) to assist with this. To get the SLA information, I used the $System.WorkItemHasSLAInstanceInformation$ class to get the SLA information with another switch to cater for an item that has no SLA. I also looked at the history to retrieve the $LastModifiedDate$.

To get all the information I needed into a manageable format, I used a custom PowerShell Object and added all the information into the object. From an object the data can be easily manipulated into the required format. Basically I write the information from each object out into individual files to meet the customer's needs and then combine these HTML files (hence spending a lot of time ensuring all my HTML Tags were properly closed) into one **complete** HTML file as well.

For the emailing of the information, you need to specify the "TO", the rest I gather from the system itself, as we know the relay that the server is using can send messages and the "FROM" address will be correct.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
