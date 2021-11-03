---
title: Exchange Connector – SCSM 2012
author: fskelly
type: post
date: 2012-09-19T07:13:10+00:00
url: /2012/09/19/exchange-connector-scsm-2012/
categories:
  - Service Manager
tags:
  - Exchange connector
  - SCSM
  - SCSM 2012
  - SMTP

---
<font face="Calibri">So, I decided to extend the functionality of Service Manager even more with the </font>[<font face="Calibri">Exchange Connector</font>][1]<font face="Calibri">. If you follow the guide it is nice and easy to install. The configuration is quite simply as well, </font>[<font face="Calibri">here</font>][2] <font face="Calibri">is a link which gives the configuration in some detail to make you life a little. </font>

<font face="Calibri">Once the connector is installed is when I found a little “gotcha” if you will. With the connector, it updates any incident with the same template, which can cause issues and potentially change your Priority and Urgency which can lead to some skewed reporting. So I asked this </font>[<font face="Calibri">question</font>][3] <font face="Calibri">on the forums and </font>[<font face="Calibri">Andreas</font>][4] <font face="Calibri">came up with a clever solution. The use of an “empty template”. I have since implemented this and it works well. The “Empty Template” does not modify any of your Tiers, Classifications or Impact or Urgency or any such settings. By doing this it allows me to use only the core functionality as I want to.</font>

<font face="Calibri">I was primarily interested in “First Response”, “Resolution”, “Updating” and closure of incidents and service requests. This solutions works VERY well for me and I would highly recommend this solution.</font>

[<font face="Calibri"><img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="http://fskelly.files.wordpress.com/2012/09/image_thumb.png" width="569" height="300" /></font>][5]

<font face="Calibri">One last gotcha, if you want to modify the details on the connector from a console not on the server, remember to copy the dll’s used in the installation to the machine hosting the console.</font>

<font face="Calibri">Hope this helps,</font>

<font size="2" face="Calibri">Follow me.</font>

[<font size="2" face="Calibri"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></font>][6] <font size="2" face="Calibri"></font>[<font size="2" face="Calibri"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></font>][7]

<font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></font></p>

 [1]: http://blogs.technet.com/b/servicemanager/archive/2012/04/15/exchange-connector-3-0-rc-released.aspx
 [2]: http://www.msexchange.org/articles_tutorials/exchange-server-2010/monitoring-operations/configuring-exchange-connector-service-manager-2012.html
 [3]: http://social.technet.microsoft.com/Forums/en/systemcenterservicemanager/thread/b72abc57-b14f-458a-bfe6-f6ad049da9a7
 [4]: http://social.technet.microsoft.com/profile/andreas%20baumgarten/?ws=usercard-mini
 [5]: http://fskelly.files.wordpress.com/2012/09/image.png
 [6]: http://www.facebook.com/fletcher.kelly
 [7]: http://twitter.com/#!/fskelly