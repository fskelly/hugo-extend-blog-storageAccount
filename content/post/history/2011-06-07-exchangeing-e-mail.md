---
title: Exchange(ing) e-mail
author: fskelly
type: post
date: 2011-06-07T10:47:16+00:00
url: /2011/06/07/exchangeing-e-mail/
categories:
  - Exchange
tags:
  - eseutil
  - HUB Transport
  - Mail
  - Mailflow
  - Queue

---
So, it has been another week and as always something new has been learnt. This time, however the product in question was Exchange Server 2010. We had some unexpected downtime for e-mail, so being the cautious person I am, i start checking Exchange. This is the story and the bizarre end result i had. Details to follow.

So here is the situation. I log onto our OWA in the morning and I am able to connect without any issue. So a good start. For me, the next step is to open Outlook and connect to Exchange via OutlookAnywhere, also worked, so far so good. So I make my way into the office and i decide to check Exchange further. I RDP onto the required servers and start checking services, all services are started and functioning. Great!!!! I check the mailbox stores and everything is mounted with no errors. So, you are probably asking what is so strange. 

Enter the strangeness!!!!!

I run a get-queue and to my horror only a single comes back, now I know that sometimes after a reboot, it takes some time for all correct queues to show up. So, send myself a test e-mail from myself to myself and I was expecting to see a mail queue with messages being delivered to the mailbox store. NO SUCH LUCK, and of course the e-mail was NOT delivered to me.

So, to sum up

1. All servers are up and functioning

2. All services on the server are up and running

3. All Mailbox Stores are up and mounted

4. External Connectivity is available

BUT NO MAIL FLOW!!!!!

So now onto some more troubleshooting.

I checked the server and found that there was some free space on the Hub Transport but as it turns out NOT ENOUGH. I discovered this by removing some unnecessary files on the server and I performed a get-queue and I had a few more queues. Great, Progress!!!!

So now, after running through a few additional steps. <font color="#000000">(Tested on Exchange 2010)</font>

1. Pause the Microsoft Exchange Transport Service (this allows the queue to be processed cleanly (without adding any additional messages)

2. Copy mail queue data folder (default “c:\Program Files\Microsoft\Exchange Server\V14\TransportRoles\data\Queue) to a safe place( rather safe than sorry)

3. Navigate to Exchange Queue Folder (c:\Program Files\Microsoft\Exchange Server\V14\TransportRoles\data\Queue)

4. Use eseutil to determine shutdown state. <font color="#000000">eseutil /mh mail.que</font>

5. If the state is “Dirty Shutdown”. <font color="#000000">eseutil /p mail.que<font color="#000000"> <font></font></font></font><font color="#ffffff">to repair the file (if “Clean Shutdown” move to next step)</font>

6. Run <font color="#000000">eseutil /d mail.que</font>

7. Restart Microsoft Exchange Transport Service

So now, you should be back up and running and mailflow has been restored, but now how the heck do you prevent this from happening again?

Enter “EdgeTransport.exe.config” (“c:\Program Files\Microsoft\Exchange Server\V14\Bin”)

The entries listed below can de modified to move the folder that holds mail.que onto a separate drive with more space.

<font color="#000000"><add key="QueueDatabasePath" value = "C:\Program Files\Microsoft\Exchange Server\V14\TransportRoles\data\Queue" /></font>

<font color="#000000"><add key="QueueDatabaseLoggingPath" value = "C:\Program Files\Microsoft\Exchange Server\V14\TransportRoles\data\Queue" /></font>

<font color="#000000"><add key="IPFilterDatabasePath" value = "C:\Program Files\Microsoft\Exchange Server\V14\TransportRoles\data\IpFilter" /></font>

<font color="#000000"><add key="IPFilterDatabaseLoggingPath" value = "C:\Program Files\Microsoft\Exchange Server\V14\TransportRoles\data\IpFilter" /></font>

<font color="#000000"><add key="TemporaryStoragePath" value = "C:\Program Files\Microsoft\Exchange Server\V14\TransportRoles\data\Temp" /></font>

Simply modify the values to meet the folder requirements on the new drive.

Follow me

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;margin:0;" title="facebook-small32" border="0" alt="facebook-small32" src="http://fskelly.files.wordpress.com/2011/06/facebook-small32.jpg" width="44" height="44" />][1] [<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="twitter-small32" border="0" alt="twitter-small32" src="http://fskelly.files.wordpress.com/2011/06/twitter-small32.jpg" width="44" height="44" />][2]

 [1]: http://www.facebook.com/fletcher.kelly
 [2]: http://twitter.com/#!/fskelly