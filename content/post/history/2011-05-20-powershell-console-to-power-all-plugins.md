---
title: POWERshell console to power all plugins
author: fskelly
type: post
date: 2011-05-20T11:07:09+00:00
url: /2011/05/20/powershell-console-to-power-all-plugins/
tagazine-media:
  - 'a:7:{s:7:"primary";s:52:"http://fskelly.files.wordpress.com/2011/05/image.png";s:6:"images";a:6:{s:52:"http://fskelly.files.wordpress.com/2011/05/image.png";a:6:{s:8:"file_url";s:52:"http://fskelly.files.wordpress.com/2011/05/image.png";s:5:"width";s:3:"992";s:6:"height";s:3:"607";s:4:"type";s:5:"image";s:4:"area";s:6:"602144";s:9:"file_path";s:0:"";}s:58:"http://fskelly.files.wordpress.com/2011/05/image_thumb.png";a:6:{s:8:"file_url";s:58:"http://fskelly.files.wordpress.com/2011/05/image_thumb.png";s:5:"width";s:3:"656";s:6:"height";s:3:"403";s:4:"type";s:5:"image";s:4:"area";s:6:"264368";s:9:"file_path";s:0:"";}s:64:"http://fskelly.files.wordpress.com/2011/05/wlemoticon-smile1.png";a:6:{s:8:"file_url";s:64:"http://fskelly.files.wordpress.com/2011/05/wlemoticon-smile1.png";s:5:"width";s:2:"19";s:6:"height";s:2:"19";s:4:"type";s:5:"image";s:4:"area";s:3:"361";s:9:"file_path";s:0:"";}s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image001.jpg";a:6:{s:8:"file_url";s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image001.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image002.jpg";a:6:{s:8:"file_url";s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image002.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image003.png";a:6:{s:8:"file_url";s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image003.png";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"6";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-05-20 11:07:09";}'
  - 'a:7:{s:7:"primary";s:52:"http://fskelly.files.wordpress.com/2011/05/image.png";s:6:"images";a:6:{s:52:"http://fskelly.files.wordpress.com/2011/05/image.png";a:6:{s:8:"file_url";s:52:"http://fskelly.files.wordpress.com/2011/05/image.png";s:5:"width";s:3:"992";s:6:"height";s:3:"607";s:4:"type";s:5:"image";s:4:"area";s:6:"602144";s:9:"file_path";s:0:"";}s:58:"http://fskelly.files.wordpress.com/2011/05/image_thumb.png";a:6:{s:8:"file_url";s:58:"http://fskelly.files.wordpress.com/2011/05/image_thumb.png";s:5:"width";s:3:"656";s:6:"height";s:3:"403";s:4:"type";s:5:"image";s:4:"area";s:6:"264368";s:9:"file_path";s:0:"";}s:64:"http://fskelly.files.wordpress.com/2011/05/wlemoticon-smile1.png";a:6:{s:8:"file_url";s:64:"http://fskelly.files.wordpress.com/2011/05/wlemoticon-smile1.png";s:5:"width";s:2:"19";s:6:"height";s:2:"19";s:4:"type";s:5:"image";s:4:"area";s:3:"361";s:9:"file_path";s:0:"";}s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image001.jpg";a:6:{s:8:"file_url";s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image001.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image002.jpg";a:6:{s:8:"file_url";s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image002.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image003.png";a:6:{s:8:"file_url";s:60:"http://fskelly.files.wordpress.com/2011/05/clip_image003.png";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"6";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-05-20 11:07:09";}'
categories:
  - Technology
tags:
  - Elevation
  - Module
  - powershell
  - PSSnapin

---
I do not know about everyone else. I am a rather busy admin and quite fond of powershell and scripting. However, I also have a separate admin account for doing my administrative tasks. Now when you are working with multiple systems, all of which have PowerShell consoles, it can become a little bit of a pain opening a console for Exchange 2010, Operations Manager 2010, Virtual Machine Manager and Service Manager to name a few. There are tons of products that now have powershell interfaces. Would it not be great to have ONE SHELL to control them all, with all the PSSnapins and Modules? The answer is of course, YES. This is what I got right thanks to Uncle GOOGLE and a lot a research and a wonderful thing called the [Powershell Profile][1]. So using another [link][2] I found as a base, I started my mission. I though of all the modules and pssnapins I used and created the shell below.

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" border="0" alt="image" src="http://fskelly.files.wordpress.com/2011/05/image_thumb.png" width="656" height="403" />][3]

It adds all the Modules and PSSnapins I use on a daily basis, I also copied the same profile.ps1 to my “admin” profile so that the same would happen when using this as my “admin” account. See code snippet below. The first line of code caters for those people like me using PowerGui and the Script-Explorer addon, that took some time for figure out, hope you enjoy<img style="border-style:none;" class="wlEmoticon wlEmoticon-smile" alt="Smile" src="http://fskelly.files.wordpress.com/2011/05/wlemoticon-smile1.png" /> (2 different views included to make it easier to use if you so wish)

<div id="codeSnippetWrapper">
  &#160;
</div>

<div>
  ================================================================ </p> 
  
  <p>
    import-module Add-on.ScriptExplorer
  </p>
  
  <p>
    # Sets APPDATA environment variable if it doesn&#8217;t exist <br />if (! (Test-Path [string]$env:APPDATA) ) {$env:APPDATA = $env:USERPROFILE + "\Application Data"} <br />&#160; <br /># Create Powershell Drives <br />#New-PSDrive -name SCRIPT -psprovider FileSystem -root "\\fileshare\data\IT Department\Team\Scripts" <br />#New-PSDrive -name VMSCRIPT -psprovider FileSystem -root "\\fileshare2\common\IT Department\Projects\VMWare\Scripts" <br />#Set-Location VMSCRIPT: <br />"You are now PowerShell : " + $env:Username <br />&#160; <br /># Exchange 2010 <br />if (((Get-PSSnapin -Name "Microsoft.Exchange.Management.PowerShell.E2010" -ErrorAction SilentlyContinue) -eq $null ) -and ((Get-PSSnapin –registered -Name "Microsoft.Exchange.Management.PowerShell.E2010") -ne $null)) <br />{ <br />&#160;&#160; Write-Host "Adding Exchange 2010" -ForegroundColor Green <br />&#160;&#160; Add-PSSnapin -name Microsoft.Exchange.Management.PowerShell.E2010 <br />&#160;&#160; ."C:\Program Files\Microsoft\Exchange Server\V14\bin\RemoteExchange.ps1"; "Connect-ExchangeServer -auto" <br />} <br /># Virtual Machine Manager <br />if (((Get-PSSnapin -Name "Microsoft.SystemCenter.VirtualMachineManager" -ErrorAction SilentlyContinue) -eq $null ) -and ((Get-PSSnapin –registered -Name "Microsoft.SystemCenter.VirtualMachineManager") -ne $null)) <br />{ <br />&#160;&#160; Write-Host "Adding Virtual Machine Manager" -ForegroundColor Green <br />&#160;&#160; Add-PSSnapin -name Microsoft.SystemCenter.VirtualMachineManager <br />&#160;&#160; #C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -PSConsoleFile "C:\Program Files\Microsoft System Center Virtual Machine Manager 2008 R2\bin\cli.psc1" -NoExit <br />}
  </p>
  
  <p>
    # Quest Active Directory <br />if (((Get-PSSnapin -Name "Quest.ActiveRoles.ADManagement" -ErrorAction SilentlyContinue) -eq $null ) -and ((Get-PSSnapin –registered -Name "Quest.ActiveRoles.ADManagement") -ne $null)) <br />{ <br />&#160;&#160; Write-Host "Adding Quest Active Directory" -ForegroundColor Green <br />&#160;&#160; Add-PSSnapin -name Quest.ActiveRoles.ADManagement <br />} <br />#SMCmdletSnapIn <br />if (((Get-PSSnapin -Name "SMCmdletSnapIn" -ErrorAction SilentlyContinue) -eq $null ) -and ((Get-PSSnapin –registered -Name "SMCmdletSnapIn") -ne $null)) <br />{ <br />&#160;&#160; Write-Host "System Centre 2010 Snapin" -ForegroundColor Green <br />&#160;&#160; Add-PSSnapin -name SMCmdletSnapIn <br />} <br /># Operations Manager 2007 <br />if (((Get-PSSnapin -Name "Microsoft.EnterpriseManagement.OperationsManager.Client" -ErrorAction SilentlyContinue) -eq $null ) -and ((Get-PSSnapin –registered -Name "Microsoft.EnterpriseManagement.OperationsManager.Client") -ne $null)) <br />{ <br />&#160;&#160; Write-Host "Operations Manager 2007 Snapin" -ForegroundColor Green <br />&#160;&#160; Add-PSSnapin -name Microsoft.EnterpriseManagement.OperationsManager.Client <br />} <br /># time to import smlets <br />$exist = $false <br />foreach ($modulePath in ${env:PSModulePath}.Split(";")) <br />{ <br />&#160;&#160; if ((Test-Path ($modulePath + "Smlets\smlets.Module.dll")) -and !$exist) <br />&#160;&#160; { <br />&#160;&#160; Write-Host "Adding SMLets for SCSM 2010" -ForegroundColor Green <br />&#160;&#160; $exist = $true <br />&#160;&#160; Import-Module smlets <br />&#160;&#160; }
  </p>
  
  <p>
    } <br />#time to import ActiveDirectoryModule <br />$exist = $false <br />foreach ($modulePath in ${env:PSModulePath}.Split(";")) <br />{ <br />&#160;&#160; if ((Test-Path ($modulePath + "ActiveDirectory\ActiveDirectoryPowerShellResources.dll")) -and !$exist) <br />&#160;&#160; { <br />&#160;&#160; Write-Host "Adding ActiveDirectory Module" -ForegroundColor Green <br />&#160;&#160; $exist = $true <br />&#160;&#160; Import-Module ActiveDirectory <br />&#160;&#160; } <br />} <br />#time to import FailoverClusters Module <br />$exist = $false <br />foreach ($modulePath in ${env:PSModulePath}.Split(";")) <br />{ <br />&#160;&#160; if ((Test-Path ($modulePath + "FailoverClusters\Microsoft.FailoverClusters.PowerShell.dll")) -and !$exist) <br />&#160;&#160; { <br />&#160;&#160; Write-Host "Adding Failover Clusters Module" -ForegroundColor Green <br />&#160;&#160; $exist = $true <br />&#160;&#160; Import-Module FailoverClusters <br />&#160;&#160; } <br />} <br />#time to import Group Policy Module <br />$exist = $false <br />foreach ($modulePath in ${env:PSModulePath}.Split(";")) <br />{ <br />&#160;&#160; if ((Test-Path ($modulePath + "GroupPolicy\GroupPolicy.psd1")) -and !$exist) <br />&#160;&#160; { <br />&#160;&#160; Write-Host "Adding Group Policy Module" -ForegroundColor Green <br />&#160;&#160; $exist = $true <br />&#160;&#160; Import-Module GroupPolicy <br />&#160;&#160; } <br />}
  </p>
  
  <p>
    function prompt <br />{ <br />&#160;&#160;&#160; $cwd = (get-location).Path <br />&#160;&#160;&#160; $host.UI.RawUI.WindowTitle = "Fletcher&#8217;s Shell " + $global:connectedFqdn <br />&#160;&#160;&#160; $host.UI.Write("Yellow", $host.UI.RawUI.BackGroundColor, "[PS]") <br />&#160;&#160;&#160; " $cwd>" <br />}
  </p>
  
  <p>
    function get-fletchbanner <br />{ <br />&#160;&#160;&#160; write-host "`n&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; Welcome to the Fletch&#8217;s Management Shell!`n"&#160;&#160;&#160; <br />}
  </p>
  
  <p>
    get-fletchbanner <br />cd\
  </p>
  
  <p>
    =============================================================
  </p></p>
</div>

&#160;

Talking about “admin” accounts, the one BIG thing about Windows 7 is the lack of “Running as another account and elevated”. I also found a [solution][4] to this as well.

I really hope this helps everyone, like this has helped me.

&#160;

Follow me

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="clip_image001" border="0" alt="clip_image001" src="http://fskelly.files.wordpress.com/2011/05/clip_image001.jpg" width="44" height="44" />][5] [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="clip_image002" border="0" alt="clip_image002" src="http://fskelly.files.wordpress.com/2011/05/clip_image002.jpg" width="44" height="44" />][6] [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image003" border="0" alt="clip_image003" src="http://fskelly.files.wordpress.com/2011/05/clip_image003.png" width="44" height="44" />][7]

 [1]: http://technet.microsoft.com/en-us/library/ee692764.aspx
 [2]: http://www.wooditwork.com/2010/08/11/pimping-your-powershell-profile/
 [3]: http://fskelly.files.wordpress.com/2011/05/image.png
 [4]: http://www.techrepublic.com/blog/window-on-windows/elevate-privileges-automatically-with-elevation-powertoys/1425
 [5]: http://www.facebook.com/fletcher.kelly
 [6]: http://twitter.com/#!/fskelly
 [7]: http://fskelly.wordpress.com/