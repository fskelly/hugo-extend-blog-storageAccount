+++
authors = [
    "Fletcher Kelly",
]
title = "Group assignment with Service Manager"
date = "2012-12-31T06:58:52+00:00"
tags = [
  "SCSM",
  "Assigned to user",
  "Assignment"
]
categories = [
  "System Center"
]
+++

<!-- CANBEPUBLISHED -->

So one of the biggest issues I have with Service Manager is actually user based as seems to be quite difficult to teach the concept of this for some strange reason. So, as a work-around I have created views that cater for the issue I am about to discuss.

The issue is as follows, when a Work Item gets re-assigned to a new Analyst, 99% of the time, the associated Support Group does NOT get changed. Let’s take the following example.

>An incident is logged and is automatically assigned to the “Service Desk” team, now an analysts investigates the incident and determines that the incident actually belongs to a member of the “Network Team”. So, typically, the “Assigned to” person is changed and the new analyst will get an e-mail stating that a call has been assigned to him/her. However, the incident now reflects the following

Analyst -> Changed  
Network Analyst -> NOT changed

So basically, if you were to have a queue or view that shows up all incidents assigned to the “Network Team”, this incident would not show up however the analyst has received and e-mail stating that an Incident has been assigned to him/her, it can of course be found by using “Assigned to Me” View.

There is a [solution](http://www.cireson.com/app-store/scsm-group-assign/) here. Enter [Cireson](https://www.cireson.com) and their fantastic applications for Service Manager. [SCSM Group Assign](http://www.cireson.com/app-store/scsm-group-assign/) allows the extended functionality of selecting the required Support Group and then NARROWS the list of Analysts to that specific group. This ensures that BOTH theSupport Group andAnalyst are changed at time of re-assignment, making the creation of views and [Queues](https://docs.microsoft.com/en-us/previous-versions/system-center/service-manager-2010-sp1/ff461077(v=technet.10)?redirectedfrom=MSDN) a lot simpler and then ensures that your views based on Support Group are 100% accurate. The [solution](http://www.cireson.com/app-store/scsm-group-assign/) extends the context pane and adds a "Assign Analyst by Group" option

{{< figure src="/wp-content/uploads/2012/12/image_thumb25.png" width="595" height="90" >}}

What [SCSM Group Assign](http://www.cireson.com/app-store/scsm-group-assign/) allows you to is the following (this is my test lab), you will however get the idea.

Below is a screenshot of the groups that I have created within Active Directory to “illustrate” my different Support Groups. You will see a few groups.

1. For all analysts
1. To represent different support Groups (I have called them Tier 1,2 and 3, as this is the vanilla experience with SCSM)

{{< figure src="/wp-content/uploads/2012/12/image015_thumb.png" width="595" height="90" >}}

Ok, so below is a screenshot of a re-assignment using the new “Assign Analyst by Group” option. For this example I have used “Tier 1”. Note how the “Analyst” selection is limited to only 2 Analysts as per my groups earlier. Namely Analyst 1 and Analyst 2.

{{< figure src="/wp-content/uploads/2012/12/tier1-group-assign_thumb.jpg" width="595" height="90" >}}

The next screenshot depicts the same process only to “Tier 2” this time. This time the selection is limited to Analyst 3 and Analyst 4.

{{< figure src="/wp-content/uploads/2012/12/tier2-group-assign_thumb.jpg" width="595" height="90" >}}

The re-assignment is logged in Service Manager in the exact same way as any analyst assignment. This is an extension of the capabilities of Service Manager.

I would highly recommend [SCSM Group Assign](http://www.cireson.com/app-store/scsm-group-assign/) for any Service Manager installation.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
