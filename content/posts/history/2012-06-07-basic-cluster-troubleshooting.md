---
title: Basic Cluster Troubleshooting
author: fskelly
type: post
date: 2012-06-07T12:17:25+00:00
url: /2012/06/07/basic-cluster-troubleshooting/
categories:
  - Failover Clustering
tags:
  - Cluster Service
  - CSV
  - node
  - owner
  - powershell
  - Troubleshooting

---
<span style="font-family:Calibri;">So, just last night, we had an issue with our cluster.</span>

<span style="font-family:Calibri;">One of our disks would not come online. We were seeing an error event ID: 1304 as below.</span>

[<span style="font-family:Calibri;"><img loading="lazy" style="border-width:0;padding-top:0;padding-right:0;padding-left:0;display:inline;background-image:none;" title="error1304" src="http://fskelly.files.wordpress.com/2012/06/error1304_thumb.png" alt="error1304" width="278" height="76" border="0" /></span>][1]

<span style="font-family:Calibri;">So, we began to investigate as all the Technet articles state that the drive is corrupted and Disk Signatures need to be changed, however we have had no major changes in the last little while. We were also able to view to CSV Volume from our SAN management tools. So, we were confused. The disk just would not come online.</span>

<span style="font-family:Calibri;">1 . The Quorum was online, or else the cluster would not come online.</span>

<span style="font-family:Calibri;">2. All the nodes were online.</span>

<span style="font-family:Calibri;">3. All Networks were online</span>

<span style="font-family:Calibri;">4. The cluster virtual name and IP was up.</span>

<span style="font-family:Calibri;">However, only CSV would not come online. So, we began to dig a little bit deeper and discovered that the error message was a little misleading, it did however contain some useful information. From the error message we were able to glean the problem node (CSV Owner). We then hopped onto the problem node and after a little digging around, discovered that the volume had been set to OFFLINE. We set the volume to ONLINE and then tried to bring the resource ONLINE in Failover Cluster Manager and hey PRESTO!!! The volume can online and so did my VMs.</span>

<span style="font-family:Calibri;">I have since created a PowerShell script which can be found <a href="http://gallery.technet.microsoft.com/Basic-CSV-Cluster-9c3bf6d9">here</a> to help the troubleshooting process. All you need to do is provide the list of cluster/s to be checked.  It does the following.</span>

<span style="font-family:Calibri;">1. Check if the nodes state is in an “UP” state. If the node is in an up state, it then checks the status of the Cluster Service and reports if it is up or down.</span>

<span style="font-family:Calibri;">2. It then checks the CSV state and specifies the current owner of the CSV and then lets you know if the CSV online or reserved. This is good.</span>

<span style="font-family:Calibri;">3. Should it get a state other than this, it then proceeds to run a list disk from diskpart on the reported CSV owners to help you find which CSV and which owner to start working on.</span>

<span style="font-family:Calibri;font-size:small;">Follow me.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border:0;" title="facebook-small3222522" src="http://fskelly.files.wordpress.com/2012/06/facebook-small3222522.jpg" alt="facebook-small3222522" width="44" height="44" border="0" /></span>][2][<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border:0;" title="twitter-small3222522" src="http://fskelly.files.wordpress.com/2012/06/twitter-small3222522.jpg" alt="twitter-small3222522" width="44" height="44" border="0" /></span>][3]

<span style="font-family:Calibri;font-size:small;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_.jpg"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb.jpg" alt="MCC11_Logo_Horizontal_2-color_thumb_" width="244" height="99" border="0" /></a></span>

 [1]: http://fskelly.files.wordpress.com/2012/06/error1304.png
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly