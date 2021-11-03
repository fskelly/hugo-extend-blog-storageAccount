---
title: The “crisis” week
author: fskelly
type: post
date: 2011-05-03T08:44:31+00:00
url: /2011/05/03/the-crisis-week/
categories:
  - Technology
tags:
  - DPM
  - SCSM
  - SMLets

---
Hi All,

The last two weeks have been a little nutty for me. I have however, learnt to appreciate a few more things in life.

1. No matter how good your planning for DR, there is always that one thing that catches you. We have a generator, which is great<img class="wlEmoticon wlEmoticon-smile" style="border-style:none;" src="http://fskelly.files.wordpress.com/2011/05/wlemoticon-smile.png" alt="Smile" /> . Now, when we cutover from generator power to mains power and then the main building power trips, life becomes interesting. It is especially interesting when you have a UPS and it takes the load after your building has tripped. So now your enclosure is running on UPS power and then the UPS fails<img class="wlEmoticon wlEmoticon-confusedsmile" style="border-style:none;" src="http://fskelly.files.wordpress.com/2011/05/wlemoticon-confusedsmile.png" alt="Confused smile" /> 

2. DPM has once again proved itself to me. I was able to restore and recover the VHD and get my Cluster up and running again with NUMEROUS VMs.

3. I am sure that everyone knows this, but DAMN, a hard shutdown (see point 1) of a cluster hurts. Thanks goodness our SAN was not hurt as well. The correct RAID config which allows for 3 failed drives. Especially when you loose 1 drive due to the shutdown.

4. SCVMM does not really like a hard shutdown of a cluster (see point 1 again) and machines being in a “saved”, for us, this was especially tricky.

More to come on SCSM 2010, now starting to play with Get-SCSMObject with [smlets][1] and get-scsmobject, the [SCSM Engineering Team Blog][2] is a fantastic resources and many thanks go out to the people who run and maintain this site, it is a gold mine.

Related sites,

<http://www.scsm.se/>

<http://blog.scsmfaq.ch/>

[http://www.scsm.se/][3]

A few great people to follow on twitter, all of them (that I know of, still finding more al the time), are a fountain of knowledge.

radtravis

syscencentral

JR52MAR

_**<span style="font-family:Broadway;color:#ff0000;font-size:x-large;">“EMBRACE YOUR INNER GEEK AND</span>**_

_**<span style="font-family:Broadway;color:#ff0000;font-size:x-large;">ROCK ON”</span>**_

 [1]: http://smlets.codeplex.com/
 [2]: http://blogs.technet.com/b/servicemanager/
 [3]: http://www.scsm.se/ "http://www.scsm.se/"