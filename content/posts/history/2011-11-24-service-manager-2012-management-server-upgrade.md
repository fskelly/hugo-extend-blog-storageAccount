---
title: Service Manager 2012 Management Server (Upgrade)
author: fskelly
type: post
date: 2011-11-24T05:36:25+00:00
url: /2011/11/24/service-manager-2012-management-server-upgrade/
categories:
  - Management Server
  - Uncategorized
tags:
  - SCSM
  - SCSM 2012
  - Service Manager
  - System Centre
  - Upgrade

---
So, for the Management Server.

This was very easy and quite painless for me.

  1. Backup Encryption Key (for Disaster Recovery Purposes)
  2. Install Windows Server 2008 R2 SP1 (This is a pre-requisite for SCSM 2012)
  3. Remove Operations Manager Agent if this is installed, as the installer WILL stop you from continuing if the OpsMan Agent is installed.
  4. Run the Upgrade, PLEASE NOTE that if the Portal is installed on your Management Server, it will be REMOVED during the upgrade.
  5. Successfully completed the upgrade.
  6. Restart all 3 System Center services

So, now to upgrade the console

  1. Upgrade the Management Console, there are some pre-requisites that are needed. I will focus on the three most common ones that we needed in our environment. 
      1. Dot Net Framework 3.5 SP1 (configured using Roles and Features) [download][1] , [redist][2]
      2. Microsoft SQL Server 2008 Analysis Management Objects [download][3]
      3. ADO.NET Data Services Update [download][4]

You can now use the new Console of the freshly upgraded Management Server and you can now check a few things.

1. Ensure that the Data Warehouse & Reporting Buttons are present in the console. These can take a few seconds to load. Once loaded, you know that the Data Warehouse Registration is complete and carried over from SCSM 2010. Mine takes an average of 5 seconds to populate the additional buttons.

2. You can now ensure that all the System Center Services are started on the Data Warehouse Server and finalize all [post installation tasks][5]

3. If you are expecting to find CUBES immediately, it is unlikely to happen. They will appear after some of the additional Data Warehouse jobs have run. Please remember that you will also need to “Process Cube” before they can be used.

Hope this helps,

Follow me

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="facebook-small322252" src="http://fskelly.files.wordpress.com/2011/11/facebook-small322252.jpg" alt="facebook-small322252" width="44" height="44" border="0" />][6] [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="twitter-small322252" src="http://fskelly.files.wordpress.com/2011/11/twitter-small322252.jpg" alt="twitter-small322252" width="44" height="44" border="0" />][7]

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb" src="http://fskelly.files.wordpress.com/2011/11/mcc11_logo_horizontal_2-color_thumb_thumb.jpg" alt="MCC11_Logo_Horizontal_2-color_thumb" width="244" height="99" border="0" />][8]

 [1]: http://www.microsoft.com/download/en/details.aspx?id=22
 [2]: http://www.microsoft.com/download/en/details.aspx?id=25150
 [3]: http://www.microsoft.com/download/en/details.aspx?id=8824
 [4]: http://support.microsoft.com/kb/976127
 [5]: http://technet.microsoft.com/en-za/library/hh524327(en-us).aspx
 [6]: http://www.facebook.com/fletcher.kelly
 [7]: http://twitter.com/#!/fskelly
 [8]: http://fskelly.files.wordpress.com/2011/11/mcc11_logo_horizontal_2-color_thumb1.jpg