---
title: ConfigMgr (SCCM) 2012 wont open console–cannot connect to the site
author: fskelly
type: post
date: 2012-10-29T09:37:04+00:00
url: /2012/10/29/configmgr-sccm-2012-wont-open-consolecannot-connect-to-the-site/
publicize_twitter_user:
  - fskelly
categories:
  - ConfigMgr
  - System Center
tags:
  - connect
  - Console
  - failed
  - Native client
  - SCCM
  - site
  - SSRS

---
<font face="Calibri">So, we have started our migration from ConfigMgr 2007 R2 to SCCM 2012. We have installed the new site and now we have started building the required collections as we are using a mix of old collections from ConfigMgr 2007 ( a lot of the built-in collections that are present in ConfigMgr 2007 are NOT present in SCCM 2012. So of course, copy and paste of the Query language is quite useful and this is one of the first things I would do when you are in the process of a SCCM Migration.</font>

<font face="Calibri">Next up boundaries, at least the new version reads Active Directory and then creates the boundaries for you. We are creating custom Boundary groups so suit our needs as we have quite a mix of “FAST” and “SLOW” WAN links. </font>

<font face="Calibri">So far so good, starting to push out clients and get them reporting to the new site. This is going well and can be time-consuming. So, we decided to install the Reporting Point so we can get some decent reports from the system. </font>

<font face="Calibri">By now, it is late on Friday and I decide to push out the installation to a whole collection I have created and allow time over the weekend for the clients to install and report nicely back to SCCM.</font>

<font face="Calibri">So, naturally on Monday morning I want to open the console and see how my “Client Push” went and I was greeted with the following.</font>

[<font face="Calibri"><img loading="lazy" title="SnipImage" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="SnipImage" src="http://fskelly.files.wordpress.com/2012/10/snipimage_thumb.jpg" width="547" height="228" /></font>][1]<font face="Calibri">&nbsp;</font>

<font face="Calibri">Not exactly want you want to see. So after some more digging around I found this in the event log.</font>

[<font face="Calibri"><img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="http://fskelly.files.wordpress.com/2012/10/image_thumb.png" width="372" height="259" /></font>][2]

<font face="Calibri">And what is really strange is that nothing had changed over the weekend and this is a brand new install and I was able to open the console on Friday afternoon to push out the clients. So, now for some troubleshooting, checked SPN’s with this </font>[<font face="Calibri">article</font>][3]<font face="Calibri">, Check!!! no changes and still I cannot connect to the main site.</font>

<font face="Calibri">So now time for some more digging. I now decided it was time to look at this from an SCCM Log point of view. For this, I opened SMSProv.log from the machine I was trying to connect to the console. More proof that something was wrong.</font>

[<font face="Calibri"><img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2012/10/image_thumb1.png" width="569" height="58" /></font>][4]

<font face="Calibri">So, now I decided to employ a good friend called Uncle Google. <img class="wlEmoticon wlEmoticon-smile" style="border-style:none;" alt="Smile" src="/wp-content/uploads/2012/10/wlemoticon-smile-1.png" /></font>

<font face="Calibri">I was able to find a fix here.</font>

[<font face="Calibri">http://social.technet.microsoft.com/Forums/en-US/configmanagerdeployment/thread/8670176d-d780-49fc-9f2a-426ab903fe73/</font>][5]

<font face="Calibri">It turns out to be an issue with the SQL 2008 R2 Native Client, after removing the SQL 2008 R2 Client and installing the SQL 2008 Client, no more problems. I think the delay with mine, it that the SQL instance only failed to the second node in our cluster over the weekend. So, when trying to create a new connection to the new node, the native client for SQL 2008 R2 started its havoc.</font>

<font face="Calibri">And it worked like a charm.</font>

<font face="Calibri">Hope this helps,</font>

<font size="2" face="Calibri">Follow me.</font>

[<font size="2" face="Calibri"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></font>][6] <font size="2" face="Calibri"></font>[<font size="2" face="Calibri"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></font>][7]

<font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></font></p>

 [1]: http://fskelly.files.wordpress.com/2012/10/snipimage.jpg
 [2]: http://fskelly.files.wordpress.com/2012/10/image.png
 [3]: http://technet.microsoft.com/en-us/library/hh427336.aspx#BKMK_ManageSPNforDBSrv
 [4]: /wp-content/uploads/2012/10/image1-1.png
 [5]: http://social.technet.microsoft.com/Forums/en-US/configmanagerdeployment/thread/8670176d-d780-49fc-9f2a-426ab903fe73/ "http://social.technet.microsoft.com/Forums/en-US/configmanagerdeployment/thread/8670176d-d780-49fc-9f2a-426ab903fe73/"
 [6]: http://www.facebook.com/fletcher.kelly
 [7]: http://twitter.com/#!/fskelly