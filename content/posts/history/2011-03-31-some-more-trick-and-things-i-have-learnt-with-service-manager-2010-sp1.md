---
title: Some more trick and things I have learnt with Service Manager 2010 SP1
author: fskelly
type: post
date: 2011-03-31T10:11:56+00:00
url: /2011/03/31/some-more-trick-and-things-i-have-learnt-with-service-manager-2010-sp1/
categories:
  - System Center
  - Uncategorized

---
1. When creating a new Self Service portal, ensure that you log onto on the server using your “Service Manager” Account, the account configured when first creating the Service Manager Server. The portal will install and seem to work. However, when you open the Portal, you will get HTTP 500.

2. When configuring your Data Warehouse, ensure that the Database name has no “–“ in the name as this is NOT supported by the Reporting Component of Service Manager 2010.

3. If you are having any issues with DataWarehouse Jobs, the first steps is to restart all System Centre services.

4. When working with Activities, ensure that you update the Activity before the “End Date and Time” or even though you completed it in time, it will show up as “not completed”

&#160;

Just a heads up when making some changes and what i have learnt thus far. 

More to come!!!

Hope this helps.

I am sure of that<img style="border-style:none;" class="wlEmoticon wlEmoticon-smile" alt="Smile" src="http://fskelly.files.wordpress.com/2011/03/wlemoticon-smile1.png" /> 

&#160;

_**<font color="#ff0000" size="6" face="Broadway">“EMBRACE YOUR INNER GEEK AND</font>**_

_**<font color="#ff0000" size="6" face="Broadway">ROCK ON”</font>**_