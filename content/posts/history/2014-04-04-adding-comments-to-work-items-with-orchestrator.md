+++
author = "Fletcher Kelly"

title = "Adding Comments to Work Items with Orchestrator"
date = "2014-04-04T08:18:16+00:00"
tags = [
  "SCSM",
  "Integration Project",
  "Orchestrator",
  "PowerShell"
]
categories = [
  "System Center",
  "Orchestrator"
]
type = "post"
+++

<!-- CANBEPUBLISHED -->

Hi All,

It has been a little while, i have been quite involved with an Integration Project. With this project there was a requirement to add comments to a Work Item. The information is passed on from "System A" to "System B" via XML. Using PowerShell, extracting the XML contents is not too difficult, if anyone would like to dive into that a little bit, please let me know with Comments.

I decided not to re-invent the wheel, so some searching was in order, and I found the following [post](http://social.technet.microsoft.com/Forums/en-US/63ce41e2-e9c5-4ba0-a28f-30f8e8fb17d2/adding-scsm-user-comment-from-orchestrator-or-powershell), this post gave the basics. However every time I tried to add additional comments, the comments were over-written and NOT replaced. Not quite the desired effect. So after some more checking and research and tinkering within the [Service Manager](https://docs.microsoft.com/en-us/previous-versions/system-center/system-center-2012-R2/hh305220(v=sc.12)?redirectedfrom=MSDN), I discovered the following about comments.

When adding a Comment, there is adding of a relationship class, already mentioned in this [post](http://social.technet.microsoft.com/Forums/en-US/63ce41e2-e9c5-4ba0-a28f-30f8e8fb17d2/adding-scsm-user-comment-from-orchestrator-or-powershell), however it also uses a GUID.

{{< figure src="/wp-content/uploads/2014/04/2014-04-03_07-51-37_thumb3.jpg" width="595" height="90" >}}

There is also another trick to adding comments within Orchestrator, this is discovered by trying to add a comment and then pulling all the available fields and looking at them. It is a small component which can be easily missed. The "Display Name" must also be the same GUID. So you might be asking how do we get the GUID?

Well, PowerShell can easily handle this for you.

```powershell
$guid = [System.Guid]::NewGuid().ToString()
```

You simply use this a pre-cursor step and publish this data from "Run .Net Script", so a sample would look like this.

{{< figure src="/wp-content/uploads/2014/04/2014-04-03_07-58-27_thumb1-1.jpg" width="582" height="214" >}}

Get-Object Properties

I pass on the ID Value I want to modify from another Runbook

{{< figure src="/wp-content/uploads/2014/04/2014-04-03_07-58-58_thumb1.jpg" width="578" height="399" >}}

Create Related Object Properties

I use an "Extended" class of comments needed for this project, principal remains the same.

{{< figure src="/wp-content/uploads/2014/04/2014-04-03_08-01-08_thumb3.jpg" width="580" height="400" >}}

I hope this saves you some time and add some value.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
