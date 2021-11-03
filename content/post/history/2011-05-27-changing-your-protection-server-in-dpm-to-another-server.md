---
title: Changing your Protection Server in DPM to another server
author: fskelly
type: post
date: 2011-05-27T09:17:03+00:00
url: /2011/05/27/changing-your-protection-server-in-dpm-to-another-server/
tagazine-media:
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:2:{s:62:"http://fskelly.files.wordpress.com/2011/05/facebook-small3.jpg";a:6:{s:8:"file_url";s:62:"http://fskelly.files.wordpress.com/2011/05/facebook-small3.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:61:"http://fskelly.files.wordpress.com/2011/05/twitter-small3.jpg";a:6:{s:8:"file_url";s:61:"http://fskelly.files.wordpress.com/2011/05/twitter-small3.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"2";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-05-27 09:17:03";}'
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:2:{s:62:"http://fskelly.files.wordpress.com/2011/05/facebook-small3.jpg";a:6:{s:8:"file_url";s:62:"http://fskelly.files.wordpress.com/2011/05/facebook-small3.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:61:"http://fskelly.files.wordpress.com/2011/05/twitter-small3.jpg";a:6:{s:8:"file_url";s:61:"http://fskelly.files.wordpress.com/2011/05/twitter-small3.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"2";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-05-27 09:17:03";}'
categories:
  - Technology
tags:
  - Data Prtoection Manager
  - DPM
  - powershell
  - System Centre

---
Have you ever been in a situation where you have either removed or added a new DPM server to your environment?

It happened to me just the other day, I had to “re-think” my DPM design and starting using “Local” to each Data Centre DPM servers to backup my data at each Data Centre. However, this was not the case before this, we were using the same product, but a different strategy. Now I had DPM agents in both datacentres connecting to DPM servers not in the same Data Centre. For Example, I had Server A (Data Centre 1) with a DPM agent from my secondary DPM Server (Data Centre 2) protecting it. So, I went searching and found my answer and it turned out to be amazingly simple thanks to POWERSHELL. DPM has a POWERSHELL management shell (thank goodness) and some built-in scripts for just this (truly amazing). Within 10 minutes I had changed my DPM agents to report to the DPM Servers and began creating protection as needed like [SharePoint (see previous post)][1].

To be safe, these are the steps I followed.

1. Remove old agent

2. Install new agent using CMD prompt

3. Ran attach-productionserver.ps1 to re-allocate to new server.

All steps are nicely listed on [Microsoft Technet][2]

This was really easy and well worth the investment in time.

On a side, was also made aware of a [DPM Hotfix Rollup Package][3]

&#160;

Hopefully this helps someone else as well.

&#160;

Follow me

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;margin:0;" title="facebook-small3" border="0" alt="facebook-small3" src="http://fskelly.files.wordpress.com/2011/05/facebook-small3.jpg" width="44" height="44" />][4]&#160;[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="twitter-small3" border="0" alt="twitter-small3" src="http://fskelly.files.wordpress.com/2011/05/twitter-small3.jpg" width="44" height="44" />][5]

 [1]: http://fskelly.wordpress.com/2011/05/24/to-protect-or-not-to-protect/
 [2]: http://technet.microsoft.com/en-us/library/bb870935.aspx
 [3]: http://support.microsoft.com/default.aspx?scid=kb;en-US;2465832
 [4]: http://www.facebook.com/fletcher.kelly
 [5]: http://twitter.com/#!/fskelly