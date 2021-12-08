---
title: System Centre Service Manager 2012 Portal
author: fskelly
type: post
date: 2011-11-30T16:02:55+00:00
url: /2011/11/30/system-centre-service-manager-2012-portal/
publicize_results:
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"141910087475281920";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150492888377394";}}}'
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"141910087475281920";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150492888377394";}}}'
categories:
  - Self Service Portal
tags:
  - SCSM
  - Service Manager
  - SSP
  - System Centre

---
&#160;

So now, I move onto the final part of the SCSM 2012 journey, the Portal.

The install was pretty straight-forward, the most difficult part is deciding how you would split your roles or if you are going to split your roles, [here][1] is the guide for role placement.

So, once you have decided which route you would like to follow, here are the steps I followed.

  1. Start the setup. 
  2. I decided NOT to use SSL from the get go, as there APPEARS to be a “niggly” with Certificates, it would appear that since I have implemented my portal, a [TechNet article][2] has been released to address this issue. 
  3. I Chose to use port 5555 for the SharePoint Service (SCSMWebContentServer). 
  4. You will need to UNCHECK “Use SSL”, go back and then go forward again, not sure if just works like that. 
  5. When you get to the option to configure the portal, I chose to use port 5556 (Service Manager Portal), again NO SSL 
  6. Select the required database, your Service Manager database on your Primary Service Manager Management Server. 
  7. Once completed, you have a nice starting for portal based on SharePoint Foundation. 

> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="Portal Home pAge" border="0" alt="Portal Home pAge" src="http://fskelly.files.wordpress.com/2011/11/portal-home-page_thumb.png" width="740" height="594" />][3]

Okay, so now some funnies and nigglies I have picked up, please note that this is beta software and this might account for some of these.

  1. When you open the portal for the first time, you will be greeted by a team site http://<url>:<portnumberyouchose> 
  2. [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" border="0" alt="image" src="http://fskelly.files.wordpress.com/2011/11/image_thumb1.png" width="743" height="553" />][4] 
  3. Easily solved, the actual portal hides under /smportal, so it you go to [:/smportal">:/smportal">:/smportal">http://<url>:<portnumberyouchose>/smportal][5], you will see your familiar portal as above. 
  4. [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="Portal Home pAge" border="0" alt="Portal Home pAge" src="http://fskelly.files.wordpress.com/2011/11/portal-home-page_thumb1.png" width="740" height="594" />][6] 
  5. You will need to add all domain users to the read group, this can be modified under “Sit Actions” –> “Site Permissions”, then create a group and add “<domain>\domain users and give them “Read” permissions. 
  6. As an extension of this, I had to add my end users to some roles in Service Manager itself. I created an Active Directory group and add all my end users to this group. Then I went into Service Manager and the “Administration” Pane –> Security –> User Roles –> add created group to “Read-Only Operators” 
  7. With the Self-Service Portal and Service and Request Offerings, it would appear that the Icons (for me at least) are limited to .JPG showing in the portal. I have tried with others and they do not appear to display on the Portal. 

&#160;

Hope this helps,

Follow me

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;margin:0;" title="facebook-small3222522" border="0" alt="facebook-small3222522" src="http://fskelly.files.wordpress.com/2011/11/facebook-small3222522.jpg" width="44" height="44" />][7] [<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;margin:0;" title="twitter-small3222522" border="0" alt="twitter-small3222522" src="http://fskelly.files.wordpress.com/2011/11/twitter-small3222522.jpg" width="44" height="44" />][8]

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2011/11/mcc11_logo_horizontal_2-color_thumb__thumb.jpg" width="244" height="99" />][9]

 [1]: http://technet.microsoft.com/en-za/library/hh519801(en-us).aspx
 [2]: http://technet.microsoft.com/en-za/library/hh667343(en-us).aspx
 [3]: http://fskelly.files.wordpress.com/2011/11/portal-home-page.png
 [4]: http://fskelly.files.wordpress.com/2011/11/image1.png
 [5]: http://<url>:<portnumberyouchose>/smportal
 [6]: http://fskelly.files.wordpress.com/2011/11/portal-home-page1.png
 [7]: http://www.facebook.com/fletcher.kelly
 [8]: http://twitter.com/#!/fskelly
 [9]: http://fskelly.files.wordpress.com/2011/11/mcc11_logo_horizontal_2-color_thumb_.jpg