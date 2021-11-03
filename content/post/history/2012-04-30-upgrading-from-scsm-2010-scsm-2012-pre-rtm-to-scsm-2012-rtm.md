---
title: Upgrading from SCSM 2010 / SCSM 2012 PRE-RTM to SCSM 2012 RTM
author: fskelly
type: post
date: 2012-04-30T07:09:49+00:00
url: /2012/04/30/upgrading-from-scsm-2010-scsm-2012-pre-rtm-to-scsm-2012-rtm/
publicize_results:
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"196861248430817280";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150843182487394";}}}'
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"196861248430817280";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150843182487394";}}}'
categories:
  - System Center
tags:
  - Connectors
  - Cubes
  - SCSM
  - SCSM 2012
  - Service Manager
  - Upgrade

---
So, You are now ready to take the plunge and upgrade to SCSM 2012 RTM as it now “publically” available.

There is great documentation, obviously, on [TECHNET][1]. I have however found out a few other things which will helpfully make your transition a little easier. I have found that the following can cause some complications and how to “mitigate” these if you will.

Service Manager 2010

Connectors – Please make sure that your connectors are NOT running while you do the upgrade, the upgrade will work, however your connectors will run and attempt to catch up with itself. This will in turn, create additional load on the SQL Service on your Management Server, which will in turn affect overall performance and will slow down workflows in particular.

> <span style="color:#111111;">Fix : Simply ensure that your connectors are NOT running.</span>

Service Manager 2012 PRE-RTM

Connectors – Please make sure that your connectors are NOT running while you do the upgrade, the upgrade will work, however your connectors will run and attempt to catch up with itself. This will in turn, create additional load on the SQL Service on your Management Server, which will in turn affect overall performance and will slow down workflows in particular.

> <span style="color:#111111;">Fix : Simply ensure that your connectors are NOT running.</span>

Cubes – If you are upgrading from a PRE-RTM Version to RTM, please note that I am sure that is not supported by Microsoft unless you were a TAP customer. So, this would be more for a lab environment. If your cubes are running, please allow them to process and ensure that they are in a processed and preferably NOT a “Partial Processed” state. Please also check the status of these job as per the [TECHNET][1] article and ensure that get-scdwjob returns all jobs in a “Not Started” state.

> <span style="color:#111111;">Fix : Ensure all cubes are in a processed state and NOT “Running” or “Partial Processed”</span>

As for System Centre Service Manager 2012, the connectors are greatly improved in SCSM 2012, while your SCSM 2010 Connectors will work, you will see that there is a difference in the Connectors as seen below.

[<img loading="lazy" class="alignnone  wp-image-351" title="ConnectorsSCSM2012" src="http://fskelly.files.wordpress.com/2012/04/blog21.jpg?w=300" alt="ConnectorsSCSM2012" width="404" height="181" />][2]

The old connectors “Active Directory” are migrated from SCSM 2010 to SCSM 2012. However, the new type “ADConnector” are more robust and more streamlined. I would recommend Creating the new type for all your existing connectors, disabling the existing and running only the new connectors. Once you are happy with the results and that new objects are being created and tested this for some time, then remove the older connectors.

If I can think of anything more, I will post this in future.

Follow me

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border:0;" title="facebook-small32225222222" src="http://fskelly.files.wordpress.com/2012/04/facebook-small32225222222.jpg" alt="facebook-small32225222222" width="44" height="44" border="0" />][3] [<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border:0;" title="twitter-small32225222222" src="http://fskelly.files.wordpress.com/2012/04/twitter-small32225222222.jpg" alt="twitter-small32225222222" width="44" height="44" border="0" />][4]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border:0;" title="MCC11_Logo_Horizontal_2-color_thumb_[1]" src="http://fskelly.files.wordpress.com/2012/04/mcc11_logo_horizontal_2-color_thumb_1_thumb.jpg" alt="MCC11_Logo_Horizontal_2-color_thumb_[1]" width="244" height="99" border="0" />][5]

 [1]: http://technet.microsoft.com/library/hh305220.aspx
 [2]: http://fskelly.files.wordpress.com/2012/04/blog21.jpg
 [3]: http://www.facebook.com/fletcher.kelly
 [4]: http://twitter.com/#!/fskelly
 [5]: http://fskelly.files.wordpress.com/2012/04/mcc11_logo_horizontal_2-color_thumb_1.jpg