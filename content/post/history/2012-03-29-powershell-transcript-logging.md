---
title: Powershell Transcript logging
author: fskelly
type: post
date: 2012-03-29T07:20:47+00:00
url: /2012/03/29/powershell-transcript-logging/
publicize_results:
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"185265231948283904";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150760618817394";}}}'
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"185265231948283904";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150760618817394";}}}'
categories:
  - PowerShell
tags:
  - profile
  - transcript

---
> 
&#160;

I have recently started keeping a track of all my PowerShell.

Just a nice simple update.

So, I decided to create a “simple” PowerShell script that would keep a track of all my transcripts. The script would create a file name based on date and place the transcript file in a folder of your choice, this is hard-coded in the script and can be easily modified.

Hope you like it and find it useful.

> <font>$date =Get-Date <br />$filepath = "C:\PSTranscripts" <br />$hour = ($date.Hour).tostring() <br />$minute = $date.Minute <br />$file = $hour + "H" + $minute + "M" +&#160; ".txt" <br />$newpath = $filepath + "\" + $date.Day + "-" + $date.Month +"-" + $date.year <br />$fullpath = $filepath + "\" + $date.Day + "-" + $date.Month +"-" + $date.year +"\" + $file <br />New-Item -ItemType Directory -Path $newpath -ErrorAction SilentlyContinue <br />Start-Transcript -Path $fullpath</font>

<font><font>I had this as part of my admin PowerShell Profile, more info on the PowerShell </font></font><font>Profile <a href="http://technet.microsoft.com/en-us/library/ee692764.aspx">here</a></font>

I am using the script above as .ps1 script for my day to day account.

Follow me

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;margin:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="facebook-small32225222" border="0" alt="facebook-small32225222" src="http://fskelly.files.wordpress.com/2012/03/facebook-small32225222.jpg" width="44" height="44" />][1] [<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;margin:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="twitter-small32225222" border="0" alt="twitter-small32225222" src="http://fskelly.files.wordpress.com/2012/03/twitter-small32225222.jpg" width="44" height="44" />][2]

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/03/mcc11_logo_horizontal_2-color_thumb__thumb.jpg" width="244" height="99" />][3]

 [1]: http://www.facebook.com/fletcher.kelly
 [2]: http://twitter.com/#!/fskelly
 [3]: http://fskelly.files.wordpress.com/2012/03/mcc11_logo_horizontal_2-color_thumb_.jpg