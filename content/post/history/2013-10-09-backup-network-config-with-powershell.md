---
title: Backup Network Configuration with PowerShell
author: fskelly
type: post
date: 2013-10-09T19:30:29+00:00
url: /2013/10/09/backup-network-config-with-powershell/
publicize_linkedin_url:
  - 'http://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=5793793469403123712&type=U&a=-xHi'
  - 'http://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=5793793469403123712&type=U&a=-xHi'
publicize_twitter_user:
  - fskelly
  - fskelly
publicize_twitter_url:
  - http://t.co/30fQt2vAF7
  - http://t.co/30fQt2vAF7
twitter_cards_summary_img_size:
  - 'a:6:{i:0;i:184;i:1;i:32;i:2;i:3;i:3;s:23:"width="184" height="32"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}'
  - 'a:6:{i:0;i:184;i:1;i:32;i:2;i:3;i:3;s:23:"width="184" height="32"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}'
categories:
  - PowerShell
tags:
  - backup
  - config
  - configuration
  - Network

---
So, one of the consultants in the company I work at came to me with a strange request.

The request from the customer he was helping was the following. They wanted a way to connect to all the switches within their environment and then run some commands against the switch after connecting to the switch on port 23. Once the connection has been made, then some commands are run to get the current running configuration. Then export this to a text file.

So I found a basic script [here][1]. I have since taken this and modified and extended the script. I have added an array for the IPs to be checked. I have also added some checking prior to running any commands. I have added some testing.

First, we test the connection and see if the device is responding to pings. If the device is responding to pings, then test and see if the device is configured for telnet. So basically I am looking to see if port 23 is open. If port 23 is not opened, a log file is updated with the IP Address. If the device is not responding to pings, a log file is updated stating the IP of the “non-responding” device.

As an addition to the script, the files are then added to an e-mail which is sent to whomever you want to add. As part of the email process, a check is done and if an error is thrown, there is more information presented in the console to point you in the correct direction.

[sourcecode language=&#8221;powershell&#8221; wraplines=&#8221;false&#8221; collapse=&#8221;false&#8221;]

\## PowerShell: Script To Telnet To Remote Hosts And Run Commands Against Them With Output To A File ##  
\## Overview: Useful for Telnet connections to Cisco Switches and other devices. Can add additional command strings  
\## Usage Examples: Add your environment specific details into the parameters below, or include when calling the script:  
\## ./PowerShellTelnetRemoteSession.ps1 "127.0.0.1" "23" "admin" "password" "term len 0" "en" "enablepassword" "show interface"

param(  
#[string] $remoteHost = "172.31.0.111",  
#[int] $port = 23,  
[string] $username = "admin",  
[string] $password = "",  
#[string] $termlength = "term len 0", #Useful for older consoles that have line display limitations  
[string] $enable = "en", #Useful for appliances like Cisco switches that have an &#8216;enable&#8217; command mode  
[string] $enablepassword = "",  
[string] $command1 = "show run", #You can add additional commands below here with additonal strings if you want  
[string] $command2 = " ",  
[string] $command3 = " ",  
[string] $command4 = " ",  
[string] $command5 = " ",  
[int] $commandDelay = 1000  
)

[string] $output = ""

\## Read output from a remote host  
function GetOutput  
{  
\## Create a buffer to receive the response  
$buffer = New-Object System.Byte[] 4096  
$encoding = New-Object System.Text.AsciiEncoding

$outputBuffer = ""  
$foundMore = $false

\## Read all the data available from the stream, writing it to the  
\## output buffer when done.  
do  
{  
\## Allow data to buffer for a bit  
Start-Sleep -m 1000

\## Read what data is available  
$foundmore = $false  
$stream.ReadTimeout = 1000

do  
{  
try  
{  
$read = $stream.Read($buffer, 0, 1024)

if($read -gt 0)  
{  
$foundmore = $true  
$outputBuffer += ($encoding.GetString($buffer, 0, $read))  
}  
} catch { $foundMore = $false; $read = 0 }  
} while($read -gt 0)  
} while($foundmore)

$outputBuffer  
}

function Main  
{  
param ($ip,$port)  
\## Open the socket, and connect to the computer on the specified port

Write-Host "Connecting to $ip on port $port"

$socket = New-Object System.Net.Sockets.TcpClient($ip, $port)

Write-Host "Connected. Press ^D followed by [ENTER] to exit.\`n"

$stream = $socket.GetStream()

$writer = New-Object System.IO.StreamWriter $stream

\## Receive the output that has buffered so far  
$SCRIPT:output += GetOutput

$writer.WriteLine($username)  
$writer.Flush()  
Start-Sleep -m $commandDelay  
$writer.WriteLine($password)  
$writer.Flush()  
#Start-Sleep -m $commandDelay  
#$writer.WriteLine($termlength)  
#$writer.Flush()  
Start-Sleep -m $commandDelay  
$writer.WriteLine($enable)  
$writer.Flush()  
Start-Sleep -m $commandDelay  
$writer.WriteLine($enablepassword)  
$writer.Flush()  
Start-Sleep -m $commandDelay  
$writer.WriteLine($command1) #Add additional entries below here for additional &#8216;strings&#8217; you created above  
$writer.Flush()  
Start-Sleep -m $commandDelay  
$writer.WriteLine($command2) #Add additional entries below here for additional &#8216;strings&#8217; you created above  
$writer.Flush()  
Start-Sleep -m $commandDelay  
$writer.WriteLine($command3) #Add additional entries below here for additional &#8216;strings&#8217; you created above  
$writer.Flush()  
Start-Sleep -m $commandDelay  
$writer.WriteLine($command4) #Add additional entries below here for additional &#8216;strings&#8217; you created above  
$writer.Flush()  
Start-Sleep -m $commandDelay  
$writer.WriteLine($command5) #Add additional entries below here for additional &#8216;strings&#8217; you created above  
$writer.Flush()  
Start-Sleep -m $commandDelay  
$SCRIPT:output += GetOutput

\## Close the streams  
$writer.Close()  
$stream.Close()

#building file name  
$filename = "c:\switch\$ip &#8211; " + $timestamp + ".txt"

$output | Out-File $filename #Change this to suit your environment  
}

#build the list of ips to be interegated  
$ips = "192.168.1.2","169.254.2.2","192.168.1.101"

#building a file path  
$timestamp = get-date -Format g | foreach {$_ -replace ":","."}

#building different file paths for different functions  
$errortimestamp = Get-Date -Format o | foreach {$_ -replace ":", "."}  
$errorfilename = "c:\switch\" + $timestamp + " &#8211; ERROR.txt"

#building different file paths for different functions  
$blockedtimestamp = Get-Date -Format o | foreach {$_ -replace ":", "."}  
$blockedfilename = "c:\switch\" + $timestamp + " &#8211; blocked.txt"

#looping through each ip in ip list  
foreach ($ip in $ips)  
{  
Write-host "Testing $ip"  
#test to see if device is responding to pings  
if (Test-Connection $ip -Quiet)  
{  
#creating connection on port 23  
$t = New-Object Net.Sockets.TcpClient  
$t.Connect($ip, 23)

#if it connects, runs the required function with the ip  
if ($t.Connected)  
{  
. Main $ip "23"  
}  
#script block for device responding to ping, but port 23 is NOT open  
else  
{  
$portblocked = "Port 23 on $ip is closed , You may need to contact your IT team to open it. "  
Add-Content $blockedfilename "\`n$portblocked"  
}  
}  
#script block for NO RESPONSE  
else  
{  
$errorfilename = "c:\switch\" + $timestamp + " &#8211; ERROR.txt"  
Add-Content $errorfilename "\`nCould not ping $ip"  
}  
}

#displaying information on console  
Write-Host "Build file list" -NoNewline  
#getting file list to be emailed  
$files = Get-ChildItem C:\Switch\ | Where {-NOT $\_.PSIsContainer} | foreach {$\_.fullname}  
#pausing script  
Start-Sleep 3  
Write-Host "\`t" [File List Built] -ForegroundColor "Green"

Write-Host "Sending Email" -NoNewline

#building checks for sending emails

#no error

#replace as needed  
$to = "<to>"  
$from = "<from>"  
$smtpserver = "<smtpserver>"

try  
{  
Send-MailMessage -Attachments $files -to $to -from $from -Subject "Network Config backup &#8211; $timestamp" -SmtpServer $smtpserver -ErrorAction Stop  
Write-Host "\`t [Email Sent]" -ForegroundColor "Green"  
}  
#error  
catch  
{  
$ErrorMessage = $_.Exception.Message  
#$ErrorMessage  
if ($ErrorMessage -ne $null)  
{  
Write-Host "\`t [Unable to send Mail]" -ForegroundColor "Red"  
Write-Host "There was an error: $ErrorMessage" -ForegroundColor "Yellow"  
}  
}

Start-Sleep 3  
Write-Host "Removing Files" -NoNewline  
$files | Remove-Item  
Write-Host "\`t [Files removed]" -ForegroundColor "Green"

[/sourcecode]

[(E-Mail me)][2]

![][3] 

Follow me.

![][4] Facebook (Personal)

![][5] Twitter (Personal & System Centre)

![][6] Twitter (System Centre Focused)

![][7]

 [1]: http://brianreiter.org/2011/06/08/cool-powershell-script-replicates-telnet/
 [2]: mailto:systemcenterguyza@live.com
 [3]: /wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png?w=497
 [4]: http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg?w=44&h=44
 [5]: http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg?w=44&h=44
 [6]: /wp-content/uploads/2013/02/scsmlogo25232.jpg?w=56&h=43
 [7]: http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg?w=244&h=99