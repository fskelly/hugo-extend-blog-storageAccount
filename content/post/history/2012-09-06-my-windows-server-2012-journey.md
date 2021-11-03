---
title: My Windows Server 2012 Journey
author: fskelly
type: post
date: 2012-09-06T15:12:58+00:00
url: /2012/09/06/my-windows-server-2012-journey/
categories:
  - Hyper-V
tags:
  - 2012
  - hyper-v
  - Hyper-V3
  - Replica
  - VHDX
  - Windows Server 2012

---
<font face="Calibri">So, my journey with Windows Server 2012 has started. The primary focus of my company’s journey is Hyper-V3. So far, the results are impressive. We are running a cluster consisting of 4 nodes connected to a DAS.</font>

<font face="Calibri">So, my lessons learnt so far.</font>

<font face="Calibri">1. As per my </font>[<font face="Calibri">previous article</font>][1]<font face="Calibri">, be careful with your Hyper-V NICs. While I am discussing NICs, the inclusion of “Out the box” NIC Teaming is great and so far no issues at all. Works well and allows us to simplify the administration of our Virtual switches and allows for more tolerance in terms of the loss of a NIC. Before, should we loose a NIC, all VMs attached to that NIC would loose connectivity, that is now a thing of the past and our NIC Teaming is fully supported by Microsoft. NICE!!!</font>

<font face="Calibri">2. Increased VHD hard drives, this is achieved by introducing a new type of file format called a .VHDX which allows for “Virtual Hard Drives” larger than 2TB. This works nicely and I have personally created a few VHDx’s larger than 2TB. There is no little “gotcha”, or at least this was in my environment. The creation of this .vhdx file is rather time-consuming and very IO intensive with a DAS. I will try to remember to update you when I try this same procedure on my Equallogic SAN. However, for now, I would recommend you test this process first and see if you run into the same IO issues as I did, before creating numerous .vhdx’s in your production environment.</font>

<font face="Calibri">3. Virtual CPU increase. This has been particularly helpful with our process of creating a new environment. It is quite amazing how much more “CPU” can help with this. Finally I could create a VM with over 2TB of usable space in one drive and have more than 4 vCPU’s, what a pleasure. So I would create my “Core Services” and throw massive CPU and RAM at the VMs to create them and update, once completed I would remove the additional resources and then “sweat” the VMs. </font>

<font face="Calibri">4. Hyper-V Replica. This is a great tool for us and almost feels like it was custom written for us. I guess pretty much everyone is thinking that. However, there is a slight spanner in the works for us. By this I mean a little bit of a re-think in terms of how we present storage especially to the VMs which we want to have as part of our “DR Cloud” if you will. We present a lot of our additional drives directly via iSCSI, This is great and iSCSI works well, VERY well. However when you are trying to think about a DR situation, it adds complexity as you can replicate the VM only, you then need to replicate the presented iSCSI volumes and then reconfigure the network cards. Hence the “re-think” we are looking at a better way to work around this. We want and need Hyper-V replica.</font>

<font face="Calibri">ODX Offload. This is one I am waiting to test, our SAN Vendor has promised this in the next release of their firmware. More to come on this as soon as I can give some more information on this.</font>

<font face="Calibri">More to come I promise,</font>

<font size="2" face="Calibri">Follow me.</font>

[<font size="2" face="Calibri"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></font>][2] <font size="2" face="Calibri"></font>[<font size="2" face="Calibri"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></font>][3]

<font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></font></p>

 [1]: http://fskelly.wordpress.com/2012/08/28/networking-issues-with-hyper-v/
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly