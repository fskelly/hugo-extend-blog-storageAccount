---
title: Recover System Center Orchestrator 2012 with runbooks export
author: fskelly
type: post
date: 2013-02-04T11:17:34+00:00
url: /2013/02/04/recover-system-center-orchestrator-2012-with-runbooks-export/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - System Center
tags:
  - Orchestrator
  - recover
  - Runbook
  - SCORCH
  - System Centre

---
Just recently in a test environment, a script or some such other gremlin caused some absolute havoc on my system. Before you ask, I had NO Backup in place of this system. This system was [System Center Orchestrator][1]. However, once a week, I do a “sort-of” backup. By this, I mean I export all my Runbooks and place a copy on my local machine and a file server and the SCORCH (System Center ORCHestrator) server.

I was planning to perform an upgrade to System Center 2012 Service Pack 1, and as it happens according to the [Upgrade Sequencing for System Center 2012 SP1][2], SCORCH was the first Product that needed to be updated.

So, at this moment in time, I had a non-functioning SCORCH server and a backup of the Runbooks from the server WITHOUT a proper backup. Luckily the use of SCORCH at this moment in time was mainly for timed tasks and Runbooks triggered by folder changes. 

So, I had to rebuild the server. These are the steps I followed and it worked out for me.

NB!!!! Please note that is NOT a replacement for a backup, having a proper backup plan is crucial to any environment. Once my SCORCH server was back up and running, I immediately implemented a proper backup procedure using [Microsoft System Center Data Protection Manager][3] in addition to the backup of Runbooks. I am currently working on a Runbook to backup my Runbooks, more to follow on that soon. To achieve this goal, I will be using an [Orchestrator Codeplex runbook][4].

Anyways, back on topic. Lets “recover” System Center Orchestrator 2012.

1. Reset the computer account in Active Directory.

2. Re-join machine to domain using the same name.

3. Install SQL Server, I used a local instance for this.

4. Install System Center Orchestrator 2012 [Service Pack 1][5]. I decided to upgrade as well as part of the rebuild, previous version of Integration Packs are backwards compatible.

5. When installing, make sure to use the same port numbers and user accounts as previously used when installing (this should be documented as part of the original install)

6. Import Runbooks.

[<img loading="lazy" title="SNAGHTML377cebf" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="SNAGHTML377cebf" src="http://fskelly.files.wordpress.com/2013/02/snaghtml377cebf_thumb.png" width="512" height="271" />][6]

7. Once the Runbooks are imported. You will then need to check the Runbooks. You will need to [re-register and re-deploy][7] the integration packs.

8. Once all the Runbooks are registered and deployed, your environment will be backup and running. 

9. If you have a Connector within [System Center Service Manager][8], you will need to check and ensure that the Run As account is working as expected.

[(E-Mail me)][9]

[<img loading="lazy" title="image_thumb_thumb_thumb_thumb" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image_thumb_thumb_thumb_thumb" src="http://fskelly.files.wordpress.com/2013/02/image_thumb_thumb_thumb_thumb_thumb.png" width="184" height="32" />][10]

<span style="font-size:small;font-family:calibri;">Follow me.</span>

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></span>][11] Facebook (Personal)

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></span>][12]Twitter (Personal & System Center)

[<img loading="lazy" title="scsmlogo2523" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="scsmlogo2523" src="http://fskelly.files.wordpress.com/2013/02/scsmlogo2523.jpg" width="56" height="43" />][13] Twitter (System Center Focused)

<span style="font-size:small;font-family:calibri;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></span>

 [1]: http://technet.microsoft.com/en-us/library/hh237242.aspx
 [2]: http://technet.microsoft.com/en-us/library/jj628203.aspx
 [3]: http://technet.microsoft.com/en-us/library/hh758173.aspx
 [4]: http://scorch.codeplex.com/releases/view/92311
 [5]: http://blogs.msdn.com/b/mhpta/archive/2013/01/18/sc.aspx
 [6]: http://fskelly.files.wordpress.com/2013/02/snaghtml377cebf.png
 [7]: http://technet.microsoft.com/en-us/library/hh420346.aspx
 [8]: http://technet.microsoft.com/en-us/systemcenter/hh315836.aspx
 [9]: mailto:systemcenterguyza@live.com
 [10]: http://fskelly.files.wordpress.com/2013/02/image_thumb_thumb_thumb_thumb.png
 [11]: http://www.facebook.com/fletcher.kelly
 [12]: http://twitter.com/#!/fskelly
 [13]: http://twitter.com/syscenterguyza