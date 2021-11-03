---
title: How do I “learn” System Center Service Manager 2012?
author: fskelly
type: post
date: 2012-12-14T13:38:54+00:00
url: /2012/12/14/how-do-i-learn-system-center-service-manager-2012/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - Uncategorized
tags:
  - Operations Guide
  - SCSM
  - SCSM 2012
  - Service Manager
  - Teach
  - Tools

---
<font face="Calibri">So, I recently made a very simple comment on Facebook. This lead to some interesting comment and questions being raised about Service Manager about “Training for Service Desk&#8221; staff” in particular. At this moment in time, there is no “Service Desk Staff” training that I am aware of. So I decided to try and address this as best I could.</font>

<font face="Calibri">I have decided to consolidate some of the more important components and concepts of Service Manager and place them in one spot. I will be looking at all facets of Service Manager and trying to give ideas and concepts aimed at Administrators, Analysts and End-Users and provide some tools that I think are invaluable to modifying and making Service Manager more focused around your business. </font>

<font face="Calibri">For a complete glossary of terms used in Service Manager, click </font>[<font face="Calibri">here</font>][1]

**<font face="Calibri">Training</font>**

<font face="Calibri">For Service Desk Staff, I would start with the </font>[<font face="Calibri">Operations Guide</font>][2]<font face="Calibri">, this contains all aspects of Incident, Problem, Change and Service Requests as well as some other aspects including reporting which should be used by an Analyst. Here are some nice </font>[<font face="Calibri">videos</font>][3]

**<font face="Calibri">Tweaking for your business</font>**

<font face="Calibri">So now, onto the more “nitty-gritty” of making Service Manger yours and making it suit your business and understanding the concepts of Service Manager. I would highly recommend the </font>[<font face="Calibri">Microsoft Virtual Academy</font>][4] <font face="Calibri">for all studying requirements. This </font>[<font face="Calibri">System Center 2012: Orchestrator & Service Manager</font>][5] <font face="Calibri">course is aimed specifically at Service Manager, however this </font>[<font face="Calibri">Introduction to Systems Management & Service Delivery</font>][6] <font face="Calibri">would also be worth a look.</font>

<font face="Calibri">Now that we should be a little more comfortable with the concepts of Service Manager, the single best resource for Service Manager that I can think of, and it is run by Microsoft Staff is the </font>[<font face="Calibri">System Center: Service Manager Engineering Blog</font>][7]<font face="Calibri">. You will notice that a lot of the entries I reference will be from the blog above. I have listed these below.</font>

[<font face="Calibri">System Center 2012 &#8211; Service Manager 101: Focus on Incident Management</font>][8] <font face="Calibri">– Very nice blog post</font>

[<font face="Calibri">Implementing Sample Helpdesk Scenario in Incident Management – 1</font>][9]

[<font face="Calibri">Implementing Sample Helpdesk Scenario in Incident Management – 2</font>][10]

[<font face="Calibri">Routing Incidents Submitted by Email</font>][11]

**<font face="Calibri">Configuration Items</font>**

<font face="Calibri">Another really nice and often overlooked component of Service Manager is the CMDB, which allows all your Configuration Items to be stored in a Central Location. There are also a lot of built-in connectors which allow Service Manager to “talk”/gather information from a lot of Microsoft sources. These are listed below.</font>

[<font face="Calibri">Connectors to Import Data</font>][12] <font face="Calibri">– includes </font>

> [<font face="Calibri">Active Directory</font>][13] <font face="Calibri">– Used to create your users within your Domains as Configuration Items, used primarily for “Affected User” and “Assigned To” users</font>

> [<font face="Calibri">Configuration Manager</font>][14] <font face="Calibri">– Used to import configuration Items from SCCM relating to Computers and Software Inventory and other data you have configured within your SCCM environment </font>
> 
> [<font face="Calibri">Operations Manager</font>][15] <font face="Calibri">&#8211; this has two connectors.&nbsp; 1 for Configuration Items and 1 for Alerts.</font>
> 
> <font face="Calibri">&nbsp;</font>[<font face="Calibri">Orchestrator</font>][16] <font face="Calibri">– Used to connect to the Runbook Service to allow for Runbooks to be referenced within Service Manager for the automation of tasks.</font>
> 
> [<font face="Calibri">Virtual Machine Manager</font>][17] <font face="Calibri">– Used to import Configuration Items from Virtual Machine Manager including Virtual Machine information including Service Templates, Location, host nodes and the like….</font>
> 
> [<font face="Calibri">CSV File</font>][18] <font face="Calibri">– Can be used to import information from a CSV file and creating Configuration Items.</font>

<font face="Calibri">Some links below about creating Custom CI’s</font>

[<font face="Calibri">Creating Custom Configuration Item Classes Using the Service Manager Authoring Tool</font>][19]

[<font face="Calibri">Creating custom classes in System Center Service Manager 2010</font>][20]

[<font face="Calibri">How to create a new CI class and a new form</font>][21]

[<font face="Calibri">Creating a New Configuration Item Class in System Center Service Manager – YouTube</font>][22]

**<font face="Calibri">Tools and “Essential” Management Packs</font>**

<font face="Calibri">So, now I move onto a section very dear to my heart. This is where you can modify the Console and/or workflows to meet your requirements. I will suggest some “add-on’s” that I use in all environments, whether they are Customer Facing, Internal or Test/Lab environments. I will supply a link to the Management Pack/Tool/Workflow and a short description of what they do and why I insist on using them and some potential “gotchas”</font>

<font face="Calibri">Lots of additional tools and/or management packs can be found on </font>[<font face="Calibri">Technet Gallery</font>][23]<font face="Calibri">, I have narrowed down the link to be </font>[<font face="Calibri">Service Manager specific</font>][24]

[<font face="Calibri">Cireson Auto Close App</font>][25] <font face="Calibri">– This is a great which allows for the easy closing of Work Items. I have blogged about this </font>[<font face="Calibri">previously</font>][26]<font face="Calibri">.</font>

[<font face="Calibri">Advanced View Editor</font>][27] <font face="Calibri">– great for modifying views within Service Manager, also allows you to edit XML for Management Packs (specifically “criteria”) on the fly. Also allows you to change the generic Display for Affected User and Assigned To user to a more descriptive value. More of his tools can be found </font>[<font face="Calibri">here</font>][28]<font face="Calibri">. Follow him on twitter </font>[<font face="Calibri">here</font>][29]<font face="Calibri">.</font>

[<font face="Calibri">Notification workflow on Work Item assignments</font>][30] <font face="Calibri">– This is great to automate the notification of the assigned to User with Incidents and Changes, this is great. I have also modified this to work with </font>[<font face="Calibri">Service Requests</font>][31] <font face="Calibri">and I have uploaded it to </font>[<font face="Calibri">Technet Gallery</font>][32]<font face="Calibri">.</font>

[<font face="Calibri">Notify Analyst When End User updates Incident</font>][33] <font face="Calibri">– This is actually a subscription that is setup. It can also be easily modified to work the other way round and notify the End User when the Analyst updates the incidents.</font>

[<font face="Calibri">Mail Notification: Remind Reviewers</font>][34] <font face="Calibri">– This is particularly helpful when it comes to Change Management, as a lot of Review Activities can be sent out and most times the e-mails are ignored. So this Management Pack automates this task of sending out reminders. </font>[<font face="Calibri">AndersAsp</font>][35] <font face="Calibri">blog can be found </font>[<font face="Calibri">here</font>][36] <font face="Calibri"></font>

[<font face="Calibri">Exchange Connector</font>][37] <font face="Calibri">– This is a great for Analysts to use to update calls and use your Exchange Environment to your advantage for updating work items, I have blogged about this </font>[<font face="Calibri">previously</font>][38]<font face="Calibri">. <strong>Please note: Any comment added via the Exchange Connector is treated as an “Analyst Comment”and marks the comment as &#8220;Private”. Please keep this is mind for workflows.</strong></font>

<font face="Calibri">Another great source of information is the </font>[<font face="Calibri">System Center &#8211; Service Manager &#8211; Technet Forums</font>][39]

<font face="Calibri">I have also setup an new e-mail address to help with Service Manger queries. you can e-mail me at <strong>systemcenterguyza ”at” live ”dot” com</strong>&nbsp; (</font>[<font face="Calibri">systemcenterguyza@live.com</font>][40]<font face="Calibri">) and I will assist as much as I can.</font>

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2012/12/image_thumb16.png" width="184" height="32" />][41]

<font size="2" face="Calibri">Follow me.</font>

[<font size="2" face="Calibri"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></font>][42] <font size="2" face="Calibri"></font>[<font size="2" face="Calibri"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></font>][43]

<font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></font></p>

 [1]: http://technet.microsoft.com/en-us/library/hh750212.aspx
 [2]: http://technet.microsoft.com/en-us/library/hh519673.aspx
 [3]: http://blogs.technet.com/b/servicemanager/archive/2010/01/13/system-center-service-manager-demos.aspx
 [4]: http://www.microsoftvirtualacademy.com/Home.aspx
 [5]: http://www.microsoftvirtualacademy.com/tracks/system-center-2012-orchestrator-service-manager
 [6]: http://www.microsoftvirtualacademy.com/tracks/introduction-to-systems-management-service-delivery
 [7]: http://blogs.technet.com/b/servicemanager/
 [8]: http://blogs.technet.com/b/antoni/archive/2012/08/13/service-manager-101-part-1-incident-management.aspx
 [9]: http://blogs.technet.com/b/servicemanager/archive/2009/11/02/implementing-sample-helpdesk-scenario-in-incident-management-1.aspx
 [10]: http://blogs.technet.com/b/servicemanager/archive/2009/11/02/implementing-sample-helpdesk-scenario-in-incident-management-2.aspx
 [11]: http://blogs.technet.com/b/servicemanager/archive/2010/05/05/routing-incidents-submitted-by-email.aspx
 [12]: http://technet.microsoft.com/en-us/library/hh524326.aspx
 [13]: http://technet.microsoft.com/en-us/library/hh519809.aspx
 [14]: http://technet.microsoft.com/en-us/library/hh519733.aspx
 [15]: http://technet.microsoft.com/en-us/library/hh524270.aspx
 [16]: http://technet.microsoft.com/en-us/library/hh495619.aspx
 [17]: http://technet.microsoft.com/en-us/library/hh519785.aspx
 [18]: http://technet.microsoft.com/en-us/library/hh519814.aspx
 [19]: http://blogs.technet.com/b/servicemanager/archive/2010/09/29/creating-custom-configuration-item-classes-using-the-service-manager-authoring-tool.aspx
 [20]: http://blurbsonit.wordpress.com/2010/08/11/creating-custom-classes-in-system-center-service-manager-2010/
 [21]: http://contoso.se/blog/?p=1707
 [22]: http://www.youtube.com/watch?v=QRWRKL6zA5k
 [23]: http://gallery.technet.microsoft.com/
 [24]: http://gallery.technet.microsoft.com/site/search?f%5B0%5D.Type=RootCategory&f%5B0%5D.Value=SystemCenter&f%5B0%5D.Text=System%20Center&f%5B1%5D.Type=SubCategory&f%5B1%5D.Value=ServiceMgrManagementPacks&f%5B1%5D.Text=Service%20Manager
 [25]: http://www.cireson.com/app-store/scsm-auto-close/
 [26]: http://fskelly.wordpress.com/2012/11/01/auto-closing-work-items-made-easyservice-manager-2012/
 [27]: http://gallery.technet.microsoft.com/Advanced-View-Editor-20-377353f5
 [28]: http://www.scsmsolutions.com/
 [29]: https://twitter.com/intent/user?screen_name=scsmru
 [30]: http://www.bctechnet.com/custom-notification-workflow-on-work-item-assignment/
 [31]: http://fskelly.wordpress.com/2012/07/09/service-requests-re-assignment-notification/
 [32]: http://gallery.technet.microsoft.com/Service-Request-Re-8fbe31a1
 [33]: http://scsm2012.blogspot.com/2012/07/notify-assigned-to-user-when-end-user.html
 [34]: http://gallery.technet.microsoft.com/Mail-notification-Remind-1167b6c5
 [35]: http://social.technet.microsoft.com/profile/andersasp/?ws=usercard-mini
 [36]: http://www.scsm.se/
 [37]: http://www.microsoft.com/en-us/download/details.aspx?id=29423
 [38]: http://fskelly.wordpress.com/2012/09/19/exchange-connector-scsm-2012/
 [39]: http://social.technet.microsoft.com/Forums/en-us/category/servicemanager
 [40]: mailto:systemcenterguyza@live.com
 [41]: /wp-content/uploads/2012/12/image16.png
 [42]: http://www.facebook.com/fletcher.kelly
 [43]: http://twitter.com/#!/fskelly