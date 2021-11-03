---
title: AssignedTo and AffectedUser with Powershell – Service Manager
author: fskelly
type: post
date: 2012-12-20T08:22:35+00:00
url: /2012/12/20/assignedto-and-affecteduser-with-powershell-service-manager/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - Service Manager
tags:
  - Affected User
  - AffectedUser
  - Assigned to user
  - Assignedto
  - Inident
  - powershell
  - SCSM
  - SCSM 2012
  - SMLets
  - WorkItem

---
<span style="font-family:Calibri;">So recently I got an e-mail to my newly setup e-mail address, for just this reason <img class="wlEmoticon wlEmoticon-smile" style="border-style:none;" alt="Smile" src="/wp-content/uploads/2012/12/wlemoticon-smile1.png" />,  from someone asking if I knew a way to do the following.</span>

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image_thumb" alt="image_thumb" src="/wp-content/uploads/2012/12/image_thumb_thumb.png" width="184" height="32" border="0" />][1]

> <span style="background-color:#ffff00;font-family:Calibri;">“I was trying to find a way to find all Incidents related to a specific person (assigned  to or affected user) using PowerShell”</span>

<span style="font-family:Georgia;"><span style="font-family:Calibri;">So, I decided the best to answer this with a blog post as maybe there are other people out there asking the same question. This is a quick solution using</span></span>

[sourcecode language=&#8221;powershell&#8221;]get-scsmincident[/sourcecode]

<span style="font-family:Georgia;"><span style="font-family:Calibri;">At this moment in time, this will address ONLY incidents. I will work on some code using</span></span>

[sourcecode language=&#8221;powershell&#8221;]get-scsmobject[/sourcecode]

<span style="font-family:Calibri;">to reference work items. I will add the pieces of code as I go and explain the code.</span>

<span style="font-family:Calibri;">First lets start by importing the required module, </span>[<span style="font-family:Calibri;">SMLets</span>][2] <span style="font-family:Calibri;">can be downloaded </span>[<span style="font-family:Calibri;">here</span>][3]

[sourcecode language=&#8221;powershell&#8221;]import-module smlets[/sourcecode]

<span style="font-family:Calibri;">I am running these commands on a computer that is <span style="background-color:#ffff00;">NOT the Management Server</span>. So I need to specify a computer name when I am running these commands. So, in the next line I create a</span>

[sourcecode language=&#8221;powershell&#8221;]$computername[/sourcecode]

<span style="font-family:Calibri;">variable to make my life easier. If you are running these commands on the Management Server, you can remove the</span>

[sourcecode language=&#8221;powershell&#8221;]-computername $computername[/sourcecode]

<span style="font-family:Calibri;">piece of code. Below is how I created this, please use the name of your Management Server</span>

[sourcecode language=&#8221;powershell&#8221;]$computername = “name of your Management Server"[/sourcecode]

<span style="font-family:Calibri;">Ok, so now lets get all active incidents. I will run a PowerShell Command to get all Incidents that are NOT EQUAL to “Resolved” or “Closed”. This allows us to cover all other incident statuses you may have created. Notice the <span style="background-color:#ffff00;">–ne operator.</span></span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents = Get-SCSMIncident -ComputerName $computername | Where-Object {$\_.Status -ne "resolved" -and $\_.status -ne "closed"}[/sourcecode]

<span style="font-family:Calibri;">So now we have all the incidents in an object, now what????</span>

<span style="font-family:Calibri;">Personally, I choose to sort the information, enter</span>

[sourcecode language=&#8221;powershell&#8221;]Sort-Object[/sourcecode]

<span style="font-family:Calibri;">with Powershell. So, to elaborate a little further you can use</span>

[sourcecode language=&#8221;powershell&#8221;]get-member[/sourcecode]

 <span style="font-family:Calibri;">or</span> “<span style="font-family:Calibri;">GM”</span> <span style="font-family:Calibri;">for short and “pipe” your variable to “GM” / Get-member</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents | gm [/sourcecode]

 <span style="font-family:Calibri;">OR </span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents | get-member [/sourcecode]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb18.png" width="442" height="241" border="0" />][4]

<span style="font-family:Calibri;">Now you have a list of all the properties you can use. You can also go deeper into the ‘Members’ of the object. You can do the following as well</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents.affecteduser | gm [/sourcecode]

<span style="font-family:Calibri;">It is simply a case of playing around and digging a little bit.</span>

<span style="font-family:Calibri;">So now back to the</span>

[sourcecode language=&#8221;powershell&#8221;]Sort-Object[/sourcecode]

. <span style="font-family:Calibri;">I wanted to sort by AssignedTo user, this can be easily changed by changing the</span>

[sourcecode language=&#8221;powershell&#8221;]-Property [/sourcecode]

<span style="font-family:Calibri;">field of the </span>

[sourcecode language=&#8221;powershell&#8221;]sort-object [/sourcecode]

<span style="font-family:Calibri;">I also chose for this example to display the information in a useful grid. This too can be changed as needed.</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents | Sort-Object -Property Assignedto | Select-Object -Property ID, Displayname, AffectedUser, Assignedto | Out-GridView[/sourcecode]

<span style="font-family:Calibri;">You will get some results like the below.</span>

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb19.png" width="569" height="303" border="0" />][5]

<span style="font-family:Calibri;">You can also limit the results by “Assigned To” user like such using either</span>

[sourcecode language=&#8221;powershell&#8221;]-like [/sourcecode]

<span style="font-family:Calibri;">or</span>

[sourcecode language=&#8221;powershell&#8221;]-eq [/sourcecode]

<span style="font-family:Calibri;">operators. Examples below</span>

<span style="font-family:Calibri;">-like operator. The example is finding all calls assigned to a user where the name is like “Kok*”. This time without the</span> <span style="background-color:#ffff00;font-family:Calibri;">“out-gridview”</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents | Where-Object {$_.assignedto.displayname -like "kok*"} [/sourcecode]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb20.png" width="569" height="237" border="0" />][6]

<span style="font-family:Calibri;">-eq operator. This example finds all incidents assigned to a user with a specific name. In my example I am using “Desmond Hilton”</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents | Where-Object {$_.assignedto.displayname -eq "Desmond Hilton"}[/sourcecode]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb21.png" width="569" height="145" border="0" />][7]

<span style="font-family:Calibri;">The PowerShell code can be easily adapted to meet the requirements for the <span style="background-color:#ffff00;">“Affected User”</span>. We simply change the value to use with the current object like such. I use</span>

[sourcecode language=&#8221;powershell&#8221;]$Get-member[/sourcecode]

<span style="font-family:Calibri;">on “Affecteduser”</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents.affecteduser|gm[/sourcecode]

. <span style="font-family:Calibri;">Again you can use the</span>

[sourcecode language=&#8221;powershell&#8221;]-like [/sourcecode]

or

[sourcecode language=&#8221;powershell&#8221;]-eq [/sourcecode]

<span style="font-family:Calibri;">operators</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents | Where-Object {$_.assignedto.displayname -like "kok*"} [/sourcecode]

<span style="font-family:Calibri;">-like operator. In this example I am using the Name “like” Roland</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents | Where-Object {$_.affecteduser.DisplayName -like "Roland*"}[/sourcecode]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb22.png" width="569" height="169" border="0" />][8]

<span style="font-family:Calibri;">-eq operator. In this example I am using the “Affected User” name of “Andre Botes”</span>

[sourcecode language=&#8221;powershell&#8221;]$allincidents | Where-Object {$_.affecteduser.DisplayName -eq "andre Botes"}[/sourcecode]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="/wp-content/uploads/2012/12/image_thumb23.png" width="569" height="152" border="0" />][9]

<span style="font-family:Calibri;">This should help you to make more in-depth queries and enjoy using PowerShell and </span>[<span style="font-family:Calibri;">SMLets</span>][2] <span style="font-family:Calibri;">to get valuable information from System Center Service Manager.</span>

<span style="font-family:Calibri;">I have also setup an new e-mail address to help with Service Manger queries. you can e-mail me at <strong>systemcenterguyza ”at” live ”dot” com</strong>  (</span>[<span style="font-family:Calibri;">systemcenterguyza@live.com</span>][10]<span style="font-family:Calibri;">) and I will assist as much as I can.</span>

<span style="font-family:Calibri;">I have also setup a new Twitter account to focus the Information around the System Center Suite.</span>

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="scsmlogo2" alt="scsmlogo2" src="/wp-content/uploads/2012/12/scsmlogo2.jpg" width="62" height="48" border="0" />][11]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image_thumb" alt="image_thumb" src="/wp-content/uploads/2012/12/image_thumb_thumb1.png" width="184" height="32" border="0" />][12]

<span style="font-family:Calibri;font-size:small;">Follow me.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="facebook-small322252222" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" border="0" /></span>][13][<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="twitter-small322252222" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" border="0" /></span>][14]

<span style="font-family:Calibri;font-size:small;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" border="0" /></a></span>

 [1]: /wp-content/uploads/2012/12/image_thumb17.png
 [2]: http://smlets.codeplex.com
 [3]: http://smlets.codeplex.com/releases/view/84853
 [4]: /wp-content/uploads/2012/12/image17.png
 [5]: /wp-content/uploads/2012/12/image18.png
 [6]: /wp-content/uploads/2012/12/image19.png
 [7]: /wp-content/uploads/2012/12/image20.png
 [8]: /wp-content/uploads/2012/12/image21.png
 [9]: /wp-content/uploads/2012/12/image22.png
 [10]: mailto:systemcenterguyza@live.com
 [11]: http://twitter.com/syscenterguyza
 [12]: /wp-content/uploads/2012/12/image_thumb24.png
 [13]: http://www.facebook.com/fletcher.kelly
 [14]: http://twitter.com/#!/fskelly