---
title: Cireson Analyst Web Console
author: fskelly
type: post
date: 2013-01-22T09:32:19+00:00
url: /2013/01/22/cireson-analyst-web-console/
categories:
  - System Center
tags:
  - Cireson
  - Console
  - SCSM
  - SCSM 2012
  - Service Manager
  - ServiceManager
  - Web Console

---
I have always heard complaints from some of the analysts in my company about having to install the Service Manager Console on their machines and then complaining about having to learn a new application.

So, I went searching around and found a great application called [Cireson SCSM Web Console][1], this allows analysts to update Incidents via a newly designed web portal for Analysts. Since the console is designed in HTML5, the web console is browser agnostic. This face also helps some companies to adopt this as it allows analysts to use all types of devices to update incidents.

The guide provided to install the application is Comprehensive and easy to follow. Just make sure you do all the steps. I have added some screenshots of errors I got along the way, trying to “jump the gun” and see the new Web Console in action.

“Issues and Errors” I ran into, all of which are easily fixed.

<span style="background-color:#ffff00;">Server error in ‘/’ Application</span>

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb.png" width="648" height="353" border="0" />][2]

This error is pretty much self-explanatory, I tried to open the console before the Cireson Management Pack had been imported. A simple fix, import the Management Pack.

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb1.png" width="648" height="353" border="0" />][3]

Again, this looks intimidating. This is very easy to fix if you look at error. When you are going through the installation guide, it is very easy to miss a step. Like this, when configuring the web.config file with Active Directory Connector information, it is very easy to find the space for the DN Name of your domain. When the above happens, it is simple a case of not adding the full DN for a <span style="background-color:#ffff00;">DOMAIN CONTROLLER</span>.

But now, onto the console in action. Just one side note, for now the [Cireson SCSM Web Console][1] handles only incidents, I have heard that plans are in progress for the [Cireson SCSM Web Console][1] to be extended to include Service Requests and potentially Problems, WOW!!!!!!

The [Cireson SCSM Web Console][1] is really easy to navigate and very easy to understand, anything you can do in the actual console, you can do on the [Cireson SCSM Web Console][1]. So, if you make the [Cireson SCSM Web Console][1] publically available, your Analysts can update from anywhere with any device as the Web Console is NOT dependent on [Microsoft Silverlight][4].

As you can see below, the Web Console is very nicely put together and gives you all the information you need at a quick glance.

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb2.png" width="648" height="353" border="0" />][5]

You can click an incident to open it and you will be presented with some detailed information regarding the incident as can be seen below. You can also “Edit Incident” from the Web Console to update it.

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb3.png" width="648" height="351" border="0" />][6]

From the top Level Tabs, you can see you access all the information you could regarding Incidents

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb4.png" width="648" height="352" border="0" />][7]

Below are screenshots of each “Section” from the Top Level Menu”

Incidents can also be LOGGED from the Web Console, displaying all information from your SCSM Implementation

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb5.png" width="648" height="323" border="0" />][8]

The “My Team’s Incidents” leverages the groups and information provided during the installation of the Web Console and provides a consolidated view of the Incidents assigned to the “Support Group” to which the currently logged on user is a member and this works very nicely with [Cireson SCSM Group Assign][9]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb6.png" width="648" height="286" border="0" />][10]

The “All My Incidents” View provide a view of all incidents assigned to the currently “logged on” user.

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb7.png" width="648" height="326" border="0" />][11]

The “All Incidents” view provides an overview for all incidents within your Service Manager environment. By default, only active incidents are shown, you can select the checkbox to show resolved incidents.

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb8.png" width="648" height="334" border="0" />][12]

The “Search Incidents” views allows you to search via a number of different fields, making it really easy to find any incidents you are looking for.

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb9.png" width="648" height="334" border="0" />][13]

The “Configuration Items” view is the representation of the CI Items within the organization on the Web Console.

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/01/image_thumb10.png" width="648" height="368" border="0" />][14]

The [Cireson SCSM Web Console][1] is a great addition to your Service Manager environment. It allows incidents to be updated quickly and easily from any device. I would highly recommend it.

[(E-Mail me)][15]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image_thumb_thumb_thumb" alt="image_thumb_thumb_thumb" src="http://fskelly.files.wordpress.com/2013/01/image_thumb_thumb_thumb_thumb.png" width="184" height="32" border="0" />][16]

<span style="font-size:small;font-family:calibri;">Follow me.</span>

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="facebook-small322252222" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" border="0" /></span>][17] Facebook (Personal)

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="twitter-small322252222" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" border="0" /></span>][18]Twitter (Personal & System Center)

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="scsmlogo252" alt="scsmlogo252" src="http://fskelly.files.wordpress.com/2013/01/scsmlogo252.jpg" width="56" height="43" border="0" />][19] Twitter (System Center Focused)

<span style="font-size:small;font-family:calibri;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" border="0" /></a></span>

 [1]: http://www.cireson.com/app-store/scsm-web-console/
 [2]: http://fskelly.files.wordpress.com/2013/01/image.png
 [3]: http://fskelly.files.wordpress.com/2013/01/image1.png
 [4]: http://www.microsoft.com/getsilverlight/Get-Started/Install/Default.aspx
 [5]: http://fskelly.files.wordpress.com/2013/01/image2.png
 [6]: http://fskelly.files.wordpress.com/2013/01/image3.png
 [7]: http://fskelly.files.wordpress.com/2013/01/image4.png
 [8]: http://fskelly.files.wordpress.com/2013/01/image5.png
 [9]: http://www.cireson.com/app-store/scsm-group-assign/
 [10]: http://fskelly.files.wordpress.com/2013/01/image6.png
 [11]: http://fskelly.files.wordpress.com/2013/01/image7.png
 [12]: http://fskelly.files.wordpress.com/2013/01/image8.png
 [13]: http://fskelly.files.wordpress.com/2013/01/image9.png
 [14]: http://fskelly.files.wordpress.com/2013/01/image10.png
 [15]: mailto:systemcenterguyza@live.com
 [16]: http://fskelly.files.wordpress.com/2013/01/image_thumb_thumb_thumb.png
 [17]: http://www.facebook.com/fletcher.kelly
 [18]: http://twitter.com/#!/fskelly
 [19]: http://twitter.com/syscenterguyza