---
title: Service Manager and all the tricks I have learnt
author: fskelly
type: post
date: 2011-03-04T09:27:48+00:00
url: /2011/03/04/service-manager-and-all-the-tricks-i-have-learnt/
categories:
  - System Center
  - Uncategorized

---
It has been some time since I last blogged, been a really nutty time. however i will make the time to blog and hopefully who ever reads this, it will be of assistance to them.

The lessons I have learned thus far.

1. Label all your workflows properly, this cost me a case with MS Support only to discover that all workflows and NOW notifications are grouped together. I am assuming that this is to aid the troubleshooting process should something go wrong.

2. A lot of tweaking and customization is actually needed, there are some great tools available for this. There is the <System Center Service Manager Authoring Tool SP1> which is a great help. There is also [SMLets][1], which is a collection of Powershell Cmdlets designed for Service Manager. I would not be able to function correctly without this collection of tools, you can do many things with this tool.

> a.Force-Activate a case once it has been closed, should a user come back and claim that the case is NOT Resolved, click [here][2] for the link.
> 
> b, Automatically close “Resolved” cases after a certain period of inactivity. Click [here][3] for more information. I also took it a step further and used a great application called [PowerWF][4] and used this [link][5] to create the MP, it did need some tweaking though.
> 
> c. Implement the changes slowly, as this product will be a lot for the END Users to come to grips with. 

3. The original e-mail setup with SCSM (NO Service Pack) will only work with e-mail enabled users with your Exchange Organization. I cannot as yet comment on the [System Center Service Manager – Exchange Connector][6]. I will let you know soon.

&#160;

Keeping it short and sweet for now.

&#160;

_**<font color="#ff0000" size="6" face="Broadway">“EMBRACE YOUR INNER GEEK AND</font>**_

_**<font color="#ff0000" size="6" face="Broadway">ROCK ON”</font>**_

 [1]: http://smlets.codeplex.com/
 [2]: http://blogs.litware.se/?p=646
 [3]: http://blogs.litware.se/?p=632
 [4]: http://powerwf.com/
 [5]: http://www.youtube.com/watch?v=G-K28OBiRfI
 [6]: http://www.microsoft.com/downloads/en/details.aspx?FamilyID=0b48d1f1-434a-4ee6-8017-fc13f4c16785