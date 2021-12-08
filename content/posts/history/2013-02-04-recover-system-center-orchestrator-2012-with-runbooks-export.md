+++
type = "post"
author = "Fletcher Kelly"
title = "Recover System Center Orchestrator 2012 with runbooks export"
date = "2013-02-04T11:17:34+00:00"
tags = [
  "Runbook",
  "Recover"
]
categories = [
  "System Center Orchestrator",
  "System Center"
]
+++

<!-- CANBEPUBLISHED -->

Just recently in a test environment, a script or some such other gremlin caused some absolute havoc on my system. Before you ask, I had NO Backup in place of this system. This system was [System Center Orchestrator](https://docs.microsoft.com/en-us/previous-versions/system-center/system-center-2012-R2/hh237242(v=sc.12)?redirectedfrom=MSDN). However, once a week, I do a “sort-of” backup. By this, I mean I export all my Runbooks and place a copy on my local machine and a file server and the SCORCH (System Center ORCHestrator) server.

I was planning to perform an upgrade to System Center 2012 Service Pack 1, and as it happens according to the Upgrade Sequencing for System Center 2012 SP1, SCORCH was the first Product that needed to be updated.

So, at this moment in time, I had a non-functioning SCORCH server and a backup of the Runbooks from the server WITHOUT a proper backup. Luckily the use of SCORCH at this moment in time was mainly for timed tasks and Runbooks triggered by folder changes. 

So, I had to rebuild the server. These are the steps I followed and it worked out for me.

NB!!!! Please note that is NOT a replacement for a backup, having a proper backup plan is crucial to any environment. Once my SCORCH server was back up and running, I immediately implemented a proper backup procedure using Microsoft System Center Data Protection Manager in addition to the backup of Runbooks. I am currently working on a Runbook to backup my Runbooks, more to follow on that soon. To achieve this goal, I will be using an Orchestrator Codeplex runbook.

Anyways, back on topic. Lets "recover" System Center Orchestrator 2012.

1. Reset the computer account in Active Directory.

1. Re-join machine to domain using the same name.

1. Install SQL Server, I used a local instance for this.

1. Install System Center Orchestrator 2012 Service Pack 1. I decided to upgrade as well as part of the rebuild, previous version of Integration Packs are backwards compatible.

1. When installing, make sure to use the same port numbers and user accounts as previously used when installing (this should be documented as part of the original install)

1. Import Runbooks.
{{< figure src="/wp-content/uploads/2013/02/snaghtml377cebf_thumb.png" >}}

1. Once the Runbooks are imported. You will then need to check the Runbooks. You will need to re-register and re-deploy the integration packs.

1. Once all the Runbooks are registered and deployed, your environment will be backup and running. 

1. If you have a Connector within System Center Service Manager, you will need to check and ensure that the Run As account is working as expected.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)