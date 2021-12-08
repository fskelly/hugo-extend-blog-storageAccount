+++
author = "Fletcher Kelly"
title = "AssignedTo and AffectedUser with Powershell – Service Manager"
date = "2012-12-20T08:22:35+00:00"
tags = [
  "SCSM",
  "Assigned to user",
  "Assignment"
  "PowerShell"
]
categories = [
  "System Center",
  "Service Manager"
]
type = "post"
+++

<!-- CANBEPUBLISHED -->

_"I am trying to find a way to find all Incidents related to a specific person (assigned  to or affected user) using PowerShell"_

So, I decided the best to answer this with a blog post as maybe there are other people out there asking the same question. This is a quick solution using PowerShell

```powershell
get-scsmincident
```

At this moment in time, this will address ONLY incidents. I will work on some code using PowerShell to reference all work items. I will add the pieces of code as I go and explain the code.

```powershell
get-scsmobject
```

First lets start by importing the required module, [SMLets](https://github.com/SMLets/SMLets) can be downloaded [here](https://github.com/SMLets/SMLets)

import-module smlets

I am running these commands on a computer that is **NOT** the Management Server. So I need to specify a computer name when I am running these commands. So, in the next line I create a **$computername** variable to make my life easier. If you are running these commands on the Management Server, you can remove the piece of code. Below is how I created this, please use the name of your Management Server

```powershell
$computername = "name of your Management Server"
```

Ok, so now lets get all active incidents. I will run a PowerShell Command to get all Incidents that are NOT EQUAL to "Resolved" or "Closed". This allows us to cover all other incident statuses you may have created. Notice the **–ne** operator.

```powershell
$allincidents = Get-SCSMIncident -ComputerName $computername | Where-Object {$_.Status -ne "resolved" -and $_.status -ne "closed"}
```

So now we have all the incidents in an object, now what????

Personally, I choose to sort the information, enter **Sort-Object** with Powershell. So, to elaborate a little further you can use **get-member** or "GM" for short and "pipe" your variable to "GM"

```powershell
$allincidents | gm 
$allincidents | get-member 
```

{{< figure src="/wp-content/uploads/2012/12/image_thumb18.png" >}}

Now you have a list of all the properties you can use. You can also go deeper into the ‘Members’ of the object. You can do the following as well

```powershell
$allincidents.affecteduser | gm 
```

It is simply a case of playing around and digging a little bit.

So now back to the

```powershell
Sort-Object
```

I wanted to sort by AssignedTo user, this can be easily changed by changing the

```powershell
-Property 
```

field of the

```powershell
sort-object
```

I also chose for this example to display the information in a useful grid. This too can be changed as needed.

```powershell
$allincidents | Sort-Object -Property Assignedto | Select-Object -Property ID, Displayname, AffectedUser, Assignedto | Out-GridView
```

You will get some results like the below.
{{< figure src="/wp-content/uploads/2012/12/image_thumb19.png" >}}

You can also limit the results by "Assigned To" user like such using either

```powershell
-like
```

or

```powershell
-eq 
```

operators. Examples below

-like operator. The example is finding all calls assigned to a user where the name is like "Kok*". This time without the **"out-gridview"**

```powershell
$allincidents | Where-Object {$_.assignedto.displayname -like "kok*"} 
```

{{< figure src="/wp-content/uploads/2012/12/image_thumb20.png" >}}

-eq operator. This example finds all incidents assigned to a user with a specific name. In my example I am using "Desmond Hilton"

```powershell
$allincidents | Where-Object {$_.assignedto.displayname -eq "Desmond Hilton"}
```

{{< figure src="/wp-content/uploads/2012/12/image_thumb21.png" >}}

The PowerShell code can be easily adapted to meet the requirements for the **"Affected User"**. We simply change the value to use with the current object like such. I use

```powershell
$Get-member
```

on "Affecteduser"

```powershell
$allincidents.affecteduser|gm
```

. Again you can use the

```powershell
-like 
```

or

```powershell
-eq 
```

operators

```powershell$
allincidents | Where-Object {$_.assignedto.displayname -like "kok*"} 
```

-like operator. In this example I am using the Name "like" Roland

```powershell
$allincidents | Where-Object {$_.affecteduser.DisplayName -like "Roland*"}
```

{{< figure src="/wp-content/uploads/2012/12/image_thumb22.png" >}}

-eq operator. In this example I am using the "Affected User" name of "Andre Botes"

```powershell
$allincidents | Where-Object {$_.affecteduser.DisplayName -eq "andre Botes"}
```

{{< figure src="/wp-content/uploads/2012/12/image_thumb23.png" >}}

This should help you to make more in-depth queries and enjoy using PowerShell and [SMLets](https://github.com/SMLets/SMLets) to get valuable information from System Center Service Manager.

Hope this helps and keep an eye out for more.

Follow me for more.  
[Twitter](https://twitter.com/fskelly)  
[LinkedIn](https://www.linkedin.com/in/fletcherkelly/)