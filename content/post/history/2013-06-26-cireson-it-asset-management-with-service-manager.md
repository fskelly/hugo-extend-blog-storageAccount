---
title: Cireson IT Asset Management with Service Manager
author: fskelly
type: post
date: 2013-06-26T10:23:48+00:00
url: /2013/06/26/cireson-it-asset-management-with-service-manager/
publicize_twitter_user:
  - fskelly
categories:
  - Uncategorized
tags:
  - Asset Import
  - Asset Management
  - Cireson
  - ITAM
  - SCSM
  - SCSM 2012
  - Service Manager

---
[Cireson][1] have recently released an new enhancement to the [Service Manager][2] console called the [Cireson SCSM Asset Management App][3]. This particular application is very easy to install. To install the application into the console, it is simply a case of importing a few management packs and some XML files and DLL files. This is very easy to do and the installation instructions provided by [Cireson][1] are very simple and easy to follow as with all [Cireson][1] add-ins I have worked with in the past.

In order to get the full benefit from the [Cireson SCSM Asset Management App][3], I would highly recommend that the [Configuration Manager Connector][4] be enabled within your environment. However, this is NOT a necessity. Within my environment as I run mine as a Lab, it is not always possible to have all the connectors enabled all the time. I was very easily able to configure my workflows (come with the [Cireson SCSM Asset Management App][3]) to work and pull in the required information. 

A sample of my workflow configuration is below. The workflows and settings for the [Cireson SCSM Asset Management App][3] are found under the Administration Wunderbar and then settings as with all [Cireson][5] applications.

There are settings for both Software and Hardware Collections.

Software

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/06/image_thumb-1.png" width="451" height="252" />][6]

Hardware

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/06/image_thumb1.png" width="460" height="257" />][7]

A little lower down on the Hardware tab, this is where the [Configuration Manager Connector][4] would add a tremendous amount of value as you can reference different&#160; value to be used as a Hardware ID. So, if you had the [Configuration Manager Connector][4] enabled, you could reference a Serial Number or Asset Tag. However, it is perfectly feasable to reference Principal name.

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/06/image_thumb2.png" width="450" height="249" />][8]

Under the “Miscellaneous”&#160; tab, is where the logging is configured, which is amazingly helpful for troubleshooting.

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/06/image_thumb3-1.png" width="465" height="263" />][9]

[(E-Mail me)][10]

![][11] 

<span style="font-size:small;font-family:calibri;">Follow me.</span>

![][12] Facebook (Personal)

![][13] Twitter (Personal & System Center)

&#160;![][14]Twitter (System Center Focused)

<span style="font-size:small;font-family:calibri;"><img src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg?w=244&h=99" /></span>

 [1]: http://www.cireson.com/
 [2]: http://technet.microsoft.com/en-us/systemcenter/ee923652.aspx
 [3]: http://www.cireson.com/app-store/scsm-asset-management/
 [4]: http://technet.microsoft.com/en-us/library/ff460951.aspx
 [5]: http://www.cireson.com/app-store/
 [6]: /wp-content/uploads/2013/06/image.png
 [7]: /wp-content/uploads/2013/06/image1.png
 [8]: /wp-content/uploads/2013/06/image2.png
 [9]: /wp-content/uploads/2013/06/image3-1.png
 [10]: mailto:systemcenterguyza@live.com
 [11]: /wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png
 [12]: http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg?w=44&h=44
 [13]: http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg?w=44&h=44
 [14]: /wp-content/uploads/2013/02/scsmlogo25232.jpg?w=56&h=43