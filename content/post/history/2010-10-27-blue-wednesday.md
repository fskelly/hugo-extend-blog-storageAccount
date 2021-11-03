---
title: “Blue Wednesday”
author: fskelly
type: post
date: 2010-10-27T12:27:29+00:00
url: /2010/10/27/blue-wednesday/
categories:
  - Uncategorized
tags:
  - DHCP helper
  - iSCSI
  - Reporting Services
  - SQL
  - technology

---
Do you ever have those days where it just starts bad and gets worse?

“Man Alive, what a day it has been and it is not over yet”

First, simple network change, enabling DHCP helper on our new Infrastructure. Sounds simple, right?. Well, our switches are stacked for connectivity and storage, so a reboot of the switches means shutting down the environment, IP and iSCSI. So I go and do this, not knowing about our cluster needing 3 nodes active, what a mission. We eventually got everything up and working after some help from “Call a Friend”, you know who you are and THANK YOU AGAIN<img style="border-style:none;" class="wlEmoticon wlEmoticon-smile" alt="Smile" src="http://fskelly.files.wordpress.com/2010/10/wlemoticon-smile.png" /> .

Then we decide to move one and continue the day’s work with our migration, hit some snags there, but got through that.

Got to my desk and decided to load up our helpdesk tool, only to find the Reporting component is playing up. However, I would like to introduce all of you to my good friend and you all know him, Uncle [GOOGLE][1]. After much digging through MS Articles and already having done these steps and not finding much wrong, I came across the following gem. <http://www.sqlservercentral.com/Forums/Topic719286-146-1.aspx#bm726108> . Gotta love these dedicated sites, followed the TEMP folder route and “voila” (almost as good as abracadabra, hehe), it is now working again.

&#160;

In hindsight, should have stayed in bed and bunked today.

LOL

&#160;

<font color="#ff0000" size="6" face="Broadway"><em><strong>“EMBRACE YOUR INNER GEEK AND</strong></em></font>

<font color="#ff0000" size="6" face="Broadway"><em><strong> ROCK ON”</strong></em></font>

 [1]: http://www.google.co.za/