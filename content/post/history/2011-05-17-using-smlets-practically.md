---
title: Using SMLets practically
author: fskelly
type: post
date: 2011-05-17T11:27:51+00:00
url: /2011/05/17/using-smlets-practically/
tagazine-media:
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:0:{}s:6:"videos";a:0:{}s:11:"image_count";s:1:"0";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-05-17 11:27:51";}'
  - 'a:7:{s:7:"primary";s:0:"";s:6:"images";a:0:{}s:6:"videos";a:0:{}s:11:"image_count";s:1:"0";s:6:"author";s:8:"17089368";s:7:"blog_id";s:8:"16477603";s:9:"mod_stamp";s:19:"2011-05-17 11:27:51";}'
categories:
  - Technology
tags:
  - powershell
  - SCSM
  - SMLets

---
<font face="Calibri">In my previous post, </font>[<font face="Calibri">SCSM And Powershell</font>][1]<font face="Calibri">, I mentioned that I am now starting to play with get-scsmobject. In this post I also created a script. That script has now been evolved into a proper get-scsmobject script.</font>

<font face="Calibri"></font>

<div id="codeSnippetWrapper">
  <div id="codeSnippetWrapper">
    <div style="display:inline;float:none;margin:0;padding:0;" id="scid:57F11A72-B0E5-49c7-9094-E3A15BD5B5E6:c9e6a476-5e51-41b9-a15c-a7c6015ba97b" class="wlWriterEditableSmartContent">
      <pre style="background-color:#FFFFFF;overflow:auto;"><span style="color:#000000;">Import</span><span style="color:#000000;">-</span><span style="color:#000000;">Module smlets

</span><span style="color:#800080;">$Now</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> (get</span><span style="color:#000000;">-</span><span style="color:#000000;">date).AddDays(</span><span style="color:#000000;">-</span><span style="color:#000000;">7</span><span style="color:#000000;">)

</span><span style="color:#800080;">$CId</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> (Get</span><span style="color:#000000;">-</span><span style="color:#000000;">SCSMEnumeration </span><span style="color:#000000;">-</span><span style="color:#000000;">ComputerName </span><span style="color:#800000;">"</span><span style="color:#800000;">ms-ec-hdm01</span><span style="color:#800000;">"</span><span style="color:#000000;"> IncidentStatusEnum.Closed</span><span style="color:#000000;">$</span><span style="color:#000000;">).id

</span><span style="color:#800080;">$RId</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> (Get</span><span style="color:#000000;">-</span><span style="color:#000000;">SCSMEnumeration </span><span style="color:#000000;">-</span><span style="color:#000000;">ComputerName </span><span style="color:#800000;">"</span><span style="color:#800000;">ms-ec-hdm01</span><span style="color:#800000;">"</span><span style="color:#000000;"> IncidentStatusEnum.Resolved</span><span style="color:#000000;">$</span><span style="color:#000000;">).id


</span><span style="color:#800080;">$Class</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> Get</span><span style="color:#000000;">-</span><span style="color:#000000;">SCSMClass </span><span style="color:#000000;">-</span><span style="color:#000000;">ComputerName </span><span style="color:#800000;">"</span><span style="color:#800000;">ms-ec-hdm01</span><span style="color:#800000;">"</span><span style="color:#000000;"> System.WorkItem.Incident</span><span style="color:#000000;">$</span><span style="color:#000000;">

</span><span style="color:#800080;">$cType</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800000;">"</span><span style="color:#800000;">Microsoft.EnterpriseManagement.Common.EnterpriseManagementObjectCriteria</span><span style="color:#800000;">"</span><span style="color:#000000;">

</span><span style="color:#008000;">#</span><span style="color:#008000;">$cString = "Status != '$CId' and Status != '$RId' and TargetResolutionTime &lt; '$Now' and TargetResolutionTime Is Not Null"</span><span style="color:#008000;">
</span><span style="color:#800080;">$cStringClosed</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800000;">"</span><span style="color:#800000;">Status = '$CId'and CreatedDate &gt;'$Now'</span><span style="color:#800000;">"</span><span style="color:#000000;">
</span><span style="color:#800080;">$cStringResolved</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800000;">"</span><span style="color:#800000;">Status = '$RId'and CreatedDate &gt;'$Now'</span><span style="color:#800000;">"</span><span style="color:#000000;">
</span><span style="color:#800080;">$cStringAll</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800000;">"</span><span style="color:#800000;">CreatedDate &gt;'$Now'</span><span style="color:#800000;">"</span><span style="color:#000000;">

</span><span style="color:#800080;">$critClosed</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> new</span><span style="color:#000000;">-</span><span style="color:#000000;">object </span><span style="color:#800080;">$cType</span><span style="color:#000000;"> </span><span style="color:#800080;">$cStringClosed</span><span style="color:#000000;">,</span><span style="color:#800080;">$Class</span><span style="color:#000000;">
</span><span style="color:#800080;">$critResolved</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> new</span><span style="color:#000000;">-</span><span style="color:#000000;">object </span><span style="color:#800080;">$cType</span><span style="color:#000000;"> </span><span style="color:#800080;">$cStringResolved</span><span style="color:#000000;">,</span><span style="color:#800080;">$Class</span><span style="color:#000000;">
</span><span style="color:#800080;">$critAll</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> new</span><span style="color:#000000;">-</span><span style="color:#000000;">object </span><span style="color:#800080;">$cType</span><span style="color:#000000;"> </span><span style="color:#800080;">$cStringOther</span><span style="color:#000000;">,</span><span style="color:#800080;">$Class</span><span style="color:#000000;">

</span><span style="color:#800080;">$closed</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> Get</span><span style="color:#000000;">-</span><span style="color:#000000;">SCSMObject </span><span style="color:#000000;">-</span><span style="color:#000000;">ComputerName </span><span style="color:#800000;">"</span><span style="color:#800000;">ms-ec-hdm01</span><span style="color:#800000;">"</span><span style="color:#000000;"> </span><span style="color:#000000;">-</span><span style="color:#000000;">Criteria </span><span style="color:#800080;">$critClosed</span><span style="color:#000000;"> 

</span><span style="color:#800080;">$resolved</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> Get</span><span style="color:#000000;">-</span><span style="color:#000000;">SCSMObject </span><span style="color:#000000;">-</span><span style="color:#000000;">ComputerName </span><span style="color:#800000;">"</span><span style="color:#800000;">ms-ec-hdm01</span><span style="color:#800000;">"</span><span style="color:#000000;"> </span><span style="color:#000000;">-</span><span style="color:#000000;">Criteria </span><span style="color:#800080;">$critResolved</span><span style="color:#000000;"> 

</span><span style="color:#800080;">$all</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> Get</span><span style="color:#000000;">-</span><span style="color:#000000;">SCSMObject </span><span style="color:#000000;">-</span><span style="color:#000000;">ComputerName </span><span style="color:#800000;">"</span><span style="color:#800000;">ms-ec-hdm01</span><span style="color:#800000;">"</span><span style="color:#000000;"> </span><span style="color:#000000;">-</span><span style="color:#000000;">Criteria </span><span style="color:#800080;">$critAll</span><span style="color:#000000;"> 

</span><span style="color:#008000;">#</span><span style="color:#008000;">$all = Get-SCSMObject -ComputerName "ms-ec-hdm01" -Class (Get-SCSMClass -ComputerName "ms-ec-hdm01" System.WorkItem.Incident$)</span><span style="color:#008000;">
</span><span style="color:#000000;">
</span><span style="color:#800080;">$closedcount</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800080;">$closed</span><span style="color:#000000;">.count
</span><span style="color:#800080;">$resolvedcount</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800080;">$resolved</span><span style="color:#000000;">.count
</span><span style="color:#800080;">$allcount</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800080;">$all</span><span style="color:#000000;">.count
</span><span style="color:#800080;">$othercount</span><span style="color:#000000;"> </span><span style="color:#000000;">=</span><span style="color:#000000;"> </span><span style="color:#800080;">$allcount</span><span style="color:#000000;"> </span><span style="color:#000000;">-</span><span style="color:#000000;"> </span><span style="color:#800080;">$closedcount</span><span style="color:#000000;"> </span><span style="color:#000000;">-</span><span style="color:#000000;"> </span><span style="color:#800080;">$resolvedcount</span><span style="color:#000000;">
write</span><span style="color:#000000;">-</span><span style="color:#000000;">host </span><span style="color:#800000;">"</span><span style="color:#800000;">all calls:</span><span style="color:#800000;">"</span><span style="color:#000000;">  </span><span style="color:#800080;">$allcount</span><span style="color:#000000;">
Write</span><span style="color:#000000;">-</span><span style="color:#000000;">host </span><span style="color:#800000;">"</span><span style="color:#800000;">closed calls:</span><span style="color:#800000;">"</span><span style="color:#000000;"> </span><span style="color:#800080;">$closedcount</span><span style="color:#000000;">
write</span><span style="color:#000000;">-</span><span style="color:#000000;">host </span><span style="color:#800000;">"</span><span style="color:#800000;">resolved calls:</span><span style="color:#800000;">"</span><span style="color:#000000;"> </span><span style="color:#800080;">$resolvedcount</span><span style="color:#000000;">
write</span><span style="color:#000000;">-</span><span style="color:#000000;">host </span><span style="color:#800000;">"</span><span style="color:#800000;">other calls:</span><span style="color:#800000;">"</span><span style="color:#000000;"> </span><span style="color:#800080;">$othercount</span></pre>
      
      <p>
        <!-- Code inserted with Steve Dunn's Windows Live Writer Code Formatter Plugin.  http://dunnhq.com --></div> 
        
        <p>
          </div> 
          
          <p>
            <font face="Calibri">The updated file can also be found here </font><a href="http://gallery.technet.microsoft.com/E-Mail-breakdown-of-SCSM-f1474d40"><font face="Calibri">E-Mail breakdown of calls using get-scsmobject</font></a><font face="Calibri">, this makes the execution far quicker.<br /> <br /></font></div> 
            
            <p>
              <font face="Calibri">Some handy Active Directory powershell scripts to follow</font>
            </p>

 [1]: http://fskelly.wordpress.com/2011/05/10/scsm-and-powershell/