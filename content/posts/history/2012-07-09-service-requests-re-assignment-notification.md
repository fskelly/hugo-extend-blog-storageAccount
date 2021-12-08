---
title: Service Requests – Re-assignment notification
author: fskelly
type: post
date: 2012-07-09T05:43:13+00:00
url: /2012/07/09/service-requests-re-assignment-notification/
categories:
  - System Center
tags:
  - Assignment
  - Management Pack
  - Service Manager
  - XML

---
<span style="font-family:Calibri;">So, in an effort to get my business ready for Service Requests as we use mainly Incidents and we are beginning our journey into Service Requests and differentiating between Service Requests (day to day operations) and Incidents (something is broken), I needed to reproduce a workflow to notify the “AssignedToUser” when a new Service Request is assigned to him or her. I already had a downloaded Management Pack for Incident Re-assignment notifications which was modified for my purposes, so this was a good place to start. I found </span>[<span style="font-family:Calibri;">these management packs</span>][1] <span style="font-family:Calibri;">as a nice start as well. I have since modified these to create a Service Request Re-Assignment Management Pack, as with all my searching, I could not find ANYTHING!!!! </span>

<span style="font-family:Calibri;">So using the idea from the </span>[<span style="font-family:Calibri;">this site</span>][1]<span style="font-family:Calibri;">, I ran the SQL command from the blog.</span>

[sourcecode language=&#8221;sql&#8221;]

SELECT TOP 1000 [ObjectTemplateId]  
,[ManagementPackId]  
,[ObjectTemplateName]  
,[Accessibility]  
,[ObjectTemplateTypeId]  
,[ObjectTemplateSubelementXML]  
,[TimeAdded]  
,[LastModified]  
FROM [ServiceManager].[dbo].[ObjectTemplate]

[/sourcecode]

<span style="font-family:Calibri;">I got some very strange results, as the MP XML I used, needs a GUID for the Template. So, another challenge, no worries. I took all the data from the SQL query and pasted it into Excel. So now, I have noticed that tracking down a GUID for a Template in a Custom MP is not the easiest. I ended up looking at the “Property Field” and was able to determine the Template I needed from the information in the “property field” due to the “Subject” line in my e-mail template. So I copied the GUID. Imported the MP and voila!!! it works like a charm. </span>

<span style="font-family:Calibri;">If you would like this Management Pack, it is located </span>[<span style="font-family:Calibri;">here</span>][2] <span style="font-family:Calibri;">as a .docx file. XML code below. </span>

[sourcecode language=&#8221;xml&#8221;]<?xml version="1.0" encoding="utf-8"?>  
<ManagementPack ContentReadable="true" SchemaVersion="1.1" OriginalSchemaVersion="1.1" xmlns:xsd="<a href="http://www.w3.org/2001/XMLSchema">http://www.w3.org/2001/XMLSchema</a>" xmlns:xsl="<a href="http://www.w3.org/1999/XSL/Transform">http://www.w3.org/1999/XSL/Transform</a>">  
<Manifest>  
<Identity>  
<ID>Custom.ServiceRequestAssignmentChanges.Notification</ID>  
<Version>7.0.6555.0</Version>  
</Identity>  
<Name>Service Request Assignment Changes Notification Workflow</Name>  
<References>  
<Reference Alias="WorkItem">  
<ID>System.WorkItem.Library</ID>  
<Version>7.0.6555.0</Version>  
<PublicKeyToken>31bf3856ad364e35</PublicKeyToken>  
</Reference>  
<Reference Alias="ServiceRequest">  
<ID>ServiceManager.ServiceRequest.Library</ID>  
<Version>7.0.6555.0</Version>  
<PublicKeyToken>31bf3856ad364e35</PublicKeyToken>  
</Reference>  
<Reference Alias="CoreChange">  
<ID>System.WorkItem.ServiceRequest.Library</ID>  
<Version>7.0.6555.0</Version>  
<PublicKeyToken>31bf3856ad364e35</PublicKeyToken>  
</Reference>  
<Reference Alias="SystemCenter">  
<ID>Microsoft.SystemCenter.Subscriptions</ID>  
<Version>7.0.6555.0</Version>  
<PublicKeyToken>31bf3856ad364e35</PublicKeyToken>  
</Reference>  
<Reference Alias="EnterpriseManagement1">  
<ID>Microsoft.EnterpriseManagement.ServiceManager.UI.Administration</ID>  
<Version>7.0.6555.0</Version>  
<PublicKeyToken>31bf3856ad364e35</PublicKeyToken>  
</Reference>  
<Reference Alias="EnterpriseManagement">  
<ID>Microsoft.EnterpriseManagement.ServiceManager.UI.Console</ID>  
<Version>7.0.6555.0</Version>  
<PublicKeyToken>31bf3856ad364e35</PublicKeyToken>  
</Reference>  
<Reference Alias="System">  
<ID>System.Library</ID>  
<Version>7.0.6555.0</Version>  
<PublicKeyToken>31bf3856ad364e35</PublicKeyToken>  
</Reference>  
</References>  
</Manifest>  
<Categories>  
<Category ID="Category.Custom.ServiceRequestAssignmentChanges.Notification.ManagementPack" Value="EnterpriseManagement!Microsoft.EnterpriseManagement.ServiceManager.ManagementPack">  
<ManagementPackName>Custom.ServiceRequestAssignmentChanges.Notification</ManagementPackName>  
<ManagementPackVersion>7.0.6555.0</ManagementPackVersion>  
</Category>  
<Category ID="Category.ServiceRequestAssignmentChanges" Target="ServiceRequestAssignmentChanges" Value="EnterpriseManagement1!Microsoft.EnterpriseManagement.ServiceManager.Rules.WorkflowSubscriptions" />  
</Categories>  
<Monitoring>  
<Rules>  
<Rule ID="ServiceRequestAssignmentChanges" Enabled="true" Target="ServiceRequest!System.WorkItem.ServiceRequest.WorkflowTarget" ConfirmDelivery="true" Remotable="true" Priority="Normal" DiscardLevel="100">  
<Category>System</Category>  
<DataSources>  
<DataSource ID="DS" TypeID="SystemCenter!Microsoft.SystemCenter.CmdbInstanceSubscription.DataSourceModule">  
<Subscription>  
<RelationshipSubscription RelType="$MPElement[Name=&#8217;WorkItem!System.WorkItemAssignedToUser&#8217;]$" SourceType="$MPElement[Name=&#8217;CoreChange!System.WorkItem.ServiceRequest&#8217;]$" TargetType="$MPElement[Name=&#8217;System!System.Domain.User&#8217;]$">  
<AddRelationship />  
</RelationshipSubscription>  
<PollingIntervalInSeconds>30</PollingIntervalInSeconds>  
<BatchSize>100</BatchSize>  
</Subscription>  
</DataSource>  
</DataSources>  
<WriteActions>  
<WriteAction ID="WA" TypeID="SystemCenter!Microsoft.EnterpriseManagement.SystemCenter.Subscription.WindowsWorkflowTaskWriteAction">  
<Subscription>  
<EnableBatchProcessing>false</EnableBatchProcessing>  
<WindowsWorkflowConfiguration>  
<AssemblyName>Microsoft.EnterpriseManagement.WorkflowFoundation</AssemblyName>  
<WorkflowTypeName>Microsoft.EnterpriseManagement.WorkflowFoundation.ConfigurationWorkflow</WorkflowTypeName>  
<WorkflowParameters>  
<WorkflowParameter Name="InstanceId" Type="guid">$Data/BaseManagedEntityId$  
</WorkflowParameter>  
<WorkflowArrayParameter Name="NotificationTemplateIdList" Type="guid">  
<Item>82E39128-77DF-905B-C782-5FCEDFD2F990</Item>  
</WorkflowArrayParameter>  
<Item>$MPElement[Name=&#8217;WorkItem!System.WorkItemAssignedToUser&#8217;]$</Item>  
</WorkflowParameters>  
<RetryExceptions />  
<RetryDelaySeconds>60</RetryDelaySeconds>  
<MaximumRunningTimeSeconds>1500</MaximumRunningTimeSeconds>  
</WindowsWorkflowConfiguration>  
</Subscription>  
</WriteAction>  
</WriteActions>  
</Rule>  
</Rules>  
</Monitoring>  
<LanguagePacks>  
<LanguagePack ID="ENU" IsDefault="true">  
<DisplayStrings>  
<DisplayString ElementID="Custom.ServiceRequestAssignmentChanges.Notification">  
<Name>Custom Service Manager Service Request Assignment Changes Notification Workflow</Name>  
<Description>Service Manager Service Request Assignment Changes Workflow</Description>  
</DisplayString>  
<DisplayString ElementID="ServiceRequestAssignmentChanges">  
<Name>Service Request Assignment Notification</Name>  
</DisplayString>  
</DisplayStrings>  
</LanguagePack>  
</LanguagePacks>  
</ManagementPack>[/sourcecode]

<span style="font-family:Calibri;">Hope this helps someone else as well,</span>

<span style="font-family:Calibri;font-size:small;">Follow me.</span>

[<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="facebook-small322252222" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" border="0" /></span>][3][<span style="font-family:Calibri;font-size:small;"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" title="twitter-small322252222" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" border="0" /></span>][4]

<span style="font-family:Calibri;font-size:small;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" title="MCC11_Logo_Horizontal_2-color_thumb_" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" border="0" /></a></span>

 [1]: http://www.bctechnet.com/custom-notification-workflow-on-work-item-assignment/
 [2]: http://fskelly.files.wordpress.com/2012/07/custom-servicerequestassignmentchanges-notification.docx
 [3]: http://www.facebook.com/fletcher.kelly
 [4]: http://twitter.com/#!/fskelly