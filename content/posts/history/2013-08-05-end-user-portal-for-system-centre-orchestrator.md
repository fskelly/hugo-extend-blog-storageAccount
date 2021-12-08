+++
type = "post"
author = "Fletcher Kelly"
title = "End User Portal for System Centre Orchestrator"
date = "2013-08-05T04:53:43+00:00"
tags = [
  "ITAM",
  "Cireson"
]
categories = [
  "Service Manager",
  "Service Manager Portal",
  "EUPSCO",
  "Orchestrator"
]
+++

<!-- CANBEPUBLISHED -->

So, let’s ay you have invested the time and gotten [System Centre Orchestrator](https://docs.microsoft.com/en-us/system-center/orchestrator/learn-about-orchestrator?view=sc-orch-2019) up and running in your environment and you have the product performing some day to day tasks and it is working well. However, now you want start using SCO (System Centre Orchestrator) to start performing end user focused tasks like Password Reset, add users to groups or even disabling of users or server testing as part of first line support.

All of these tasks can be completed within orchestrator, however exposing them to the end user can be a little tricky. It can be done, the “native way” of performing this within the System Centre Suite is to use [System Centre Service Manager](https://docs.microsoft.com/en-us/system-center/scsm/service-manager?view=sc-sm-2019) with the Service Manager Orchestrator Connector and then prompt the user for information and kick off runbooks. This particular scenario works well if you have [System Centre Service Manager](https://docs.microsoft.com/en-us/system-center/scsm/service-manager?view=sc-sm-2019) in place, and a future blog post will cover the idea of “adding a user to an Active Directory group” as part of a Service Request. There are a few challenges around this. Firstly, you need SCSM (System Centre Service Manager) and some time and patience to test the connectors and runbooks and to create the correct templates and ensure that [Workflows](https://docs.microsoft.com/en-us/previous-versions/system-center/system-center-2012-R2/hh495667(v=sc.12)?redirectedfrom=MSDN) with SCSM are configured correctly within SCSM. Like I have said previously, this solution works and it works well!!!

In reality though, not everyone has SCSM in place, many of my companies customers are in the progress of migrating to SCSM and these systems are still in testing or QA or UAT, whatever the case may be, they are NOT in production YET! However, these companies still want this the functionality listed above. Yes, there is a way!!!

Enter [EUPSCO](https://au2mator.com/orchestrator/), the full name is End User Portal System Centre Orchestrator, and as the name suggests it creates an End User Portal for System Centre Orchestrator. This allows the IT Department to create the required runbooks, to for example, ping a server or reset a password or disable an account. This creates the “Menu”, called “Services” within the End User portal. Once this is completed, the end user can then order from this menu and get the required results without the need of having to contact the IT Department. This particular tool is very easy to install and the guide **(NOT AVAILABLE anymore - reach ou to them directly)** is easy to follow. The End User portal requires NO SilverLight and as such, it is compatible with most browsers. I have personally tested with the IE, Chrome, Safari and Firefox, all working without issue.

The application also reads from Active Directory, this helps with your reporting line allowing a Manager of staff members (Determined by “Manager” in Active Directory) to log requests on the behalf of his/her staff members, so now +a manager can log a request to reset the password of his/her staff member. The application also allows for approvals. So each service can have an approver, the service allows for a runbook to be triggered if an Approver’s input is needed, with mine, I simply kick off a runbook, which sends an email to the approver with a link to the End User Portal and his/her requests allowing him/her to approve or deny the request.

This should help your organization adopt System Centre Orchestrator more easily.  

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)