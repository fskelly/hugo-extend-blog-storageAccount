---
title: Cubes Missing from Data Warehouse and throwing error from within the SCSM Console
author: fskelly
type: post
date: 2013-02-27T13:08:39+00:00
url: /2013/02/27/cubes-missing-from-data-warehouse-and-throwing-error-from-within-the-scsm-console/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - Service Manager
tags:
  - Cubes
  - Data Warehouse
  - Deployment
  - DWH
  - Processing

---
So, just the other day I opened the SCSM console to look at the cubes and process as needed, since some new reports needed to be built and Excel spread sheets created by our BI person for business. So, I start to process the cubes and the first cube starts processing without issue. However when I attempt to process the second cube (Change and Activity Management cube). It presented an error stating that <font style="background-color:#ffff00;">"Could not find any resources appropriate for the specified culture or the neutral culture".</font>

<font style="background-color:#ffffff;">I have never seen an error like this before, so it was time to do some investigating.</font>

I started by looking at the Data Warehouse Wunderbar and more specifically the “Data Warehouse Jobs” tab. I noticed that all the Cubes which were giving me said error where missing from the “Data Warehouse Jobs” tab.

I then remembered about a Patch Window that occurred while I was on leave and decided to look further. I was digging through the Event Logs, when I found the following error

Event id: 33410

Source : Deployment

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/02/image_thumb4.png" width="648" height="331" />][1]

And as you can see from the screenshot, there are plenty of these. Clearly the patching window had interrupted a job. So now with at least something to work with, I started looking around some more and remembered that the MPSyncJOB is responsible for Management Pack Synchronization and upon opening the status of this job, I saw that the Management Packs related to the now problematic cubes were [**_<font style="background-color:#ffff00;">disassociated</font>_**][2]. 

So, from here it was time to check and start putting the pieces of the puzzle together. Upon opening the “Management Pack” section of the “Data Warehouse” Wunderbar, I could see that the deployment of these Management Packs had failed.

[<img loading="lazy" title="SNAGHTML53c4c56" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="SNAGHTML53c4c56" src="/wp-content/uploads/2013/02/snaghtml53c4c56_thumb.png" width="648" height="353" />][3]

So, the next step is to “Restart Deployment”

[<img loading="lazy" title="SNAGHTML54834f0[4]" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="SNAGHTML54834f0[4]" src="/wp-content/uploads/2013/02/snaghtml54834f04_thumb.png" width="648" height="353" />][4]

With mine, nothing happened and I found the following error

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/02/image_thumb5.png" width="648" height="332" />][5]

Fortunately enough the solution is listed within the error message.

Simple, delete the cube and then re-deploy the Management Pack.

1. Open SQL Management Studio on server hosting the SQL Analysis Services

2. Connect to the server type : Analysis Services

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/02/image_thumb6.png" width="456" height="322" />][6]

3. Expand Databases, expand DWASDataBase, Expand Cubes

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/02/image_thumb7-1.png" width="443" height="468" />][7]

4. Select cube from error and delete the Cube.

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/02/image_thumb8-1.png" width="438" height="449" />][8]

The deletion of the cube can take some time. Once Deleted, go back to the Console and “Restart Deployment”

[<img loading="lazy" title="SNAGHTML552e490" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="SNAGHTML552e490" src="/wp-content/uploads/2013/02/snaghtml552e490_thumb.png" width="603" height="328" />][9]

This time you will see an Event log like this.

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/02/image_thumb9.png" width="629" height="322" />][10]

The Cube is now re-deploying.

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/02/image_thumb10.png" width="648" height="331" />][11]

You can now process your cubes as normal without any errors

[(E-Mail me)][12]

[<img loading="lazy" title="image_thumb_thumb_thumb_thumb_thumb" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image_thumb_thumb_thumb_thumb_thumb" src="http://fskelly.files.wordpress.com/2013/02/image_thumb_thumb_thumb_thumb_thumb_thumb.png" width="184" height="32" />][13]

<span style="font-size:small;font-family:calibri;">Follow me.</span>

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></span>][14] Facebook (Personal)

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></span>][15]Twitter (Personal & System Center)

[<img loading="lazy" title="scsmlogo25232" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="scsmlogo25232" src="/wp-content/uploads/2013/02/scsmlogo25232.jpg" width="56" height="43" />][16] Twitter (System Center Focused)

<span style="font-size:small;font-family:calibri;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></span>

 [1]: /wp-content/uploads/2013/02/image4-1.png
 [2]: http://www.google.com/search?hl=en&rls=com.microsoft:en-ZA:IE-Address&q=disassociated&spell=1&sa=X&ei=M_ktUev6L4rYtAav8ICQCA&ved=0CC4QvwUoAA
 [3]: /wp-content/uploads/2013/02/snaghtml53c4c56.png
 [4]: http://fskelly.files.wordpress.com/2013/02/snaghtml54834f04.png
 [5]: http://fskelly.files.wordpress.com/2013/02/image5.png
 [6]: /wp-content/uploads/2013/02/image6.png
 [7]: /wp-content/uploads/2013/02/image7.png
 [8]: /wp-content/uploads/2013/02/image8-1.png
 [9]: /wp-content/uploads/2013/02/snaghtml552e490-1.png
 [10]: /wp-content/uploads/2013/02/image9.png
 [11]: /wp-content/uploads/2013/02/image10.png
 [12]: mailto:systemcenterguyza@live.com
 [13]: /wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png
 [14]: http://www.facebook.com/fletcher.kelly
 [15]: http://twitter.com/#!/fskelly
 [16]: http://twitter.com/syscenterguyza