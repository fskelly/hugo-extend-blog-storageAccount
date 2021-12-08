---
title: How I inadvertently tested our DR
author: fskelly
type: post
date: 2010-11-04T14:57:21+00:00
url: /2010/11/04/how-i-inadvertently-tested-our-dr/
categories:
  - Technology
tags:
  - Cibecs
  - Encryption
  - Mimecast
  - Weather

---
I decided to yet again sue Bitlocker, even knowing the previous experencies i have with it. It previously cost me all my data, however i had backed up all my data. I am sure by now you know where this is going. So, the weekend just past i decided to Encrypt my Hard Drive using BitLocker. I am not sure what i did to piss off Murphy, but as usual with me and BitLocker something went wrong. I could no longer boot into Windows. No worries, I have my recovery key, so I go home and connect my Hard Drive to an enclosure, and try to access the data. As expected I get asked for the Recovery Key, which was saved on a flash drive. I duly enter the Recovery and verify it to discover that Windows will NOT accept it. I try to run a repair to correct the BootLoader problem, NO JOY<img style="border-style:none;" class="wlEmoticon wlEmoticon-sadsmile" alt="Sad smile" src="http://fskelly.files.wordpress.com/2010/11/wlemoticon-sadsmile.png" /> !!!!!!, WITH NO BACKUP AT ALL.

So there is nothing to be done, FORMAT, OUCH!!!!!!!!!!!!!!!!!!!!! and start again. We have a few tools in place at the office which we setup and decided this was the best to actually test our DR tools, what point is there in having a DR process without actually testing it. I just really hoped it would not be testing it.

You might now this icon,&#160; [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="image" border="0" alt="image" src="http://fskelly.files.wordpress.com/2010/11/image_thumb.png" width="27" height="34" />][1], if you do, you are running CIBECS. This proved to be quite helpful since we have automated backups of all our documents. What a treat, it worked perfectly, installed the agent, ran a restore and provided the ENCRYPTION KEY. Hey presto, documents back and looking in far better shape.

&#160;

You might know MIMECAST as well, fortunately enough we use MIMECAST and they provide an archive for TEN YEAS. Since i started with the Company we have been using MIMECAST, so hello ARCHIVE and all my e-mail is there. As for all my previous e-mail, in any war there are casualties and they paid the ultimate price, gone, never to be seen again. I have been putting off my mail cleanup, this was a little drastic though BUT got the job DONE!!!

&#160;

I am now a big fan of the “CLOUD” and I am actively using LIVE MESH SYNC, and a blackberry app which plugs into this to keep my personal files synced onto the “CLOUD”

&#160;

Below, some nice pictures (keep in mind we were desperate for rain) from Karien’s parents place. Please excuse the quality, taken with BlackBerry.

&#160;

[![][2]][2][![][3]][3][![][4]][4]

&#160;

**_<font color="#ff0000" size="6" face="Broadway">“EMBRACE YOUR INNER GEEK AND</font>_**

**_<font color="#ff0000" size="6" face="Broadway">ROCK ON”</font>_**

 [1]: http://fskelly.files.wordpress.com/2010/11/image.png
 [2]: http://fletcherk.smugmug.com/Weather/Kariens-Parents-Place/IMG00031-20101031-1528/1072853278_2rYUK-S.jpg
 [3]: http://fletcherk.smugmug.com/Weather/Kariens-Parents-Place/IMG00032-20101031-1529/1072853937_x292j-S.jpg
 [4]: http://fletcherk.smugmug.com/Weather/Kariens-Parents-Place/IMG00033-20101031-1529/1072854200_pMTtd-S.jpg