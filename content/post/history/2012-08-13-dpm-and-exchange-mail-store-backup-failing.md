---
title: DPM and Exchange Mail Store Backup failing
author: fskelly
type: post
date: 2012-08-13T10:06:11+00:00
url: /2012/08/13/dpm-and-exchange-mail-store-backup-failing/
categories:
  - Uncategorized
tags:
  - backup
  - DPM
  - Exchange
  - Failing

---
<font face="Calibri"></p> 

<p>
  Not that long ago, I ran into a strange issue with my Exchange Environment.I had already configured by Exchange Backups and these had been running for quite some already. However, now all of a sudden the backups are NOT running to completion. So, checking the size of the “LOG” drives. i see that the logs are not being cleared and this appears to be the issue for the backup not running to completion.</font>
</p>

<p>
  <font face="Calibri"></font>&nbsp;
</p>

<p>
  <font face="Calibri">So, this is how you fix the issue.</font>
</p>

<p>
  <font face="Calibri">Open the Exchange Console, on the affected Mailbox Store, enable Circular Logging (temporarily, not permanently as this can lead to other issues especially with backups), dismount and remount the Mailbox Store for the setting to take affect. Once the logs have been cleared, you can check this by checking the free space on your “LOG” drives. Once the logs are cleared. Go to the &#8220;Mailbox Store” and then disable “Circular Logging” and dismount and remount the Mail Store, Run your DPM backup again and all should be now fixed.</font>
</p>

<p>
  <font face="Calibri">Hope this helps,</font>
</p>

<p>
  <font size="2" face="Calibri">Follow me.</font>
</p>

<p>
  <a href="http://www.facebook.com/fletcher.kelly"><font size="2" face="Calibri"><img loading="lazy" style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="facebook-small322252222" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></font></a><font size="2" face="Calibri"> </font><a href="http://twitter.com/#!/fskelly"><font size="2" face="Calibri"><img loading="lazy" style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="twitter-small322252222" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></font></a>
</p>

<p>
  <a href="/Users/fletcher/AppData/Local/Temp/WindowsLiveWriter1286139640/supfilesC1A798/MCC11_Logo_Horizontal_2-color_thumb2.jpg"><font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></font></p>