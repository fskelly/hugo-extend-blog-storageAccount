---
title: Monitoring the Environment
author: fskelly
type: post
date: 2011-09-30T12:47:13+00:00
url: /2011/09/30/monitoring-the-environment/
categories:
  - Uncategorized

---
&#160;

So, a little while ago I had a post about documenting the environment.

Now, i am in the process of “Monitoring the Environment”. No worries, I have Operations Manager 2007 R2, Great!!!

So now I log into the Operations Manager Console and see a whole bunch of agents, great stuff! I am also seeing Alerts (not to great, but it appears to be working). Yes, I use the word “appears” quite deliberately. I start drilling into some of the views and enhanced reporting and I see that a lot of information is missing. Um……………

So, now it is time to start digging around and I find the following error on the Operations Manager RMS Server.

<u><strong><font>Event ID 21042</font></strong></u>

<font>Operations Manager has discarded 1 items in management group (managementgroupname) , which came from $$ROOT$$. These items have been discarded because no valid route exists at this time. This can happen when new devices are added to the topology but the complete topology has not been distributed yet. The discarded items will be regenerated.</font>

NOT GOOD!!!

I now also realise that the agents are not actually communicating properly with the RMS.

DAMN!!!!!

So, I do some searching on the internet, using the search engine of your choice (<img style="border-style:none;" class="wlEmoticon wlEmoticon-smile" alt="Smile" src="http://fskelly.files.wordpress.com/2011/09/wlemoticon-smile.png" /> ) and find the following article.

[http://anandthearchitect.wordpress.com/2009/12/02/scom-2007-r2-%E2%80%93-rms-server-not-seeing-the-agents-or-agents-are-not-talking-to-the-server/][1]

Whoever wrote this, Thank you!!!!

Following the steps of updating the Management Packs worked like a dream. Now, all of a sudden I see a whole bunch of new activity and new configuration are being sent to the clients and a lot of new activity.

Yay, and now I see a lot of new active agents and more valid alerts.

Hope this helps,

&#160;

Follow me

[<img loading="lazy" title="facebook-small32222" border="0" alt="facebook-small32222" src="http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg" width="44" height="44" />][2] [<img loading="lazy" title="twitter-small32222" border="0" alt="twitter-small32222" src="http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg" width="44" height="44" />][3]

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="MCC_Logo_NEW" border="0" alt="MCC_Logo_NEW" src="http://fskelly.files.wordpress.com/2011/09/mcc11_logo_horizontal_2-color_thumb.jpg" width="244" height="99" />][4]

 [1]: http://anandthearchitect.wordpress.com/2009/12/02/scom-2007-r2-%E2%80%93-rms-server-not-seeing-the-agents-or-agents-are-not-talking-to-the-server/ "http://anandthearchitect.wordpress.com/2009/12/02/scom-2007-r2-%E2%80%93-rms-server-not-seeing-the-agents-or-agents-are-not-talking-to-the-server/"
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly
 [4]: http://fskelly.files.wordpress.com/2011/09/mcc11_logo_horizontal_2-color.jpg