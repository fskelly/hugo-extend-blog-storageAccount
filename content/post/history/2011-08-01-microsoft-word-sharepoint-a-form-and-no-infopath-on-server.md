---
title: Microsoft Word, SharePoint, a Form and NO InfoPath on Server
author: fskelly
type: post
date: 2011-08-01T13:33:20+00:00
url: /2011/08/01/microsoft-word-sharepoint-a-form-and-no-infopath-on-server/
tagazine-media:
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:3:{s:66:"http://fskelly.files.wordpress.com/2011/08/wlemoticon-sadsmile.png";a:6:{s:8:"file_url";s:66:"http://fskelly.files.wordpress.com/2011/08/wlemoticon-sadsmile.png";s:5:"width";s:2:"19";s:6:"height";s:2:"19";s:4:"type";s:5:"image";s:4:"area";s:3:"361";s:9:"file_path";s:0:"";}s:66:"http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg";a:6:{s:8:"file_url";s:66:"http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:65:"http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg";a:6:{s:8:"file_url";s:65:"http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"3";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-08-01 13:33:20";}'
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:3:{s:66:"http://fskelly.files.wordpress.com/2011/08/wlemoticon-sadsmile.png";a:6:{s:8:"file_url";s:66:"http://fskelly.files.wordpress.com/2011/08/wlemoticon-sadsmile.png";s:5:"width";s:2:"19";s:6:"height";s:2:"19";s:4:"type";s:5:"image";s:4:"area";s:3:"361";s:9:"file_path";s:0:"";}s:66:"http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg";a:6:{s:8:"file_url";s:66:"http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:65:"http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg";a:6:{s:8:"file_url";s:65:"http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"3";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-08-01 13:33:20";}'
categories:
  - Technology
tags:
  - InfoPath
  - Microsoft
  - Sharepoint
  - Submit
  - VBA
  - Word

---
&#160;

So, just recently I was asked to work yet another miracle.

The Scope.

1. We need to go paperless.

2. We need to move a certain form to an online platform and make it easy for users to fill in. With a custom picture and add checkboxes on top of that.

3. We need this information to be saved onto a SharePoint site with unique filenames.

4. We need this to be simply and NOT require a user to use the traditional “Save As” or “Save to SharePoint”

So away I went and started to think. A few glitches, Point #2, a picture as in the background with control boxes over it. Um……

So, I managed to work around that with playing with the image size and using it as a “Watermark”. One sneaky little thing done, a few more to go. Then I went about adding all my controls for specific entries.

So, now onto the save to SharePoint with unique names. Enter a little bit of VBA coding and lots of [Uncle Google][1]. I was able to create a mapped drive in VBA, as you cannot save directly to SharePoint<img style="border-style:none;" class="wlEmoticon wlEmoticon-sadsmile" alt="Sad smile" src="http://fskelly.files.wordpress.com/2011/08/wlemoticon-sadsmile.png" /> . So, map a drive to the folder that can exposed via SharePoint, when you select “Explorer View”. I was then able to use VBA to read information from a TextBox to create the file name. Once that was completed, I remove the drive so that our End Users do not log calls about a new “Mapped drive”. Some of the coding below to help anyone else trying to do something similar.

VBA Code Below

=============

> Private Sub CommandButton1_Click()  
> Set WshNetwork = CreateObject("WScript.Network")  
> WshNetwork.MapNetworkDrive "Z:", [\\<font color="#b54141"><em><font>sharepointserver@portnumber</font></em>\DavWWWRoot\<em><font>libraryname</font></em></font>][2]  
> Set WshNetwork = Nothing  
> Dim sFileName As String  
> Dim sPath As String  
> sFileName = _<font color="#ff0000">ControlName</font>_.Text  
> sPath = "z:\"  
> &#8216;(Replace with the name of the formfield you want to use)  
> ActiveDocument.SaveAs FileName:=sPath & sFileName, FileFormat:=wdFormatDocument  
> Set WshNetwork = CreateObject("WScript.Network")  
> WshNetwork.RemoveNetworkDrive "Z:", True  
> End Sub

Hope this helps someone else.

Follow me

[<img loading="lazy" title="facebook-small32222" border="0" alt="facebook-small32222" src="http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg" width="44" height="44" />][3] [<img loading="lazy" title="twitter-small32222" border="0" alt="twitter-small32222" src="http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg" width="44" height="44" />][4]

 [1]: www.google.com
 [2]: //\\sharepointserver@portnumber\DavWWWRoot\libraryname
 [3]: http://www.facebook.com/fletcher.kelly
 [4]: http://twitter.com/#!/fskelly