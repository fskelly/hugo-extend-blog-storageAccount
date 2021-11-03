---
title: Scheduled reports with SCSM Data Warehouse
author: fskelly
type: post
date: 2011-10-26T10:26:01+00:00
url: /2011/10/26/scheduled-reports-with-scsm-data-warehouse/
categories:
  - System Center
tags:
  - Reporting Services
  - SCSM
  - Service Manager
  - System Centre

---
&#160;

Hi All,

I know it has been a little while. 

The reports built into Service Manager are great, however when you try to get a bit creative and automate some of the reports, you are going to run into some issues. So to work around theses issues, I did the following.

Create a custom report from SQL Reporting Services and modified for my needs, I was focusing more on “Incident Analyst” and I was looking for a breakdown of the number of Incidents per Analysts in a week period. This becomes tricky as the Analyst wanted this to be automated for reporting purposes.

1. If you using SQL 2008 R2, Report Builder 3 will be available to you from the SSRS webpage.

2. Select File, Open, drill down to System Center\ServiceManager\ServiceManager.Console.Reporting.IncidentManagement and select 

> ServiceManager.Report.IncidentManagement.IncidentAnalystReport
> 
> This time it opens OK – let’s try and do a “Save As”, just to see what we can do with a report.
> 
> The first error is complaining about a mismatch between allowed values and the default for the TimeZone parameter:
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image001" border="0" alt="clip_image001" src="http://fskelly.files.wordpress.com/2011/10/clip_image001_thumb.jpg" width="244" height="130" />][1]
> 
> To “correct this” go to Parameters, TimeZone – double-click it.
> 
> Select the Default Values and change the option to No default Value:
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image002" border="0" alt="clip_image002" src="http://fskelly.files.wordpress.com/2011/10/clip_image002_thumb.jpg" width="244" height="200" />][2]
> 
> Click OK and select Save As (Don’t forget to change the report name again as it would appear that when a failed save occurs then the original name is used – and thus you may make a change to the default report).
> 
> The next error again concerns a defaultvalue for the EndDate_OffsetValue parameter this time.
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image003" border="0" alt="clip_image003" src="http://fskelly.files.wordpress.com/2011/10/clip_image003_thumb.jpg" width="244" height="131" />][3]
> 
> Again change the Default Value of this parameter to No Default Value
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image004" border="0" alt="clip_image004" src="http://fskelly.files.wordpress.com/2011/10/clip_image004_thumb.jpg" width="244" height="200" />][4]
> 
> Again attempt the Save As (again check the name).&#160; This time it should succeed.
> 
> So now we effectively have a report that we can manipulate to utilise a variable parameter for the StartDate and EndDate values.
> 
> Double-click the StartDate_BaseValue parameter. Click the Default Values option and select “Specify values”
> 
> Click Add and strike the (Null) that appears in the Value form.
> 
> Click the function button 
> 
> In the Category chooser, select “Common Functions” “Date & Time”
> 
> Locate the “Today” item and double-click it.
> 
> Close the bracket in the “Set expression for Value option:
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image005" border="0" alt="clip_image005" src="http://fskelly.files.wordpress.com/2011/10/clip_image005_thumb.jpg" width="244" height="221" />][5]
> 
> Click OK.
> 
> Repeat this step for the EndDate_BaseValue Parameter.
> 
> Now make the change to the StartDate_OffsetType to switch the interval from the past month to the past week.
> 
> Double-click StartDate_OffsetType, select Default Values and change the Value option from Month to Week.
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image006" border="0" alt="clip_image006" src="http://fskelly.files.wordpress.com/2011/10/clip_image006_thumb.jpg" width="244" height="201" />][6]
> 
> So back to Report Manager – drill down to the new report and open it up.&#160; Run the report using the View Report button – no results returned.
> 
> Check the NULL option for Incident IDs
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image007" border="0" alt="clip_image007" src="http://fskelly.files.wordpress.com/2011/10/clip_image007_thumb.jpg" width="244" height="42" />][7]
> 
> And now re-run – data as expected.&#160; The Challenge now is to select the NULL option for a scheduled report as opposed to the interactive one.
> 
> Click “New Subscription”
> 
> Populate the Report Delivery Options and Subscription Processing Options as required&#160; &#8211; I used a File Share (NB it needs a UNC [\\server\share][8]) and just set up a schedule in 5 mins time to use an HTML 4 report.&#160; (NB You will need to repeat the password for the account that will write the report after you have clicked the schedule button as it loses the password and saving the subscription will fail)
> 
> Then in the Report Parameter Values ensure the following two options are selected.&#160; NB Do not set these in the Properties, Parameters option of Report Manager as they have a different impact.
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="clip_image008" border="0" alt="clip_image008" src="http://fskelly.files.wordpress.com/2011/10/clip_image008_thumb.jpg" width="244" height="54" />][9]
> 
> [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="clip_image009" border="0" alt="clip_image009" src="http://fskelly.files.wordpress.com/2011/10/clip_image009_thumb.jpg" width="244" height="56" />][10]
> 
> Save the changes and wait for the report to run – this should now pick up the correct “current” date and provide a week’s worth of data!

3. Now, you try to run the report and under “Assigned To User”, you try to use UPN names or Display Names and nothing seems to work! This is because the Report is actually looking for a UserDimkey, this can be seen in this [post][11]. So how do you get this information. SQL is your friend.

4. Open SQL Management Studio on the Data Warehouse Server and run the following command substituting the User Display name you want to find the UserDimKey for.

> /\***\*\\*\* Script for SelectTopNRows command from SSMS&#160; \*\*\****/  
> SELECT TOP 1000 [AssetStatus]  
> &#160;&#160;&#160;&#160;&#160; ,[AssetStatus_ConfigItemAssetStatusId]  
> &#160;&#160;&#160;&#160;&#160; ,[BaseManagedEntityId]  
> &#160;&#160;&#160;&#160;&#160; ,[BusinessPhone]  
> &#160;&#160;&#160;&#160;&#160; ,[BusinessPhone2]  
> &#160;&#160;&#160;&#160;&#160; ,[City]  
> &#160;&#160;&#160;&#160;&#160; ,[Company]  
> &#160;&#160;&#160;&#160;&#160; ,[Country]  
> &#160;&#160;&#160;&#160;&#160; ,[Department]  
> &#160;&#160;&#160;&#160;&#160; ,[DisplayName]  
> &#160;&#160;&#160;&#160;&#160; ,[DistinguishedName]  
> &#160;&#160;&#160;&#160;&#160; ,[Domain]  
> &#160;&#160;&#160;&#160;&#160; ,[EmployeeId]  
> &#160;&#160;&#160;&#160;&#160; ,[EntityDimKey]  
> &#160;&#160;&#160;&#160;&#160; ,[Fax]  
> &#160;&#160;&#160;&#160;&#160; ,[FirstName]  
> &#160;&#160;&#160;&#160;&#160; ,[FQDN]  
> &#160;&#160;&#160;&#160;&#160; ,[HomePhone]  
> &#160;&#160;&#160;&#160;&#160; ,[HomePhone2]  
> &#160;&#160;&#160;&#160;&#160; ,[Initials]  
> &#160;&#160;&#160;&#160;&#160; ,[InsertedBatchId]  
> &#160;&#160;&#160;&#160;&#160; ,[IsDeleted]  
> &#160;&#160;&#160;&#160;&#160; ,[LastName]  
> &#160;&#160;&#160;&#160;&#160; ,[Mobile]  
> &#160;&#160;&#160;&#160;&#160; ,[Notes]  
> &#160;&#160;&#160;&#160;&#160; ,[ObjectStatus]  
> &#160;&#160;&#160;&#160;&#160; ,[ObjectStatus_ConfigItemObjectStatusId]  
> &#160;&#160;&#160;&#160;&#160; ,[Office]  
> &#160;&#160;&#160;&#160;&#160; ,[Pager]  
> &#160;&#160;&#160;&#160;&#160; ,[SID]  
> &#160;&#160;&#160;&#160;&#160; ,[SourceId]  
> &#160;&#160;&#160;&#160;&#160; ,[State]  
> &#160;&#160;&#160;&#160;&#160; ,[StreetAddress]  
> &#160;&#160;&#160;&#160;&#160; ,[Title]  
> &#160;&#160;&#160;&#160;&#160; ,[UpdatedBatchId]  
> &#160;&#160;&#160;&#160;&#160; ,[UPN]  
> &#160;&#160;&#160;&#160;&#160; ,[UserDimKey]  
> &#160;&#160;&#160;&#160;&#160; ,[UserName]  
> &#160;&#160;&#160;&#160;&#160; ,[Zip]  
> &#160; FROM [DWDataMartR2].[dbo].[UserDimvw] where [DisplayName] = <font>‘DisplayNameofUserInActiveDirectory</font>

<font>5. Once you have this value(s), you can add these value(s) to your report and schedule them successfully.</font>

<font></font>

<font>Hope this helps,</font>

Follow me

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;margin:0;" title="facebook-small3222" border="0" alt="facebook-small3222" src="http://fskelly.files.wordpress.com/2011/10/facebook-small3222.jpg" width="44" height="44" />][12] [<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="twitter-small3222" border="0" alt="twitter-small3222" src="http://fskelly.files.wordpress.com/2011/10/twitter-small3222.jpg" width="44" height="44" />][13]

 [1]: http://fskelly.files.wordpress.com/2011/10/clip_image001.jpg
 [2]: http://fskelly.files.wordpress.com/2011/10/clip_image002.jpg
 [3]: http://fskelly.files.wordpress.com/2011/10/clip_image003.jpg
 [4]: http://fskelly.files.wordpress.com/2011/10/clip_image004.jpg
 [5]: http://fskelly.files.wordpress.com/2011/10/clip_image005.jpg
 [6]: http://fskelly.files.wordpress.com/2011/10/clip_image006.jpg
 [7]: http://fskelly.files.wordpress.com/2011/10/clip_image007.jpg
 [8]: ///\\server\share
 [9]: http://fskelly.files.wordpress.com/2011/10/clip_image008.jpg
 [10]: http://fskelly.files.wordpress.com/2011/10/clip_image009.jpg
 [11]: http://blogs.technet.com/b/servicemanager/archive/2011/03/14/service-manager-data-warehouse-schema-now-available.aspx
 [12]: http://www.facebook.com/fletcher.kelly
 [13]: http://twitter.com/#!/fskelly