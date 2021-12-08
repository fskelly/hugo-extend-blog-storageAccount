+++
type = "post"
author = "Fletcher Kelly"
title = "Importing data into Service Manager–CSV import and XML"
date = "2013-04-23T05:27:42+00:00"
tags = [
  "Change Request",
  "Asset Import",
  "CSV Import"
]
categories = [
  "Service Manager"
]
+++

<!-- CANBEPUBLISHED -->

So, just recently I was asked by a customer to import data from an "old" SCSM system. The customer is moving to new hardware within the organization and is using this opportunity to clean up Service Manager and re-import only clean data.

So, the challenge is the following.

The customer wants to import Change Requests from the "old" Service Manager to the "new" Service Manager. Ok, so after some research and confirmation, it is NOT possible to simply move data from one Service Manager installation to another. I decided the best way to handle this would be to import the data using a CSV file. As a start I used the ~~following links~~ - no longer available 😥

~~[http://www.netiviaconsulting.com/2012/05/04/importing-work-items-in-bulk-into-scsm2012-via-csv-import-connector/]~~

~~[http://blogs.technet.com/b/servicemanager/archive/2009/05/26/using-the-csv-import-feature.aspx]~~

So, now onto the "meat" of the work, it is entirely up to you what data you would like to import.

Below is a sample of my XML file. It caters for the basic information on the Change Request form and for my customers needs, it caters for SIX Manual Activities and ONE Review Activity. I will break this down into smaller pieces in a moment.

XML Code

```xml
<CSVImportFormat>  
<Projection Type="System.WorkItem.ChangeRequestProjection">  
<Seed>  
<Class Type="System.WorkItem.ChangeRequest">  
<Property ID="Id"/>  
<Property ID="Notes"/>  
<Property ID="Title"/>  
<Property ID="Description"/>  
<Property ID="ContactMethod"/>  
<Property ID="Priority"/>  
<Property ID="Impact"/>  
<Property ID="Risk"/>  
<Property ID="Reason"/>  
</Class>  
</Seed>  
<Component Alias="CreatedBy">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ManualActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>  
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ManualActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>  
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ManualActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>  
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ManualActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>  
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ManualActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>  
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ManualActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>  
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ManualActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>  
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ReviewActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>  
</Projection>  
</CSVImportFormat>  
```

Okay, so now time to break it down into smaller easier to manage bits.`

Base Change Request Projection Class. This is the framework for Change Request and this example included the "Created By" extension. Please note that the example below does NOT include the "Projection" closing XML Brace as this is included further down with the original coding.

XML Code

```xml
<Projection Type="System.WorkItem.ChangeRequestProjection">  
<Seed>  
<Class Type="System.WorkItem.ChangeRequest">  
<Property ID="Id"/>  
<Property ID="Notes"/>  
<Property ID="Title"/>  
<Property ID="Description"/>  
<Property ID="ContactMethod"/>  
<Property ID="Priority"/>  
<Property ID="Impact"/>  
<Property ID="Risk"/>  
<Property ID="Reason"/>  
</Class>  
</Seed>  
<Component Alias="CreatedBy">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>
```

So, now after this I have simply "bolted" on as many Manual Activities as I needed for my customer. In this case, it is SEVEN. I have a sample of the XML code below which can be simply copied and pasted as many times as needed. Please note that the example below does NOT include the "Projection" closing XML Brace as this is included further down with the original coding.

XML Code`

```xml
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ManualActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>
```

And now I needed to add a Review Activity, again this is just the simple information needed. `

XML Code

```xml
<Component Alias="Activity">  
<Seed>  
<Class Type="System.WorkItem.Activity.ReviewActivity">  
<Property ID="Id"/>  
<Property ID="SequenceId"/>  
<Property ID="Title"/>  
</Class>  
</Seed>  
<Component Alias="ActivityAssignedTo">  
<Seed>  
<Class Type="System.Domain.User">  
<Property ID="Domain"/>  
<Property ID="UserName"/>  
</Class>  
</Seed>  
</Component>  
</Component>
```

So, all the components together created the XML file for the Projection that I needed.`

Ok, so this is ONE piece of the puzzle. In order for the CSV import to work within Service Manager, you need a CSV file as well. Building the CSV file is actually quite easy. Simple use all tags as CSV headers.`

```xml
<Property ID =".."> 
```

Populate the file as needed. Now lets import the file. By the way, I have noticed that if the file is created in Excel (2013 at least) and saved a .csv, Excel uses ";" and NOT ",". So simple open the application in Notepad and do a search and replace.

Sample file (CSV)

```text
CR{0},CR notes,CR Title 1,CR Description 1,CR Contact Method,ChangePriorityEnum.Medium,ChangeImpactEnum.Standard,ChangeRiskEnum.Medium,CR Reason 1,FK,fletcherk,MA{0},0,MA Title 1,fk,fletcherk,MA{0},1,MA Title 2,fk,fletcherk,MA{0},2,MA Title 3,fk,fletcherk,MA{0},3,MA Title 4,fk,fletcherk,MA{0},4,MA Title 5,fk,fletcherk,MA{0},5,MA Title 6,fk,fletcherk,MA{0},6,MA Title 7,fk,fletcherk,RA{0},7,RA Title 1,fk,fletcherk
```

Please note that the Sequence ID can be changed to sort you needs. Remember that the Sequence Number will start at 0. The MA is the prefix for the Manual Activities and the RA is the prefix for Review Activities, please adjust as needed.

Also, the {0} ensures id are incremented correctly.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
