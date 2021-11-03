---
title: Building more redundancy and replicating folder structure
author: fskelly
type: post
date: 2011-07-07T06:15:39+00:00
url: /2011/07/07/building-more-redundancy-and-replicating-folder-structure/
tagazine-media:
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:2:{s:65:"http://fskelly.files.wordpress.com/2011/07/facebook-small3222.jpg";a:6:{s:8:"file_url";s:65:"http://fskelly.files.wordpress.com/2011/07/facebook-small3222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:64:"http://fskelly.files.wordpress.com/2011/07/twitter-small3222.jpg";a:6:{s:8:"file_url";s:64:"http://fskelly.files.wordpress.com/2011/07/twitter-small3222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"2";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-07-07 06:15:39";}'
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:2:{s:65:"http://fskelly.files.wordpress.com/2011/07/facebook-small3222.jpg";a:6:{s:8:"file_url";s:65:"http://fskelly.files.wordpress.com/2011/07/facebook-small3222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:64:"http://fskelly.files.wordpress.com/2011/07/twitter-small3222.jpg";a:6:{s:8:"file_url";s:64:"http://fskelly.files.wordpress.com/2011/07/twitter-small3222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"2";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-07-07 06:15:39";}'
categories:
  - Technology
tags:
  - Create
  - DFS
  - Distributed File System
  - Folder Structure
  - powershell
  - Replicate

---
We have had a few failures of the power kind (thanks to the electricity provider in South Africa, who will remain nameless). So we have now had to build in further redundancy to cater for this and for other business needs. There is nothing worse than getting a phone call saying that critical services are unavailable at a CRITICAL time. What a nightmare. So a few plans were set in motion.

FINALLY, I got my request for DFS approved. YAY!!!!

So, the process started. [Installing][1] DFS for Windows Server 2008 R2 is really simple and was completed in a couple of minutes, however the fun starts after the install and with the configuration of the replicated folders. The above link covers all aspects of the install and “sub” installs and procedures like configuring a namespace and replicated folders. 

There is just one little “gotcha” I came across, when I tried to create the first replicated folder, I configured the replication pair with the “root” folder. When I was running through the wizard I got an error when trying to replicate security permissions. The mistake I was making was to include the “root” folder. Do NOT do this. The solution is simple, create the root DFS namespace and create separate replicated folder pairs for each sub folder and then wait for the replication to occur. Awesome!!!!!!

&#160;

So now, for additional redundancy. we have another 3rd party application which handles printing and we need to keep an empty “folder structure” for this somewhere safe in case of a DR situation. This is a requirement placed on us by the Vendor. So, I like powershell, so I decided to create a powershell script to do this for me and, of course, the reverse of creating the “folder structure”. Scripts are below.

&#160;

> <font>Create-FolderStructure.ps1</font>
> 
> #Create an array with folder objects  
> $dirs = get-childitem -Recurse | Where {$_.psIsContainer -eq $true}  
> &#160;  
> #get folder full names  
> $dirs | select fullname&#160; | out-file
> 
> &#160;

So, now you have the folder structure, Great!!!!

However now you need to re-create the folder structure. What now?

Of course, I have created a scriptt for that.

> <font>Create-Folders.ps1</font>
> 
> $dirs = Get-Content –Path <path of file from previous script>
> 
> foreach ($dir in $dirs)  
> {  
> &#160;&#160;&#160; New-Item -Path $dir -ItemType Directory
> 
> }

Hope this helps,

Follow me

[<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;margin:0;" title="facebook-small3222" border="0" alt="facebook-small3222" src="http://fskelly.files.wordpress.com/2011/07/facebook-small3222.jpg" width="44" height="44" />][2] [<img loading="lazy" style="background-image:none;border-bottom:0;border-left:0;padding-left:0;padding-right:0;display:inline;border-top:0;border-right:0;padding-top:0;" title="twitter-small3222" border="0" alt="twitter-small3222" src="http://fskelly.files.wordpress.com/2011/07/twitter-small3222.jpg" width="44" height="44" />][3]

 [1]: http://technet.microsoft.com/en-us/library/cc732863(WS.10).aspx
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly