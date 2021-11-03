---
title: Group assignment with Service Manager
author: fskelly
type: post
date: 2012-12-31T06:58:52+00:00
url: /2012/12/31/group-assignment-with-service-manager/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - System Center
tags:
  - Assigned to user
  - Assignment
  - SCSM
  - Service Manager
  - ServiceManager

---
<font size="2" face="Calibri">So one of the biggest issues I have with Service Manager is actually user based as seems to be quite difficult to teach the concept of this for some strange reason. So, as a work-around I have created views that cater for the issue I am about to discuss.</font>

<font size="2" face="Calibri">The issue is as follows, when a Work Item gets re-assigned to a new Analyst, 99% of the time, the associated Support <font style="background-color:#ffff00;">Group does NOT get changed.</font> Let’s take the following example.</font>

<font size="2" face="Calibri">An incident is logged and is automatically assigned to the “Service Desk” team, now an analysts investigates the incident and determines that the incident actually belongs to a member of the “Network Team”. So, typically, the “Assigned to” person is changed and the new analyst will get an e-mail stating that a call has been assigned to him/her. However, the incident now reflects the following</font>

<font style="background-color:#ffff00;" size="2" face="Calibri">Analyst : Network Analyst <img class="wlEmoticon wlEmoticon-thumbsup" style="border-style:none;" alt="Thumbs up" src="/wp-content/uploads/2012/12/wlemoticon-thumbsup.png" /></font>

<font style="background-color:#ffff00;" size="2" face="Calibri">Support Group : Service Desk <img class="wlEmoticon wlEmoticon-thumbsdown" style="border-style:none;" alt="Thumbs down" src="/wp-content/uploads/2012/12/wlemoticon-thumbsdown.png" /></font>

<font size="2" face="Calibri">So basically, if you were to have a queue or view that shows up all incidents assigned to the “Network Team”, this incident would not show up however the analyst has received and e-mail stating that an Incident has been assigned to him/her, it can of course be found by using “Assigned to Me” View.</font>

<font size="2" face="Calibri">There is a </font>[<font size="2" face="Calibri">solution</font>][1] <font size="2" face="Calibri">here. Enter </font>[<font size="2" face="Calibri">Cireson</font>][2] <font size="2" face="Calibri">and their fantastic applications for Service Manager. </font>[<font size="2" face="Calibri">SCSM Group Assign</font>][1] <font size="2" face="Calibri">allows the extended functionality of selecting the required Support Group and then NARROWS the list of Analysts to that specific group. This ensures that <font style="background-color:#ffff00;">BOTH</font> the <font style="background-color:#ffff00;">Support Group</font> and <font style="background-color:#ffff00;">Analyst</font> are changed at time of re-assignment, making the creation of views and </font>[<font size="2" face="Calibri">Queues</font>][3] <font size="2" face="Calibri">a lot simpler and then ensures that your views based on Support Group are 100% accurate. The </font>[<font size="2" face="Calibri">solution</font>][1] <font size="2" face="Calibri">extends the context pane and adds a “Assign Analyst by Group” option</font>

[<font size="2" face="Calibri"><img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2012/12/image_thumb25.png" width="266" height="395" /></font>][4]

<font size="2" face="Calibri">What </font>[<font size="2" face="Calibri">SCSM Group Assign</font>][1] <font size="2" face="Calibri">allows you to is the following (this is my test lab), you will however get the idea.</font>

<font size="2" face="Calibri">Below is a screenshot of the groups that I have created within Active Directory to “illustrate” my different Support Groups. You will see a few groups.</font>

<font size="2" face="Calibri">1. For all analysts</font>

<font size="2" face="Calibri">2. To represent different support Groups (I have called them Tier 1,2 and 3, as this is the vanilla experience with SCSM)</font>

[<font size="2" face="Calibri"><img loading="lazy" title="image015" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image015" src="/wp-content/uploads/2012/12/image015_thumb.png" width="648" height="345" /></font>][5]

<font size="2" face="Calibri">Ok, so below is a screenshot of a re-assignment using the new “Assign Analyst by Group” option. For this example I have used “Tier 1”. Note how the “Analyst” selection is limited to only 2 Analysts as per my groups earlier. Namely Analyst 1 and Analyst 2.</font>

[<font size="2" face="Calibri"><img loading="lazy" title="Tier1-group assign" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="Tier1-group assign" src="/wp-content/uploads/2012/12/tier1-group-assign_thumb.jpg" width="648" height="406" /></font>][6]

<font size="2" face="Calibri">The next screenshot depicts the same process only to “Tier 2” this time. This time the selection is limited to Analyst 3 and Analyst 4.</font>

[<font size="2" face="Calibri"><img loading="lazy" title="Tier2-group assign" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="Tier2-group assign" src="/wp-content/uploads/2012/12/tier2-group-assign_thumb.jpg" width="648" height="353" /></font>][7]

<font size="2" face="Calibri">The re-assignment is logged in Service Manager in the exact same way as any analyst assignment. This is an extension of the capabilities of Service Manager.</font>

<font size="2" face="Calibri">I would highly recommend </font>[<font size="2" face="Calibri">SCSM Group Assign</font>][1] <font size="2" face="Calibri">for any Service Manager installation.</font>

[<img loading="lazy" title="scsmlogo25" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="scsmlogo25" src="/wp-content/uploads/2012/12/scsmlogo25.jpg" width="62" height="48" />][8]

[<img loading="lazy" title="image_thumb_thumb" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image_thumb_thumb" src="/wp-content/uploads/2012/12/image_thumb_thumb_thumb.png" width="184" height="32" />][9]

<span style="font-size:small;font-family:calibri;">Follow me.</span>

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></span>][10][<span style="font-size:small;font-family:calibri;"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></span>][11]

<span style="font-size:small;font-family:calibri;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></span>

 [1]: http://www.cireson.com/app-store/scsm-group-assign/
 [2]: http://www.cireson.com
 [3]: http://technet.microsoft.com/en-us/library/ff461077.aspx
 [4]: /wp-content/uploads/2012/12/image23.png
 [5]: /wp-content/uploads/2012/12/image015.png
 [6]: /wp-content/uploads/2012/12/tier1-group-assign.jpg
 [7]: /wp-content/uploads/2012/12/tier2-group-assign.jpg
 [8]: http://twitter.com/syscenterguyza
 [9]: /wp-content/uploads/2012/12/image_thumb_thumb2.png
 [10]: http://www.facebook.com/fletcher.kelly
 [11]: http://twitter.com/#!/fskelly