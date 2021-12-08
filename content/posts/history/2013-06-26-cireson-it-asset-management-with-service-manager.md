+++
type = "post"
author = "Fletcher Kelly"
title = "Cireson IT Asset Management with Service Manager"
date = "2013-06-26T10:23:48+00:00"
tags = [
  "ITAM",
  "Cireson"
]
categories = [
  "Service Manager"
]
+++

<!-- CANBEPUBLISHED -->

[Cireson](https://www.cireson.com) have recently released an new enhancement to the [System Centre Service Manager](https://docs.microsoft.com/en-us/system-center/scsm/service-manager?view=sc-sm-2019) console called the [Cireson SCSM Asset Management App](https://cireson.com/products/asset-management-stream/asset-management/). This particular application is very easy to install. To install the application into the console, it is simply a case of importing a few management packs and some XML files and DLL files. This is very easy to do and the installation instructions provided by [Cireson](https://www.cireson.com) are very simple and easy to follow as with all [Cireson](https://www.cireson.com) add-ins I have worked with in the past.

In order to get the full benefit from the [Cireson SCSM Asset Management App](https://cireson.com/products/asset-management-stream/asset-management/), I would highly recommend that the [Configuration Manager Connector][4] be enabled within your environment. However, this is NOT a necessity. Within my environment as I run mine as a Lab, it is not always possible to have all the connectors enabled all the time. I was very easily able to configure my workflows (come with the [Cireson SCSM Asset Management App](https://cireson.com/products/asset-management-stream/asset-management/) to work and pull in the required information. 

A sample of my workflow configuration is below. The workflows and settings for the [Cireson SCSM Asset Management App](https://cireson.com/products/asset-management-stream/asset-management/) are found under the Administration Wunderbar and then settings as with all [Cireson](http://www.cireson.com/app-store/) applications.

There are settings for both Software and Hardware Collections.

Software
{{< figure src="/wp-content/uploads/2013/06/image_thumb-1.png" width="595" height="90" >}}

Hardware
{{< figure src="/wp-content/uploads/2013/06/image_thumb1.png" width="595" height="90" >}}

A little lower down on the Hardware tab, this is where the [Configuration Manager Connector](https://docs.microsoft.com/en-us/previous-versions/system-center/service-manager-2010-sp1/ff460951(v=technet.10)?redirectedfrom=MSDN) would add a tremendous amount of value as you can reference different&#160; value to be used as a Hardware ID. So, if you had the [Configuration Manager Connector](https://docs.microsoft.com/en-us/previous-versions/system-center/service-manager-2010-sp1/ff460951(v=technet.10)?redirectedfrom=MSDN) enabled, you could reference a Serial Number or Asset Tag. However, it is perfectly feasible to reference Principal name.

{{< figure src="/wp-content/uploads/2013/06/image_thumb2.png" width="595" height="90" >}}

Under the "Miscellaneous "tab, is where the logging is configured, which is amazingly helpful for troubleshooting.
{{< figure src="/wp-content/uploads/2013/06/image_thumb3-1.png" width="595" height="90" >}}

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)