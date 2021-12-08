---
title: Auto-Closing work items made easy–Service Manager 2012
author: fskelly
type: post
date: 2012-11-01T05:41:13+00:00
url: /2012/11/01/auto-closing-work-items-made-easyservice-manager-2012/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - Service Manager
tags:
  - auto close
  - completed
  - resolved
  - SCSM
  - SCSM 2012
  - System Centre
  - work items

---
<font face="Calibri">So, there are a few ways of tackling the issue of automatically closing Incidents/Change Requests within Service Manager. Most of these solutions rely on a script leveraging </font>[<font face="Calibri">SMLets</font>][1]<font face="Calibri">. So you would create a script and then create a workflow and end up importing the Management Pack into Service Manager. The issue with this is the following, it is quite time consuming and should change under the hood with Service Manager, like the changes from 2010 to 2012, your script will most likely stop working. You can look at the </font>[<font face="Calibri">TechNet Gallery</font>][2] <font face="Calibri">for replacement scripts. </font>

<font face="Calibri">So, here enters something new I have found compliments of </font>[<font face="Calibri">Cireson</font>][3]<font face="Calibri">, a nice </font>[<font face="Calibri">FREE tool</font>][4] <font face="Calibri">which allows for easy configuration of “Auto-Close” not just of Incidents but of Work Items in General. Takes a few minutes to download and even easier to setup. It simply changes the status of the Work Items to completed/closed and then you standard Workflows will kick in.</font>

<font face="Calibri">I HIGHLY recommend this simple add-on for System Centre Service Manager 2012</font>

<font face="Calibri">Hope this helps,</font>

<font size="2" face="Calibri">Follow me.</font>

[<font size="2" face="Calibri"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></font>][5] <font size="2" face="Calibri"></font>[<font size="2" face="Calibri"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></font>][6]

<font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></font></p>

 [1]: http://smlets.codeplex.com/
 [2]: http://gallery.technet.microsoft.com/
 [3]: http://www.cireson.com/
 [4]: http://www.cireson.com/app-store/scsm-auto-close/
 [5]: http://www.facebook.com/fletcher.kelly
 [6]: http://twitter.com/#!/fskelly