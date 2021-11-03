---
title: Installing System Centre Orchestrator
author: fskelly
type: post
date: 2012-06-13T12:44:38+00:00
url: /2012/06/13/installing-system-centre-orchestrator/
categories:
  - System Center
tags:
  - Installation
  - Orchestrator
  - Runbook
  - SCORCH
  - Service
  - System Centre

---
<font face="Calibri">So, just recently I decided to install System Centre Orchestrator. It appears easy enough if you follow the </font>[<font face="Calibri">Technet</font>][1] <font face="Calibri">articles. This addresses the need for Service Accounts and the permissions needed by these accounts and there functions. It also helps you to size and decide the Orchestrator installation type that would best suit your environment. It helps you to decide the best way to break the components if you want to.</font>

<font face="Calibri">However, the one thing that I found to be lacking was the actual components needed by SCORCH, like the Features and Roles. I followed the default </font>[<font face="Calibri">Technet</font>][1] <font face="Calibri">articles and setup the required accounts and then proceeded with the installation of SCORCH, one of the easiest installs. However, one component would not install, the Orchestrator Console and this was somewhat annoying and would not do. I did some searching around and found quite a handy PowerShell script which was used by someone else who ran into a similar issue. This script enables a few components and once this was done, the SCORCH installation completed without issue. See the script below.</font>

`<font face="Calibri">Add-WindowsFeature Web-Static-Content,Web-Default-Doc,Web-Dir-Browsing,Web-Http-Errors,Web-Http-Logging,Web-Request-Monitor,Web-Filtering,Web-Stat-Compression,RDC, NET-Framework, NET-Framework</font>`

`<font face="Calibri">This worked a treat, so now I was one step closer to Orchestration. So, I designed a few simple Runbooks for testing purposes. I then kicked off the required Service Requests within Service Manager and would then try to track the progress of the Runbook, only to discover that the Runbooks were not running at all. It was NOT a permissions issue or an access issue. After much troubleshooting, I discovered it was something very simple. The services were not started, mine did not appear to start automatically when installing SCORCH.</font>`

`<font face="Calibri">Just a simple post to make someone else’s life a little easier when installing SCORCH.</font>`

<font size="2" face="Calibri">Follow me.</font> 

[<font size="2" face="Calibri"><img loading="lazy" title="facebook-small32225222" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;margin:0;border-left:0;display:inline;padding-right:0;" border="0" alt="facebook-small32225222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small32225222.jpg" width="44" height="44" /></font>][2] <font size="2" face="Calibri"></font>[<font size="2" face="Calibri"><img loading="lazy" title="twitter-small32225222" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;margin:0;border-left:0;display:inline;padding-right:0;" border="0" alt="twitter-small32225222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small32225222.jpg" width="44" height="44" /></font>][3]

<font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_2.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_[2]" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_[2]" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_2_thumb.jpg" width="244" height="99" /></a></font></p>

 [1]: http://technet.microsoft.com/en-us/library/hh237242.aspx
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly