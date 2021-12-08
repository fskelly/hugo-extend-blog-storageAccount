+++
type = "post"
author = "Fletcher Kelly"
title = "Import CI Items with Cireson Asset Import Tool"
date = "2013-05-17T05:10:29+00:00"
tags = [
  "ITAM",
  "Asset Import",
  "CSV Import",
  "Cireson"
]
categories = [
  "Service Manager"
]
+++

<!-- CANBEPUBLISHED -->

With my [previous post](/posts/history/2013-04-23-importing-data-into-service-managercsv-import-and-xml) about importing data, I showed you how to use the built-in CSV connector to do this task and how to create the required Projection Classes. However if you are looking for a quicker more automated to achieve this, enter [Cireson](https://www.cireson.com) and their [Asset Import Tool.](http://www.cireson.com/app-store/scsm-asset-import/) It takes all the guess work out of the import process and handles the Projection Classes for you.

The installation of the application is easy and requires the copying a DLL file to the Service Manager Installation folder and the import of a Management Pack ( a management Pack Bundle in this case). The instructions provided with the application are very clear and concise.

As usual with the Cireson applications, the settings for the applications can be found and tweaked in the Administration | Settings. This time, this is where the License Key will need to be entered.  
{{< figure src="/wp-content/uploads/2013/05/image_thumb6-1.png" width="595" height="90" >}}

So now, onto the “meat”. Let’s actually use the application and see how it works. The application works pretty much the same way as the CSV Connector. It is classified as a connector, and as such to use it, a new connector would need to be created. Connectors are found under Administration | Connectors

{{< figure src="/wp-content/uploads/2013/05/image_thumb7-1.png" width="595" height="90" >}}

If you have any Projection or Combinations classes you would like to use the application does allow the use of this.
{{< figure src="/wp-content/uploads/2013/05/image_thumb8.png" width="595" height="90" >}}

For this demo, I have used the Windows Computer Class, additional information around the Projection classes, this will allow to see the information (headers) used by the required class. The Windows Computer class has the following information.

Name | Type | MinLength | MaxLength | AutoIncrement
---------|----------|---------|---------|---------
PrincipalName | string | 0 | 256 | False
DNSName | string | 0 | 256 | False
NetbiosComputerName | string | 0 | 256 | False
NetbiosDomainName | string | 0 | 256 | False
IPAddress | string | 0 | 256 | False
NetworkName | string | 0 | 256 | False
ActiveDirectoryObjectSid | string | 0 | 256 | False
IsVirtualMachine | string | 0 | 256 | False
DomainDnsName | string | 0 | 256 | False
OrganizationalUnit | string | 0 | 256 | False
ForestDnsName | string | 0 | 256 | False
ActiveDirectorySite | string | 0 | 256 | False
OffsetInMinuteFromGreenwichTime | int (range: [-2147483648, 2147483647]) | 0 | 256 | False
LastInventoryDate | datetime | 0 | 256 | False
ObjectStatus | enum:System.ConfigItem.ObjectStatusEnum | 0 | 256 | False
AssetStatus | enum:System.ConfigItem.AssetStatusEnum | 0 | 256 | False
Notes | richtext | 0 | 256 | False
DisplayName | string | 0 | 256 | False

So, for this, I will bulk import a few computers with only a few simple parameters.

I am simply adding two machines

{{< figure src="/wp-content/uploads/2013/05/image9.png" width="595" height="90" >}}

The [Asset Import Tool](http://www.cireson.com/app-store/scsm-asset-import/) also allows you to test your configuration first.

{{< figure src="/wp-content/uploads/2013/05/image_thumb10-1.png" width="595" height="90" >}}

Now we can map the Headers to the Projections, you will see I kept them the same, however if you are getting a file from the IT Department or any other department, this step here allows to map these correctly.

{{< figure src="/wp-content/uploads/2013/05/image_thumb11.png" width="595" height="90" >}}

Next, you can set your frequency, allowing you to automate the import. I have configured mine to run Every Hour.

{{< figure src="/wp-content/uploads/2013/05/image12.png" width="595" height="90" >}}

Then you can create the connector.
Final Connector completed.

{{< figure src="/wp-content/uploads/2013/05/image13.png" width="595" height="90" >}}

Now lets run it!!!!

{{< figure src="/wp-content/uploads/2013/05/image14.png" width="595" height="90" >}}

Since we enabled the option to “Test”, the results were written to a log file allowing us to test before running in a production environment.

{{< figure src="/wp-content/uploads/2013/05/image15.png" width="595" height="90" >}}

All looks good, let’s run it to bring in the data. A simple change needs to be made. We just need to remove a checkbox.

{{< figure src="/wp-content/uploads/2013/05/image16.png" width="595" height="90" >}}

Ok, change made. let’s import the data. So now, let’s re-run the import process.The Connector has now re-run, now we can check the data. This time without the testing.

{{< figure src="/wp-content/uploads/2013/05/image17-1.png" width="595" height="90" >}}

Now, we can see the new imported data. We can check here under Configuration Items | Computers | All Windows Computers

{{< figure src="/wp-content/uploads/2013/05/image18.png" width="595" height="90" >}}

And there we have it, importing nice and easy.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
