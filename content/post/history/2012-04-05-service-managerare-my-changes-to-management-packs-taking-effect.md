---
title: Service Manager–Are my changes to management packs taking effect?
author: fskelly
type: post
date: 2012-04-05T08:17:01+00:00
url: /2012/04/05/service-managerare-my-changes-to-management-packs-taking-effect/
publicize_results:
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"187816138057588736";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150775471262394";}}}'
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"187816138057588736";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150775471262394";}}}'
categories:
  - Uncategorized

---
&#160;

Okay,

So now onto some “basics” or nice to know about Service Manager.

Some of these I have learnt the hard way and some have been given to me as valuable information to avoid some mishaps if you will.

> 1. Management Packs, so just about everything you do with Service Manager involves the modification of the Management Pack that the item is contained in. For example, you create a workflow and you then modify the “Enabled” value of the workflow to enabled/disabled in the console. How do you know for certain that the workflow or just about anything you modified has taken effect. 
> 
> Simple, the event log is your friend and the Event IDs to look out for are the following.
> 
> Event ID:1201
> 
> This indicates that a change has been made.
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" border="0" alt="image" src="http://fskelly.files.wordpress.com/2012/04/image_thumb.png" width="857" height="50" />][1]
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" border="0" alt="image" src="http://fskelly.files.wordpress.com/2012/04/image_thumb1.png" width="674" height="542" />][2]
> 
> Event ID: 1210
> 
> This indicates that the change is now in effect.
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" border="0" alt="image" src="http://fskelly.files.wordpress.com/2012/04/image_thumb2.png" width="858" height="50" />][3]
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" border="0" alt="image" src="http://fskelly.files.wordpress.com/2012/04/image_thumb3.png" width="656" height="460" />][4]

&#160;

So, if you are not seeing these 2 Event IDs some more investigation is needed.

Hope this helps,

Follow me

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;margin:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="facebook-small3222522222" border="0" alt="facebook-small3222522222" src="http://fskelly.files.wordpress.com/2012/04/facebook-small3222522222.jpg" width="44" height="44" />][5] [<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;margin:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="twitter-small3222522222" border="0" alt="twitter-small3222522222" src="http://fskelly.files.wordpress.com/2012/04/twitter-small3222522222.jpg" width="44" height="44" />][6]

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;margin:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="MCC11_Logo_Horizontal_2-color_thumb_[2]" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_[2]" src="http://fskelly.files.wordpress.com/2012/04/mcc11_logo_horizontal_2-color_thumb_2_thumb.jpg" width="244" height="99" />][7]

 [1]: http://fskelly.files.wordpress.com/2012/04/image.png
 [2]: http://fskelly.files.wordpress.com/2012/04/image1.png
 [3]: http://fskelly.files.wordpress.com/2012/04/image2.png
 [4]: http://fskelly.files.wordpress.com/2012/04/image3.png
 [5]: http://www.facebook.com/fletcher.kelly
 [6]: http://twitter.com/#!/fskelly
 [7]: http://fskelly.files.wordpress.com/2012/04/mcc11_logo_horizontal_2-color_thumb_2.jpg