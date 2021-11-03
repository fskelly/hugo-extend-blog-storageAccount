---
title: End User Portal for System Centre Orchestrator
author: fskelly
type: post
date: 2013-08-05T04:53:43+00:00
url: /2013/08/05/end-user-portal-for-system-centre-orchestrator/
publicize_twitter_user:
  - fskelly
categories:
  - Self Service Portal
  - System Center
tags:
  - End User Portal
  - EUP
  - EUPSCO
  - Orchestrator
  - SCO
  - SCORCH
  - System Centre

---
So, let’s ay you have invested the time and gotten [System Centre Orchestrator][1] up and running in your environment and you have the product performing some day to day tasks and it is working well. However, now you want start using SCO (System Centre Orchestrator) to start performing end user focused tasks like Password Reset, add users to groups or even disabling of users or server testing as part of first line support.

All of these tasks can be completed within orchestrator, however exposing them to the end user can be a little tricky. It can be done, the “native way” of performing this within the System Centre Suite is to use [System Centre Service Manager][2] with the [Service Manager Orchestrator Connector][3] and then prompt the user for information and kick off runbooks. This particular scenario works well if you have [System Centre Service Manager][2] in place, and a future blog post will cover the idea of “adding a user to an Active Directory group” as part of a Service Request. There are a few challenges around this. Firstly, you need SCSM (System Centre Service Manager) and some time and patience to test the connectors and runbooks and to create the correct templates and ensure that [Workflows][4] with SCSM are configured correctly within SCSM. Like I have said previously, this solution works and it works well!!!

In reality though, not everyone has SCSM in place, many of my companies customers are in the progress of migrating to SCSM and these systems are still in testing or QA or UAT, whatever the case may be, they are NOT in production YET! However, these companies still want this the functionality listed above. Yes, there is a way!!!

Enter [EUPSCO][5], the full name is End User Portal System Centre Orchestrator, and as the name suggests it creates an End User Portal for System Centre Orchestrator. This allows the IT Department to create the required runbooks, to for example, ping a server or reset a password or disable an account. This creates the “Menu”, called “Services” within the End User portal. Once this is completed, the end user can then order from this menu and get the required results without the need of having to contact the IT Department. This particular tool is very easy to install and the [guide][6] is easy to follow. The End User portal requires NO Silverlight and as such, it is compatible with most browsers. I have personally tested with the IE, Chrome, Safari and Firefox, all working without issue.

The application also reads from Active Directory, this helps with your reporting line allowing a Manager of staff members (Determined by “Manager” in Active Directory) to log requests on the behalf of his/her staff members, so now +a manager can log a request to reset the password of his/her staff member. The application also allows for approvals. So each service can have an approver, the service allows for a runbook to be triggered if an Approver’s input is needed, with mine, I simply kick off a runbook, which sends an email to the approver with a link to the End User Portal and his/her requests allowing him/her to approve or deny the request.

There are a few key variables which are passed onto the runbook to allow the automation to be easier. The [How To&#8217;s][7] on the EUPSCO page cover these nicely. This [Forum Post][8] also covers these options. Just to make it a little easier, the primary ones are as follow. (please note that these are case sensitive)

1. TargetUserId

2. ApproverUserId

3. ServiceName

This should help your organization adopt System Centre Orchestrator more easily.

A BIG thank you goes out to the People at ITQ for the [System Centre Orchestrator End User Portal][9]

[(E-Mail me)][10]

![][11] 

<span style="font-size:small;font-family:calibri;">Follow me.</span>

![][12] Facebook (Personal)

![][13] Twitter (Personal & System Centre)

![][14] Twitter (System Centre Focused)

<span style="font-size:small;font-family:calibri;"><img alt="" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg?w=244&h=99" /></span>

 [1]: http://technet.microsoft.com/en-us/library/hh237242.aspx
 [2]: http://technet.microsoft.com/en-us/library/hh305220.aspx
 [3]: http://technet.microsoft.com/en-us/library/hh519779.aspx
 [4]: http://technet.microsoft.com/en-us/library/hh495667.aspx
 [5]: http://www.eupsco.nl/
 [6]: http://forum.eupsco.com/yaf_postst32_Installation.aspx
 [7]: http://forum.eupsco.com/yaf_topics7_How-to-s.aspx
 [8]: http://forum.eupsco.com/yaf_postsm239_Runbooks-types-in-services.aspx#post239
 [9]: http://www.eupsco.com/
 [10]: mailto:systemcenterguyza@live.com
 [11]: /wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png
 [12]: http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg?w=44&h=44
 [13]: http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg?w=44&h=44
 [14]: /wp-content/uploads/2013/02/scsmlogo25232.jpg?w=56&h=43