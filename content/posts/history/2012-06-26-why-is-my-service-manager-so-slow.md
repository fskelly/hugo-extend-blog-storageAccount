---
title: Why is my Service Manager so slow?
author: fskelly
type: post
date: 2012-06-26T07:16:36+00:00
url: /2012/06/26/why-is-my-service-manager-so-slow/
tagazine-media:
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:4:{s:70:"http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg";a:6:{s:8:"file_url";s:70:"http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:69:"http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg";a:6:{s:8:"file_url";s:69:"http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:84:"http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg";a:6:{s:8:"file_url";s:84:"http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg";s:5:"width";s:3:"244";s:6:"height";s:2:"99";s:4:"type";s:5:"image";s:4:"area";s:5:"24156";s:9:"file_path";s:0:"";}s:90:"http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg";a:6:{s:8:"file_url";s:90:"http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg";s:5:"width";s:3:"244";s:6:"height";s:2:"99";s:4:"type";s:5:"image";s:4:"area";s:5:"24156";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"4";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2012-06-26 07:16:37";}'
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:4:{s:70:"http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg";a:6:{s:8:"file_url";s:70:"http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:69:"http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg";a:6:{s:8:"file_url";s:69:"http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:84:"http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg";a:6:{s:8:"file_url";s:84:"http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg";s:5:"width";s:3:"244";s:6:"height";s:2:"99";s:4:"type";s:5:"image";s:4:"area";s:5:"24156";s:9:"file_path";s:0:"";}s:90:"http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg";a:6:{s:8:"file_url";s:90:"http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg";s:5:"width";s:3:"244";s:6:"height";s:2:"99";s:4:"type";s:5:"image";s:4:"area";s:5:"24156";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"4";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2012-06-26 07:16:37";}'
categories:
  - Management Server
  - System Center
tags:
  - Console
  - database
  - performance
  - Service Manager
  - ServiceManager
  - Troubleshooting

---
<font face="Calibri">So, I have been running Service Manager for quite some time now. From SCSM 2010 to SCSM SP1 and most of the CU’s before I upgraded to SCSM 2012 Beta and RC and then to RTM (with the help of a Microsoft TAP Program). Service Manager is now quite entrenched in our business and has been running quite well for a very long time. However, a little while ago we began to experience performance issues with the Console and the logging of calls and the application of Workflows. </font> 

<font face="Calibri">Time for some investigation. </font> 

<font face="Calibri">There was a general slowdown with everything and business was not happy with this. So let the troubleshooting begin. Since there is a SQL back-end, I decided that this was a good place to start. </font> 

<font face="Calibri">I was running a sp_who2 on my SQL server and I was seeing a lot of &#8220;blocking&#8221; happening. There will some “blocking” for a very short while, while the ServiceManager database is updated. However, I was seeing “blocking” SPID’s consuming processor time for several minutes and this is NOT normal at all. </font> 

<font face="Calibri">As a result of this, my workflows were not kicking off properly and a few other issues including the slow pickup of e-mailed in incidents from SMTP “Drop Folder” and extremely slow response when assigning incidents to new people/tiers to name but a few. In general, Service Manager was SLOW!!!! </font> 

<font face="Calibri">After much troubleshooting and some help from MS. It was determined to be a corrupt workflow, what had actually happened to me, is that my MP containing my Workflow was corrupted. </font> 

<font face="Calibri">So, I stopped the &#8220;Health Service&#8221;, disabled all the workflows and slowly started re-enabling workflows and then starting the &#8220;Health Service&#8221; again and slowly started testing like that and I was able to determine that any workflow or template within a set MP was causing the SQL Blocking. As a result, I re-created the workflows and Templates from scratch and now I have no issues at all. </font> 

<font face="Calibri">Slow and painful, but well worth it now.</font>

<font size="2" face="Calibri">Follow me.</font> 

[<font size="2" face="Calibri"><img loading="lazy" title="facebook-small322252222" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;margin:0;border-left:0;display:inline;padding-right:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></font>][1] <font size="2" face="Calibri"></font>[<font size="2" face="Calibri"><img loading="lazy" title="twitter-small322252222" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;margin:0;border-left:0;display:inline;padding-right:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></font>][2]

<font size="2" face="Calibri"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></font></p>

 [1]: http://www.facebook.com/fletcher.kelly
 [2]: http://twitter.com/#!/fskelly