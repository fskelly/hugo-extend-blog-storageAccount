+++
author = "Fletcher Kelly"
title = "Grey Agent Fixing with Orchestrator"
date = "2015-04-14T05:08:44+00:00"
tags = [
  "Grey Agent",
  "Grey Agent Fix",
  "Runbook",
  "SCO",
]
categories = [
  "Operations Manager",
  "PowerShell",
  "System Center"
]
type = "post"
+++

<!-- CANBEPUBLISHED -->

So, here is the scenario, we managed a lot of customer’s System Centre Operations Manager (SCOM) environments. One of the most common issues we run into, it is the “Grey Agent” issue, where an agent is no longer reporting into SCOM. There might be a few reasons for this, however one of the most common and effective ways to fix this to clear the agent cache. By this, we simply mean connecting to the agent, stopping the “SCOM” service, deleting the content of the “Health Service State” folder and then restarting the “SCOM” service.

Yes, this is a perfect candidate for PowerShell and their a quite a few scripts that do this in numerous ways using PowerShell, I have a [script](https://github.com/fskelly/hugo-extend-blog-storageAccount/blob/main/externalFiles/2015/04/14/Rebuild-OpsMancache.ps1) for this, but they are usually dependant upon a list of some and then loop through this, I decided to use my friend, System Centre Orchestrator (SCO) to facilitate this is in a time manner, with more flexibility and log building as well as inputting the results into a database. With SCO, we also have more avenues available to us for error handling, like logging a call within SCSM or “richer” email or the like.

So, I have learnt with SCO, the best thing to do is to actually sit down and whiteboard you solution, simply draw out the steps you want to follow and think of some error handling. With my example, my logic was as follows. I have added a Visio diagram as my handwriting is barely legible even to me 🙂

1. Query Database for grey agents, there is a SQL Script for this.
2. Create Folder for logging
3. Read SQL results into a file for “’looping”
4. DNS Test
5. Ping Test
6. Determine Service Name and folder path (Remember we might be dealing with multiple versions of SCOM here
7. Check Service status, to determine if a stop of the service is needed
8. Stop if needed
9. Delete files
10. Wait 10 Seconds
11. Start Service
12. Write log to Database

{{< figure src="/wp-content/uploads/2015/04/scom_greyagentfix_thumb.jpg" >}}

The SQL query will be part of the Runbook file, it can be found [here](https://github.com/fskelly/hugo-extend-blog-storageAccount/blob/main/externalFiles/2015/04/14/scom_greyagentfix.ois_export).

Have fun automating.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
