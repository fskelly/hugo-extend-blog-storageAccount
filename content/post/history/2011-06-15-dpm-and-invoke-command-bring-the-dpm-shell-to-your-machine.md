---
title: DPM and Invoke-Command, bring the DPM shell to your machine
author: fskelly
type: post
date: 2011-06-15T15:13:42+00:00
url: /2011/06/15/dpm-and-invoke-command-bring-the-dpm-shell-to-your-machine/
categories:
  - PowerShell
tags:
  - Data Prtoection Manager
  - DPM
  - PSSession
  - System Centre

---
Not that long ago, I created an article about DPM and I referenced DPM commands to be run in the DPM shell and only now realised that not everyone has the DPM console installed as this is not the easiest console to install and get working.

So, I am now the Proud Owner of [Learn Windows PowerShell in a month of Lunches][1] and I am an now playing and have figured out how to import the necessary commands with Remoting. There are some steps you need to follow to get PSRemoting working across an enterprise, [this][2] might help.

Once this is done, let the Magic begin.

First, lets create a [New-PSSession][3]

1. New-PSSession –ComputerName <FQDN of DPM Server> (figured this one out the hard way)

example : _New-PSSession –ComputerName mydpmserver.mydomain.com_

Second, lets use [Invoke-Command][4] to import the module (we are going to add the DPM Snapin)

2. invoke-Command -ScriptBlock {add-pssnapin Microsoft.DataProtectionManager.PowerShell}&#160; -Session (Get-PSSession –ComputerName <FQDN of DPM Server>)

Third, we are going to import these commands using [Import-PSSession][5] (you can add a prefix here using –prefix to identify them in a unique way)

3. Import-PSSession -Session (Get-PSSession -ComputerName <FQDN of DPM Server>) -module Microsoft.DataProtectionManager.PowerShell

Fourth, you can run [Get-Command][6] to confirm this (filtered by DPM)

4. Get-Command \*DPM\*

Cleaned up transcript and copied into a word file for ease [here][7]

&#160;

For those of who read my [previous post][8], you would have noticed the attach-productionserver.ps1 command. If you are really observant you would have noticed that it and a few others are not here.

So, lets try to get a workaround for that.

It is still a work in progress, however i am using [Enter-PSSession][9] for now

1. Enter-PSSession –ComputerName <FQDN of DPM Server>

2. Navigate to the DPM Bin Folder

&#160;&#160; cd &#8216;C:\Program Files\Microsoft DPM\DPM\bin&#8217;

3. You will now see that the attach- commands are available

4. When done, use [Exit-PSSession][10]

Cleaned up transcript and copied into a word file for ease [here][11]

&#160;

I recommend you follow [Don Jones][12], author of the above mentioned book and PowerShell MVP

Hope you find this helpful and as interesting as I did.

&#160;

Follow me

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="facebook-small322" border="0" alt="facebook-small322" src="http://fskelly.files.wordpress.com/2011/06/facebook-small322.jpg" width="44" height="44" />][13] [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="twitter-small322" border="0" alt="twitter-small322" src="http://fskelly.files.wordpress.com/2011/06/twitter-small322.jpg" width="44" height="44" />][14]

 [1]: http://www.manning.com/jones/
 [2]: http://www.damianflynn.com/2011/01/28/xx/
 [3]: http://technet.microsoft.com/en-us/library/dd347668.aspx
 [4]: http://technet.microsoft.com/en-us/library/dd347578.aspx
 [5]: http://technet.microsoft.com/en-us/library/dd347575.aspx
 [6]: http://technet.microsoft.com/en-us/library/dd347726.aspx
 [7]: http://fskelly.files.wordpress.com/2011/06/adding-dpm-commands.docx
 [8]: http://fskelly.wordpress.com/2011/05/27/changing-your-protection-server-in-dpm-to-another-server/
 [9]: http://technet.microsoft.com/en-us/library/dd315384.aspx
 [10]: http://technet.microsoft.com/en-us/library/dd315322.aspx
 [11]: http://fskelly.files.wordpress.com/2011/06/enter-pssessiondpmserver.docx
 [12]: http://twitter.com/#!/concentrateddon
 [13]: http://www.facebook.com/fletcher.kelly
 [14]: http://twitter.com/#!/fskelly