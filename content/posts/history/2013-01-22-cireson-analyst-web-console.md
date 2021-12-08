+++
type = "post"
author = "Fletcher Kelly"
title = "Cireson Analyst Web Console"
date = "2013-01-22T09:32:19+00:00"
tags = [
  "Cireson"
  "Console"
  "Web Console"
]
categories = [
  "System Center Service Manager",
  "System Center"
]
+++

<!-- CANBEPUBLISHED -->

I have always heard complaints from some of the analysts in my company about having to install the Service Manager Console on their machines and then complaining about having to learn a new application.

So, I went searching around and found a great application called [Cireson SCSM Web Console](http://www.cireson.com/app-store/scsm-web-console/), this allows analysts to update Incidents via a newly designed web portal for Analysts. Since the console is designed in HTML5, the web console is browser agnostic. This face also helps some companies to adopt this as it allows analysts to use all types of devices to update incidents.

The guide provided to install the application is Comprehensive and easy to follow. Just make sure you do all the steps. I have added some screenshots of errors I got along the way, trying to "jump the gun" and see the new Web Console in action.

"Issues and Errors" I ran into, all of which are easily fixed.

**Server error in '/' Application**
{{< figure src="/wp-content/uploads/2013/01/image_thumb.png" >}}

This error is pretty much self-explanatory, I tried to open the console before the Cireson Management Pack had been imported. A simple fix, import the Management Pack.

{{< figure src="/wp-content/uploads/2013/01/image_thumb1.png" >}}

Again, this looks intimidating. This is very easy to fix if you look at error. When you are going through the installation guide, it is very easy to miss a step. Like this, when configuring the web.config file with Active Directory Connector information, it is very easy to find the space for the DN Name of your domain. When the above happens, it is simple a case of not adding the full DN for a **DOMAIN CONTROLLER**.

But now, onto the console in action. Just one side note, for now the [Cireson SCSM Web Console](http://www.cireson.com/app-store/scsm-web-console/) handles only incidents, I have heard that plans are in progress for the [Cireson SCSM Web Console](http://www.cireson.com/app-store/scsm-web-console/) to be extended to include Service Requests and potentially Problems, WOW!!!!!!

The [Cireson SCSM Web Console](http://www.cireson.com/app-store/scsm-web-console/) is really easy to navigate and very easy to understand, anything you can do in the actual console, you can do on the [Cireson SCSM Web Console](http://www.cireson.com/app-store/scsm-web-console/). So, if you make the [Cireson SCSM Web Console](http://www.cireson.com/app-store/scsm-web-console/) publically available, your Analysts can update from anywhere with any device as the Web Console is NOT dependent on Microsoft Silverlight.

As you can see below, the Web Console is very nicely put together and gives you all the information you need at a quick glance.
{{< figure src="/wp-content/uploads/2013/01/image_thumb2.png" >}}

You can click an incident to open it and you will be presented with some detailed information regarding the incident as can be seen below. You can also "Edit Incident" from the Web Console to update it.
{{< figure src="/wp-content/uploads/2013/01/image_thumb3.png" >}}

From the top Level Tabs, you can see you access all the information you could regarding Incidents
{{< figure src="/wp-content/uploads/2013/01/image_thumb4.png" >}}

Below are screenshots of each "Section" from the Top Level Menu"

Incidents can also be LOGGED from the Web Console, displaying all information from your SCSM Implementation
{{< figure src="/wp-content/uploads/2013/01/image_thumb5.png" >}}

The "My Team's Incidents" leverages the groups and information provided during the installation of the Web Console and provides a consolidated view of the Incidents assigned to the "Support Group" to which the currently logged on user is a member and this works very nicely with [Cireson SCSM Group Assign](http://www.cireson.com/app-store/scsm-group-assign/)
{{< figure src="/wp-content/uploads/2013/01/image_thumb6.png" >}}

The "All My Incidents" View provide a view of all incidents assigned to the currently "logged on" user.
{{< figure src="/wp-content/uploads/2013/01/image_thumb7.png" >}}

The "All Incidents" view provides an overview for all incidents within your Service Manager environment. By default, only active incidents are shown, you can select the checkbox to show resolved incidents.
{{< figure src="/wp-content/uploads/2013/01/image_thumb8.png" >}}

The "Search Incidents" views allows you to search via a number of different fields, making it really easy to find any incidents you are looking for.
{{< figure src="/wp-content/uploads/2013/01/image_thumb9.png" >}}

The "Configuration Items" view is the representation of the CI Items within the organization on the Web Console.
{{< figure src="/wp-content/uploads/2013/01/image_thumb10.png" >}}


The [Cireson SCSM Web Console](http://www.cireson.com/app-store/scsm-web-console/) is a great addition to your Service Manager environment. It allows incidents to be updated quickly and easily from any device. I would highly recommend it.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)
