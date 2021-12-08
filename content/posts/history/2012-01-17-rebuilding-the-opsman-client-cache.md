---
title: Rebuilding the OpsMan Client Cache
author: fskelly
type: post
date: 2012-01-17T07:16:27+00:00
url: /2012/01/17/rebuilding-the-opsman-client-cache/
publicize_results:
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"159172216993488896";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150595301347394";}}}'
  - 'a:2:{s:7:"twitter";a:1:{i:48280398;a:2:{s:7:"user_id";s:7:"fskelly";s:7:"post_id";s:18:"159172216993488896";}}s:2:"fb";a:1:{i:743307393;a:2:{s:7:"user_id";s:9:"743307393";s:7:"post_id";s:17:"10150595301347394";}}}'
categories:
  - Operations Manager
tags:
  - cache
  - Operatona Manager
  - OpsMan
  - powershell

---
&#160;

Just recently I had the need to “rebuild” the client cache on a lot of my servers, due to a slight hiccup with our Network and subsequently our Operations Manager Server. So I decided to use PowerShell, if you need to repeat it, script it.

So, I simply built a script to connect to the required machine, stop the “Health Service”, delete the files from the required folder and then restart the “Health Service”. I know it is not spectacular but it is AMAZINGLY helpful.

The script is on the [TechNet Gallery][1]

&#160;

More to come soon,

Follow me

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="facebook-small3222522" border="0" alt="facebook-small3222522" src="http://fskelly.files.wordpress.com/2012/01/facebook-small3222522.jpg" width="44" height="44" />][2] [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="twitter-small3222522" border="0" alt="twitter-small3222522" src="http://fskelly.files.wordpress.com/2012/01/twitter-small3222522.jpg" width="44" height="44" />][3]

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/01/mcc11_logo_horizontal_2-color_thumb__thumb.jpg" width="244" height="99" />][4]

 [1]: http://gallery.technet.microsoft.com/Rebuild-OpsMan-Client-b558dd8a
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly
 [4]: http://fskelly.files.wordpress.com/2012/01/mcc11_logo_horizontal_2-color_thumb_.jpg