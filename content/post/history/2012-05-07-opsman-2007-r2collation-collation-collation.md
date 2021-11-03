---
title: OpsMan 2007 R2–Collation, Collation, Collation!!!!!!
author: fskelly
type: post
date: 2012-05-07T11:44:25+00:00
url: /2012/05/07/opsman-2007-r2collation-collation-collation/
publicize_results:
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"199469117475008513";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150902769322394";}}}'
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"199469117475008513";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150902769322394";}}}'
categories:
  - Operations Manager
tags:
  - Collation
  - OperationsManagerDB
  - OperationsManagerDW
  - OpsMan
  - Reporting Services
  - SQL

---
<span style="color:#000000;font-family:Calibri;font-size:small;">So, recently I decided to take the plunge and upgrade to SCOM 2012. So, there were a few pre-requisites that I needed as per the prereq checker that is built into OpsMan 2012.</span>

<span style="color:#000000;font-family:Calibri;font-size:small;">The “big ones” were as follows.</span>

> <span style="color:#000000;font-family:Calibri;font-size:small;">1. OpsMan 2007 R2 CU5</span>
> 
> <span style="color:#000000;font-family:Calibri;font-size:small;">2. And FTS (Full Text Search) for SQL.</span>

<span style="color:#000000;font-family:Calibri;font-size:small;">So, these seem easy enough to fix.</span>

> <span style="color:#777777;"><span style="font-family:Calibri;"><span style="font-size:small;"><span style="color:#000000;">1. Simple download</span> </span></span><a href="http://support.microsoft.com/kb/2495674"><span style="font-family:Calibri;font-size:small;">Cumulative Update 5 for System Center Operations Manager 2007 R2</span></a><span style="font-family:Calibri;"><span style="font-size:small;"> <span style="color:#000000;">and install. To be honest, I found </span></span></span><a href="http://blogs.technet.com/b/kevinholman/archive/2011/08/03/opsmgr-2007-r2-cu5-rollup-hotfix-ships-and-my-experience-installing-it.aspx"><span style="font-family:Calibri;font-size:small;">this article</span></a><span style="font-family:Calibri;font-size:small;"> <span style="color:#000000;">super helpful for the installation of this Cumulative Update, nice and easy to follow. Kudos to</span> </span><a href="http://blogs.technet.com/b/kevinholman/"><span style="font-family:Calibri;font-size:small;">Kevin Holman</span></a><span style="font-family:Calibri;font-size:small;">. </span></span><span style="color:#000000;font-family:Calibri;font-size:small;">So after running through the process step by step, I found that the build number had NOT increased to 6.1.7221.81. Very strange indeed. This needed some more investigation, but more on that just now.</span>
> 
> <span style="color:#000000;font-family:Calibri;font-size:small;">2. Simple go and add this feature to your SQL instance, not very difficult to, so I simply walk through the wizard and add the feature.</span>

<span style="color:#000000;font-family:Calibri;font-size:small;">So, now time to run the Pre-Req checker again, and what do you know the Cumulative Update 5 is NO LONGER showing (but remember the build version in the console is NOT reflecting the correct build number. Also, the FTS (Full Text Search) requirement is still there and I am have installed the FTS feature.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" src="http://fskelly.files.wordpress.com/2012/05/image_thumb.png" alt="image" width="382" height="176" border="0" /></span>][1]

<span style="font-family:Calibri;font-size:small;">However as you can see below.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="clip_image002" src="http://fskelly.files.wordpress.com/2012/05/clip_image002_thumb.jpg" alt="clip_image002" width="381" height="109" border="0" /></span>][2]

<span style="font-family:Calibri;font-size:small;">Very strange indeed, so like I said some further investigation is required.</span>

<span style="font-family:Calibri;font-size:small;">I remember being at some Microsoft IT Bootcamps, and the continued emphasis on SQL Collation and OpsMan in general. So I decided to check this. My Version below.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="clip_image002[4]" src="http://fskelly.files.wordpress.com/2012/05/clip_image0024_thumb.jpg" alt="clip_image002[4]" width="319" height="24" border="0" /></span>][3]

<span style="font-family:Calibri;font-size:small;">As per </span>[<span style="font-family:Calibri;font-size:small;">this TechNet Article</span>][4]<span style="font-family:Calibri;font-size:small;">, the only supported collation for English is SQL_Latin1_General_CP1_CI_AS. Oh oops!</span>

<span style="font-family:Calibri;font-size:small;">Never fear though, his can be fixed, however the articles must be followed very carefully and within a reasonable amount of time as while you are doing this whole process, your OperationsManager and OperationsManagerDW databases will not be collecting all of the information all of the time. So, there WILL be some (very minimal) data loss in terms of agents reporting into the Management Group.</span>

<span style="font-family:Calibri;font-size:small;">All the articles are TechNet Articles, see below.</span>

[<span style="font-family:Calibri;font-size:small;">How to Move the OperationsManager Database in Operations Manager 2007</span>][5]

[<span style="font-family:Calibri;font-size:small;">How to Move the OperationsManagerDW Database in Operations Manager 2007</span>][6]

[<span style="font-family:Calibri;font-size:small;">How to Move the Operations Manager Reporting Server in Operations Manager 2007</span>][7]

<span style="font-family:Calibri;font-size:small;">Once, I had made my way through all the articles, I tried my original steps again and this time, without any issues, I was able to install </span>[<span style="font-family:Calibri;font-size:small;">Cumulative Update 5 for System Center Operations Manager 2007 R2</span>][8] <span style="font-family:Calibri;font-size:small;">and successfully able to get the pre-req checker to list all pre-reqs met. </span>

<span style="font-family:Calibri;font-size:small;">Follow me.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border:0;" title="facebook-small322252" src="http://fskelly.files.wordpress.com/2012/05/facebook-small322252.jpg" alt="facebook-small322252" width="44" height="44" border="0" /></span>][9][<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border:0;" title="twitter-small322252" src="http://fskelly.files.wordpress.com/2012/05/twitter-small322252.jpg" alt="twitter-small322252" width="44" height="44" border="0" /></span>][10]

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border:0;" title="MCC11_Logo_Horizontal_2-color_thumb" src="http://fskelly.files.wordpress.com/2012/05/mcc11_logo_horizontal_2-color_thumb_thumb.jpg" alt="MCC11_Logo_Horizontal_2-color_thumb" width="244" height="99" border="0" /></span>][11]

 [1]: http://fskelly.files.wordpress.com/2012/05/image.png
 [2]: http://fskelly.files.wordpress.com/2012/05/clip_image002.jpg
 [3]: http://fskelly.files.wordpress.com/2012/05/clip_image0024.jpg
 [4]: http://technet.microsoft.com/en-us/library/hh205986.aspx
 [5]: http://technet.microsoft.com/en-us/library/cc540384.aspx
 [6]: http://technet.microsoft.com/en-us/library/cc540368.aspx
 [7]: http://technet.microsoft.com/en-us/library/cc540369.aspx
 [8]: http://support.microsoft.com/kb/2495674
 [9]: http://www.facebook.com/fletcher.kelly
 [10]: http://twitter.com/#!/fskelly
 [11]: http://fskelly.files.wordpress.com/2012/05/mcc11_logo_horizontal_2-color_thumb.jpg