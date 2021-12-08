---
title: Service Manager 2012 Data Warehouse (Upgrade)
author: fskelly
type: post
date: 2011-11-22T07:25:40+00:00
url: /2011/11/22/service-manager-2012-data-warehouse-upgrade/
categories:
  - Data Warehouse
tags:
  - 2012
  - SCSM
  - SCSM 2012
  - Service Manager
  - Upgrade

---
&#160;

So, my journey with System Centre Service Manager 2012 Beta has begun and so far I have indeed found some funnies.

I will be blogging about them, to make everyone else’s life a little bit easier and in the hope of better product adoption for this product. It is simply put a fantastic product.

Ok, so the first time I ran the upgrade (remember I have a [pre-prod][1] environment), so I was able to rollback and did not have to follow Disaster Recovery with the Failure. I will cover the Disaster Recovery steps that I will follow in Production if I have an issue.

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="Error" border="0" alt="Error" src="http://fskelly.files.wordpress.com/2011/11/error_thumb.png" width="508" height="388" />][2]

So, like I was saying, I ran into a Reporting Services error when upgrading the Data Warehouse. So I rolled back to a previous state as I am using VMS. However, to resolve this particular issue, I ran the upgrade again. However, this time I opened the SQL Reporting Services webpage and allowed the reporting services webpage to load to completion before running the upgrade. 

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="Reporting Services" border="0" alt="Reporting Services" src="http://fskelly.files.wordpress.com/2011/11/reporting-services_thumb.jpg" width="759" height="609" />][3]

I suspect due to the limited specs on my virtual environment, the slow opening and hence communications with the Reporting Services caused my first failure. The second attempt was perfect.

I now had SCSM 2012 Beta Data Warehouse.

So, here is a breakdown of what I did.

> 1. Install Cumulative Update 2 for System Centre Service Manager 2010 SP1

> 2. Install Windows Server 2008 R2 Service Pack 1

> 3. Backup Encryption Key

> 4. Restart Server

> 5. Check the status of SQL Reporting Services (services.msc)

> 6. Check the status of Reporting Service (web site). First load of this website was VERY slow.

> 7. Disabled Data Warehouse Jobs <http://technet.microsoft.com/en-za/library/hh495610(en-us).aspx>

> 8. Waited 10 Minutes

> 9. Run the Upgrade

> 10. We have successfully upgraded the Data Warehouse Server.

> 11. <font>The only thing I did differently this time, I left the reporting services website open the whole time of the upgrade process.</font>

<font>With <font>Analysis Services(Cubes),</font> Permissions are controlled differently. Open SQL Management Studio, and ensure that you connect to <font>Analysis Services and NOT Database Engine</font> and then specify the SQL Server and assign permissions as needed so that people can/cannot access Cubes within Service Manager 2012 Console.</font>

<font></font>

<font>More to follow soon on the Management Server.</font>

Follow me

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="facebook-small32225" border="0" alt="facebook-small32225" src="http://fskelly.files.wordpress.com/2011/11/facebook-small32225.jpg" width="44" height="44" />][4] [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="twitter-small32225" border="0" alt="twitter-small32225" src="http://fskelly.files.wordpress.com/2011/11/twitter-small32225.jpg" width="44" height="44" />][5]

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="MCC_Logo_NEW" border="0" alt="MCC_Logo_NEW" src="http://fskelly.files.wordpress.com/2011/11/mcc11_logo_horizontal_2-color_thumb.jpg" width="244" height="99" />][6]

 [1]: http://fskelly.wordpress.com/2011/11/09/building-a-pre-production-environment-for-service-manager-2010/
 [2]: http://fskelly.files.wordpress.com/2011/11/error.png
 [3]: http://fskelly.files.wordpress.com/2011/11/reporting-services.jpg
 [4]: http://www.facebook.com/fletcher.kelly
 [5]: http://twitter.com/#!/fskelly
 [6]: http://fskelly.files.wordpress.com/2011/11/mcc11_logo_horizontal_2-color.jpg