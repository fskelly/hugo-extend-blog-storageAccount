Import-Module DataProtectionManager
$date = Get-Date -Format "M-d-yyyy"
$path = "c:\DPMOffisteTapes\"
$filepath = $path + $date + ".html"
#creates the folder if it does not exist
New-Item -itemType file -Path $filepath
$AllLibraries = get-dpmlibrary 
$AllTapes = Get-Tape -DPMLibrary $AllLibraries
$offistereadytape = $AllTapes | Where-Object {$_.isoffsiteready -eq $true}
$a = "<style>"
$a = $a + "BODY{background-color:Green;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:GreenYellow}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:palegoldenrod}"
$a = $a + "</style>"
$offistereadytape | Select-object location, barcode , isoffsiteready|ConvertTo-Html -Head $a -Body "<H2>Offsite Ready Tapes</H2>" | out-file -FilePath $filepath