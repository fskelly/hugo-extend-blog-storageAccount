---
title: Importing data into Service Manager–CSV import and XML
author: fskelly
type: post
date: 2013-04-23T05:27:42+00:00
url: /2013/04/23/importing-data-into-service-managercsv-import-and-xml/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - Service Manager
tags:
  - Change Request
  - CSV
  - CSV Import
  - Data Import
  - import
  - SCSM 2012

---
<span style="font-size:small;">So, just recently I was asked by a customer to import data from an “old” SCSM system. The customer is moving to new hardware within the organization and is using this opportunity to clean up Service Manager and re-import only clean data.</span>

<span style="font-size:small;">So, the challenge is the following.</span>

<span style="font-size:small;">The customer wants to import Change Requests from the “old” Service Manager to the “new” Service Manager. Ok, so after some research and confirmation, it is NOT possible to simply move data from one Service Manager installation to another. I decided the best way to handle this would be to import the data using a CSV file. As a start I used the following links</span>

[http://www.netiviaconsulting.com/2012/05/04/importing-work-items-in-bulk-into-scsm2012-via-csv-import-connector/][1]

[http://blogs.technet.com/b/servicemanager/archive/2009/05/26/using-the-csv-import-feature.aspx][2]

<span style="font-size:small;">So, now onto the “meat” of the work, it is entirely up to you what data you would like to import.</span>

<span style="font-size:small;">Below is a sample of my XML file. It caters for the basic information on the Change Request form and for my customers needs, it caters for SIX Manual Activities and ONE Review Activity. I will break this down into smaller pieces in a moment.</span>

<span style="font-size:small;">The Appendix “A” </span>[<span style="font-size:small;">here</span>][3] <span style="font-size:small;">is key to the import process.</span>

<span style="font-size:small;">XML Code</span>

[code language=&#8221;xml&#8221;]  
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
<code>[/code]

</code></pre> 

`<span style="font-family:Tahoma;font-size:small;">Okay, so now time to break it down into smaller easier to manage bits.</span>`

`<span style="font-family:Tahoma;"><span style="font-size:small;">Base Change Request Projection Class. This is the framework for Change Request and this example included the “Created By” extension. All the property id’s can be found in the appendix </span><a href="http://blogs.technet.com/b/servicemanager/archive/2009/05/26/appendix-a-to-previous-post.aspx"><span style="font-size:small;">here</span></a><span style="font-size:small;">. Please note that the example below does NOT include the “Projection” closing XML Brace as this is included further down with the original coding.</span></span>`

`<span style="font-family:Tahoma;font-size:small;">XML Code</span>`

[code language=&#8221;xml&#8221;]</pre>  
<code></code>

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

<code>[/code]

</code>

`<span style="font-family:Tahoma;font-size:small;">So, now after this I have simply “bolted” on as many Manual Activities as I needed for my customer. In this case, it is SEVEN. I have a sample of the XML code below which can be simply copied and pasted as many times as needed. Please note that the example below does NOT include the “Projection” closing XML Brace as this is included further down with the original coding.</span>`

`<span style="font-family:Tahoma;font-size:small;">XML Code</span>`

[code language=&#8221;xml&#8221;]</pre>  
<code></code>

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

<code>[/code]

</code>

`<span style="font-family:Tahoma;font-size:small;">And now I needed to add a Review Activity, again this is just the simple information needed. </span>`

`<span style="font-family:Tahoma;font-size:small;">XML Code</span>`

[code language=&#8221;xml&#8221;]</pre>  
<code></code>

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

<code>[/code]

</code>

`<span style="font-family:Tahoma;font-size:small;">So, all the components together created the XML file for the Projection that I needed.</span>`

`<span style="font-family:Tahoma;"><span style="font-size:small;">Ok, so this is ONE piece of the puzzle. In order for the CSV import to work within Service Manager, you need a CSV file as well. Building the CSV file is actually quite easy. Simple use all <code>`</span></span></code>

[code language=&#8221;xml&#8221;]   <Property ID =”..”> <code>[/code]

</code></pre> 

`<span style="font-family:Tahoma;"><span style="font-size:small;"><code><span style="font-family:Tahoma;font-size:small;">tags as CSV headers.</span>`</span></span></code>

`<span style="font-family:Tahoma;font-size:small;"><code><code><span style="font-family:Tahoma;"><span style="font-size:small;">Populate the file as needed. Now lets import the file. By the way, I have noticed that if the file is created in Excel (2013 at least) and saved a .csv, Excle uses “;” and NOT “,”. So simple open the application in Notepad and do a search and replace.</span></span>`</code></span></code>

`<span style="font-family:Tahoma;"><code><code><span style="font-family:Tahoma;font-size:small;">Sample file (CSV)</span>`</code></span></code>

`<code><code><span style="font-family:Tahoma;font-size:small;">Headers are based on Property values within the XML File.</span>`</code></code>

CR{0},CR notes,CR Title 1,CR Description 1,CR Contact Method,ChangePriorityEnum.Medium,ChangeImpactEnum.Standard,ChangeRiskEnum.Medium,CR Reason 1,FK,fletcherk,MA{0},0,MA Title 1,fk,fletcherk,MA{0},1,MA Title 2,fk,fletcherk,MA{0},2,MA Title 3,fk,fletcherk,MA{0},3,MA Title 4,fk,fletcherk,MA{0},4,MA Title 5,fk,fletcherk,MA{0},5,MA Title 6,fk,fletcherk,MA{0},6,MA Title 7,fk,fletcherk,RA{0},7,RA Title 1,fk,fletcherk

<span style="background-color:#ffff00;">Please note that the Sequence ID can be changed to sort you needs. Remember that the Sequence Number will start at 0. The MA is the prefix for the Manual Activities and the RA is the prefix for Review Activities, please adjust as needed.</span>

<span style="background-color:#ffff00;">Also, the {0} ensures id are incremented correctly.</span>

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/04/image_thumb.png" width="645" height="370" border="0" />][4] pl

<span style="font-size:small;">Select XML file and CSV file</span>

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/04/image_thumb1.png" width="648" height="345" border="0" />][5]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/04/image_thumb2.png" width="416" height="477" border="0" />][6]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/04/image_thumb3.png" width="596" height="451" border="0" />][7]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="image" alt="image" src="http://fskelly.files.wordpress.com/2013/04/image_thumb4.png" width="593" height="449" border="0" />][8]

You can import as many Change Requests as you wish using this method.

[(E-Mail me)][9]

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="image_thumb_thumb_thumb_thumb_thumb" alt="image_thumb_thumb_thumb_thumb_thumb" src="http://fskelly.files.wordpress.com/2013/02/image_thumb_thumb_thumb_thumb_thumb_thumb.png" width="184" height="32" border="0" />][10]

<span style="font-size:small;font-family:calibri;">Follow me.</span>

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="facebook-small322252222" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" border="0" /></span>][11] Facebook (Personal)

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="twitter-small322252222" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" border="0" /></span>][12]Twitter (Personal & System Center)

[<img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="scsmlogo25232" alt="scsmlogo25232" src="/wp-content/uploads/2013/02/scsmlogo25232.jpg" width="56" height="43" border="0" />][13] Twitter (System Center Focused)

<span style="font-size:small;font-family:calibri;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" border="0" /></a></span>

 [1]: http://www.netiviaconsulting.com/2012/05/04/importing-work-items-in-bulk-into-scsm2012-via-csv-import-connector/ "http://www.netiviaconsulting.com/2012/05/04/importing-work-items-in-bulk-into-scsm2012-via-csv-import-connector/"
 [2]: http://blogs.technet.com/b/servicemanager/archive/2009/05/26/using-the-csv-import-feature.aspx "http://blogs.technet.com/b/servicemanager/archive/2009/05/26/using-the-csv-import-feature.aspx"
 [3]: http://blogs.technet.com/b/servicemanager/archive/2009/05/26/appendix-a-to-previous-post.aspx
 [4]: http://fskelly.files.wordpress.com/2013/04/image.png
 [5]: http://fskelly.files.wordpress.com/2013/04/image1.png
 [6]: http://fskelly.files.wordpress.com/2013/04/image2.png
 [7]: http://fskelly.files.wordpress.com/2013/04/image3.png
 [8]: http://fskelly.files.wordpress.com/2013/04/image4.png
 [9]: mailto:systemcenterguyza@live.com
 [10]: /wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png
 [11]: http://www.facebook.com/fletcher.kelly
 [12]: http://twitter.com/#!/fskelly
 [13]: http://twitter.com/syscenterguyza