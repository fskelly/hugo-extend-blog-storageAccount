#getting computer name to rebuild the cache on
$computername=Read-Host "Enter the computer name to rebuild the client cache"

#getting creds if you have a different accoutn for adminstration
$cred = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "NetBiosUserName")

#stop the Health Service
(Get-WmiObject -ComputerName $computername -Credential $cred Win32_Service -Filter "Name='HealthService'").stopservice() 

#buillding file path
$path = '\\'+ $computername +'\C$\Program Files\System Center Operations Manager 2007\Health Service State'

#remove current files
Get-ChildItem $path -Recurse | Remove-Item -Recurse

#wait for 10 seconds
Start-Sleep -Seconds 10

#start the Health Service again
(Get-WmiObject -ComputerName $computername -Credential $cred Win32_Service -Filter "Name='HealthService'").startservice() 