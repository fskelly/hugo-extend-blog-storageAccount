---
title: Get-hotfix on Steroids
author: fskelly
type: post
date: 2011-07-11T12:25:28+00:00
url: /2011/07/11/get-hotfix-on-steroids/
tagazine-media:
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:2:{s:66:"http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg";a:6:{s:8:"file_url";s:66:"http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:65:"http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg";a:6:{s:8:"file_url";s:65:"http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"2";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-07-11 12:28:28";}'
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:2:{s:66:"http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg";a:6:{s:8:"file_url";s:66:"http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}s:65:"http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg";a:6:{s:8:"file_url";s:65:"http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg";s:5:"width";s:2:"44";s:6:"height";s:2:"44";s:4:"type";s:5:"image";s:4:"area";s:4:"1936";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"2";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-07-11 12:28:28";}'
categories:
  - Technology
tags:
  - email
  - get-hotfix
  - powershell
  - script

---
Hi All,

I have taken the get-hotfix and tweaked it so something useful for my environment.

I have uploaded the .ps1 file to Technet.

My script can be found [here][1]

<pre>#building options for computer names
Write-host "How do you want to enter computer names?"
Write-host "1 = File with Comnputer names?"
Write-host "2 = Enter manually?"
Write-host ""
$choices1 = Read-host "Enter your choice"

switch ($choices1)
{
    1
        {
            $computernamefile = Read-host "Please enter file path"
            
            $computernames = (Get-Content -Path $computernamefile)
        }
    2
        {
            $computernames = (Read-Host "Enter the Computer Name(s) (separate with a comma)").split(',') | %{$_.trim()}
        }
    default
        {
            Write-Host "Invalid selection"
            Write-Host "Assuming you want to enter manually"
            $computernames = (Read-Host "Enter the Computer Name(s) (separate with a comma)").split(',') | %{$_.trim()}
        }
}

#get username
$cred = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "NetBiosUserName")


#building in choices
write-host ""
Write-Host "======================================"
Write-Host "What type of fix are you looking for?"
Write-host "1 = Hotfix"
Write-host "2 = Security update"
Write-host "3 = Update"
Write-host "4 = Service Pack"
Write-host "5 = All"
Write-host "======================================"
Write-host ""
$choice = Read-host "Please enter choice"

#building html style
$htmlstyle = "&lt;style&gt;"
$htmlstyle = $htmlstyle + "BODY{background-color:Green;}"
$htmlstyle = $htmlstyle + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$htmlstyle = $htmlstyle + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:GreenYellow}"
$htmlstyle = $htmlstyle + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:palegoldenrod}"
$htmlstyle = $htmlstyle + "&lt;/style&gt;"

#buillding folder path
$dir = $env:userprofile
$date = ((Get-Date).toString('yyyMMdd'))

#creating email addresses for recipeint
$recipeint = $env:username
$recipeint = $recipeint + "@europcar.co.za"
$recipeint

#creating email addresses for sender
$sender = $env:username
$sender = $sender + "@europcar.co.za"
$sender

#get-hotfixes
switch ($choice)
{
    1 
        {
            foreach ($computername in $computernames)
            {
                $filenamehtml = "hotfixes.html"
                $filenametxt = "hotfixes.txt"
                $newfolderpath = $dir.tostring() + "\" +$date + "\" + $computername + "\"
                New-Item -ItemType Directory -Path $newfolderpath -ErrorAction "SilentlyContinue"
                $filepathtxt = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenametxt
                $filepathhtml = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenamehtml
                $description = "Hotfix"
                Write-Host "Gathering Information for $computername" -ForegroundColor green
                $hotfix = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description
                $hotfixtxt = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description | Out-File -FilePath $filepathtxt
                $hotfixhtml = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description | ConvertTo-Html -Property CSName,Description,HotFixID,InstalledBy,InstalledOn -Head $htmlstyle -Body "&lt;H2&gt;Installed $description on $computername&lt;/H2&gt;" | out-file -FilePath $filepathhtml
                Write-host "The count of all installed Hotfixes on $computername is:" $hotfix.count
                $hotfix
                write-host ""
                Write-host "Files have been saved to" $newfolderpath
                Write-Host ""
                Write-Host "Sending Mail message to $recipeint" -ForegroundColor blue
                Send-MailMessage -to $recipeint -From $sender -Subject "Installed $description on $computername" -Body "Installed $description on $computername" -Attachments $filepathtxt,$filepathhtml -SmtpServer 172.21.195.31
                
            }
        }
    2 
        {
            foreach ($computername in $computernames)
            {
                $filenamehtml = "securityupdates.html"
                $filenametxt = "securityupdates.txt"
                $newfolderpath = $dir.tostring() + "\" +$date + "\" + $computername + "\"
                New-Item -ItemType Directory -Path $newfolderpath -ErrorAction "SilentlyContinue"
                $filepathtxt = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenametxt
                $filepathhtml = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenamehtml
                $description = "Security Update"
                Write-Host "Gathering Information for $computername" -ForegroundColor green
                $securityupdate = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description
                $securityupdatetxt = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description | Out-File -FilePath $filepathtxt
                $securityupdatehtml = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description | ConvertTo-Html -Property CSName,Description,HotFixID,InstalledBy,InstalledOn -Head $htmlstyle -Body "&lt;H2&gt;Installed $description on $computername&lt;/H2&gt;" | out-file -FilePath $filepathhtml
                Write-host "The count of all installed Service Packs on $computername is:" $securityupdate.count
                $securityupdate
                write-host ""
                Write-host "Files have been saved to" $newfolderpath
                Write-Host ""
                Write-Host "Sending Mail message to $recipeint" -ForegroundColor blue
                Send-MailMessage -to $recipeint -From $sender -Subject "Installed $description on $computername" -Body "Installed $description on $computername" -Attachments $filepathtxt,$filepathhtml -SmtpServer 172.21.195.31
            }
        }
    3 
        {
            foreach ($computername in $computernames)
            {
                $filenamehtml = "updates.html"
                $filenametxt = "updates.txt"
                $newfolderpath = $dir.tostring() + "\" +$date + "\" + $computername + "\"
                New-Item -ItemType Directory -Path $newfolderpath -ErrorAction "SilentlyContinue"
                $filepathtxt = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenametxt
                $filepathhtml = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenamehtml
                $description = "Update"
                Write-Host "Gathering Information for $computername" -ForegroundColor green
                $update = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description
                $updatetxt = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description | Out-File -FilePath $filepathtxt
                $updatehtml = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description | ConvertTo-Html -Property CSName,Description,HotFixID,InstalledBy,InstalledOn -Head $htmlstyle -Body "&lt;H2&gt;Installed $description on $computername&lt;/H2&gt;" | out-file -FilePath $filepathhtml
                Write-host "The count of all installed Service Packs on $computername is:" $update.count
                $update
                write-host ""
                Write-host "Files have been saved to" $newfolderpath
                Write-Host ""
                Write-Host "Sending Mail message to $recipeint" -ForegroundColor blue
                Send-MailMessage -to $recipeint -From $sender -Subject "Installed $description on $computername" -Body "Installed $description on $computername" -Attachments $filepathtxt,$filepathhtml -SmtpServer 172.21.195.31
            }
        }
    4 
        {
            foreach ($computername in $computernames)
            {
                $filenamehtml = "servicepack.html"
                $filenametxt = "servicepack.txt"
                $newfolderpath = $dir.tostring() + "\" +$date + "\" + $computername + "\"
                New-Item -ItemType Directory -Path $newfolderpath -ErrorAction "SilentlyContinue"
                $filepathtxt = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenametxt
                $filepathhtml = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenamehtml
                $description = "Service Pack"
                Write-Host "Gathering Information for $computername" -ForegroundColor green
                $servicepack = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description
                $servicepacktxt = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description | Out-File -FilePath $filepathtxt
                $servicepackhtml = Get-HotFix -ComputerName $computername -Description $description -Credential $cred | Sort-Object -Property Description | ConvertTo-Html -Property CSName,Description,HotFixID,InstalledBy,InstalledOn -Head $htmlstyle -Body "&lt;H2&gt;Installed $description on $computername&lt;/H2&gt;" | out-file -FilePath $filepathhtml
                Write-host "The count of all installed Service Packs on $computername is:" $all.count
                $servicepack
                write-host ""
                Write-host "Files have been saved to" $newfolderpath
                Write-Host ""
                Write-Host "Sending Mail message to $recipeint" -ForegroundColor blue
                Send-MailMessage -to $recipeint -From $sender -Subject "Installed $description on $computername" -Body "Installed $description on $computername" -Attachments $filepathtxt,$filepathhtml -SmtpServer 172.21.195.31
            }
        }
    5 
        {
            foreach ($computername in $computernames)
            {
                $filenamehtml = "all.html"
                $filenametxt = "all.txt"
                $newfolderpath = $dir.tostring() + "\" +$date + "\" + $computername + "\"
                New-Item -ItemType Directory -Path $newfolderpath -ErrorAction "SilentlyContinue"
                $filepathtxt = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenametxt
                $filepathhtml = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenamehtml
                Write-Host "Gathering Information for $computername" -ForegroundColor green
                $all = Get-HotFix -ComputerName $computername -Credential $cred | Sort-Object -Property Description
                $alltxt = Get-HotFix -ComputerName $computername -Credential $cred | Sort-Object -Property Description | Out-File -FilePath $filepathtxt
                $allhtml = Get-HotFix -ComputerName $computername -Credential $cred | Sort-Object -Property Description | ConvertTo-Html -Property CSName,Description,HotFixID,InstalledBy,InstalledOn -Head $htmlstyle -Body "&lt;H2&gt;Installed $description on $computername&lt;/H2&gt;" | out-file -FilePath $filepathhtml
                Write-host "The count of all installed hotfixes on $computername is:" $all.count
                $all
                write-host ""
                Write-host "Files have been saved to" $newfolderpath
                Write-Host ""
                Write-Host "Sending Mail message to $recipeint" -ForegroundColor blue
                Send-MailMessage -to $recipeint -From $sender -Subject "Installed $description on $computername" -Body "Installed $description on $computername" -Attachments $filepathtxt,$filepathhtml -SmtpServer 172.21.195.31 
            }
        }    
    default 
        {
            foreach ($computername in $computernames)
            {
                $filenamehtml = "all.html"
                $filenametxt = "all.txt"
                $newfolderpath = $dir.tostring() + "\" +$date + "\" + $computername + "\"
                New-Item -ItemType Directory -Path $newfolderpath -ErrorAction "SilentlyContinue"
                $filepathtxt = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenametxt
                $filepathhtml = $dir.tostring() + "\" +$date + "\" + $computername + "\" + $filenamehtml
                Write-host "Not a valid choice"
                Write-host "Assuming you want all updates"
                Write-Host "Gathering Information for $computername" -ForegroundColor green
                $all = Get-HotFix -ComputerName $computername -Credential $cred | Sort-Object -Property Description
                $alltxt = Get-HotFix -ComputerName $computername -Credential $cred | Sort-Object -Property Description | Out-File -FilePath $filepathtxt
                $allhtml = Get-HotFix -ComputerName $computername -Credential $cred | Sort-Object -Property Description | ConvertTo-Html -Property CSName,Description,HotFixID,InstalledBy,InstalledOn -Head $htmlstyle -Body "&lt;H2&gt;Installed $description on $computername&lt;/H2&gt;" | out-file -FilePath $filepathhtml
                Write-host "The count of all installed hotfixes on $computername is:" $all.count
                $all
                write-host ""
                Write-host "Files have been saved to" $newfolderpath
                Write-Host "" 
                Write-Host "Sending Mail message to $recipeint" -ForegroundColor blue
                Send-MailMessage -to $recipeint -From $sender -Subject "Installed $description on $computername" -Body "Installed $description on $computername" -Attachments $filepathtxt,$filepathhtml -SmtpServer 172.21.195.31
            }
        }
}
Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")</pre>

Hope you find this helpful.

Follow me

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="facebook-small32222" src="http://fskelly.files.wordpress.com/2011/07/facebook-small32222.jpg" alt="facebook-small32222" width="44" height="44" border="0" />][2] [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="twitter-small32222" src="http://fskelly.files.wordpress.com/2011/07/twitter-small32222.jpg" alt="twitter-small32222" width="44" height="44" border="0" />][3]

 [1]: http://gallery.technet.microsoft.com/scriptcenter/21361109-9659-42dd-941e-90afbac334b1
 [2]: http://www.facebook.com/fletcher.kelly
 [3]: http://twitter.com/#!/fskelly