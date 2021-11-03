---
title: Networking issues with Hyper-V
author: fskelly
type: post
date: 2012-08-28T13:35:56+00:00
url: /2012/08/28/networking-issues-with-hyper-v/
categories:
  - Failover Clustering
  - Hyper-V
tags:
  - Failover Cluster
  - hyper-v
  - NIC
  - nics
  - Virtual Switches

---
<font face="Calibri">Just recently I was running into some very strange issues with my Hyper-V Cluster. we have numerous NICs to allow for redundancy and better throughput for our clustered environment. We have a total of 11 NICs on our server to cater for Guest LAN, iSCSI, guest iSCSI (as we present SAN storage directly to the Guests), HeartBeat and Live Migration. So, I was getting a little concerned when I was performing maintenance and/or “Live Migrations” and my VMs were losing network connectivity both on LAN connections and iSCSI connections which was causing major issues with my VMs needing external storage as this was mostly SQL or file shares. So time to start troubleshooting.</font>

<font face="Calibri">First stop would obviously be the NICs on the hosts and I spent some time checking all the NICs and ensuring they are cabled correctly. Not the world’s easiest job considering the amount of network cables we have in our cabinets. We have numerous Hyper-V nodes, all with 11 NICs excluding Management and iDRAC. So we are talking hundreds of cables. However, I trudged through it and put a check mark next to it – no issues there.</font>

<font face="Calibri">So, several hours and days later and cursing and swearing all the network cables, velcro and cable ties in my cabinets, it was time to move on. So, it was NOT a physical network issue. Time to give a little further. My next stop was the Hypervisor layer.</font>

<font face="Calibri">I start diving through the Hypervisor and I found “gold” here, (I actually mean the cause of my issue). Enter Hyper-V Networking. Please allow me to clarify this. The networking was not the issue but what someone/something had done, the truth here will never be known. I found that I had duplicate Virtual Network created. </font>

<font face="Calibri">So, for each physical NIC i had in the server and was using for the Virtualization, I had 2 networks. 1 connected to the “External Network” and here is the kicker, 1 connected to the “PRIVATE” network. So with a little troubleshooting and deal of understanding Virtual Switches, I was able to return my cluster to it’s former 100% redundant glory. After removing ALL the private networks and there were many on all my Nodes, I was able to Live Migrate and patch/maintain to my heart’s content.</font>

<font face="Calibri">Gotta love Virtualization.</font>

<font face="Calibri">Hopefully this will help someone else as well.</font>

<font face="Calibri">The lesson here is to keep a good eye on your Virtual Environment and always check the basics.</font>

<font size="2" face="Calibri">Follow me.</font>

[<font size="2" face="Calibri"><img loading="lazy" style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="facebook-small322252222" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></font>][1] <font size="2" face="Calibri"></font>[<font size="2" face="Calibri"><img loading="lazy" style="background-image:none;margin:0;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="twitter-small322252222" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></font>][2]

<font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></font></p>

 [1]: http://www.facebook.com/fletcher.kelly
 [2]: http://twitter.com/#!/fskelly