+++
author = "Fletcher Kelly"
title = "Cireson Outlook Console"
date = "2014-06-17T06:01:55+00:00"
tags = [
  "SCSM",
  "Cireson"
]
categories = [
  "System Center",
  "Service Manager"
]
type = "post"
+++

<!-- CANBEPUBLISHED -->

So, [Cireson](http://www.cireson.com/) hase been investing into System Centre Service Manager (SCSM) very heavily and the end results are WELL worth it.

The [Cireson Outlook Console](http://cireson.com/apps/outlook-console/) has been out a little while, however it just keeps getting better and better. The Console is super easy to install. The Install instructions are provided by Cireson. There are a few steps to follow as well as the installation of an Outlook Plugin.

Yes, as you may have guessed from the name, this allows you to connect to Service Manager with almost a full experience directly from OUTLOOK, how great is that. It simply sits in a corner and connects automatically or it can be set not to, if you are like me and always traveling and do not always have connection to your SCSM Environment. I have tested with extensively, it works VERY WELL over Mobile Broadband (please note that I am in South Africa, the broadband here is NOT great) with a VPN Connection.

Yes, you read that correctly, it is configured in such a way to be light enough to use or a mobile connection with a VPN connection to your environment. Like I said, well worth the wait.

So, once the installation is complete and the Management Packs have been imported and the Outlook Plugin has been installed, the fun can start.

Ok, so onto configuring the Outlook Client,

Click Settings
{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-04-42.png" >}}

Configure as needed, you will notice that I have configured some of the features, like "When Outlook starts, disable features and don't connect", i have done purely because i am NOT domain joined and do not always want the Outlook Console to always try and connect especially when I am NOT connected to my corporate environment in any way, this can be easily set and configured to meet your needs. I also enable the the "Prompt for Credentials when connecting", if I do not do this, it will try to connect using **NON DOMAIN** credentials. [Cireson](http://www.cireson.com/) have clearly thought of this scenario. 🙂

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-11-13.png" >}}

So, now we can connect to the Environment.

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-13-00-1.png" >}}

Provide the required username, password and domain.

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-14-00-1.png" >}}

The connection is usually made quite quickly and you can easily see when the connection has been made as a few more icons will now appear and allow you to start using the real power of the Outlook Connector.

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-16-44-1.png" >}}

Very quickly, you can see that you can easily Create, Edit and see you Active Work Items. The connector is very intuitive, and easy to use. Simply click one the buttons above or right click on an e-mail, this allows you to create or update a Work Item (yes, you can do this for Problems, Incidents, Changes and Service Requests). This outlook connector really is a ONE-STOP shop for everything Service Manager related.

Creation is easy, and the subsequent menu are easy to understand

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-20-49-1.png" >}}

As is editing an incident,

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-22-08.png" >}}

With the Edit, it allows to search for the Work Item and then modify the required Work item.

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-23-42.png" >}}

The Outlook Console has a very familiar look and feel to it, allowing pretty much all the same functionality as the Native SCSM Console. When it comes to tasks and the like, such as resolving, you will notice that there is NO context pane for these tasks. However, this is solved by Cireson, with the use of a "Tasks drop down", allowing for the simplest tasks do to completed as efficiently as possible.

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-24-37.png" >}}

Notice the tasks,

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-27-58.png" >}}

All tasks like re-assignment work in much the same way as the Native SCSM Console, also allowing for searching as you type.

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-29-19.png" >}}

Once all the required updates and/or tasks have been completed, simply click apply or OK, whichever you normal use.

## More Functionality

You can also use email received by you to log calls.

So, here is the scenario, you normally allow people to send email and then the call gets logged, or you get an e-mail directly from a user. This should be a new call or perhaps an update to an existing call, the [Cireson Outlook Console][2]&nbsp;handles this with ease. The [Cireson Outlook Console][2]&nbsp;allows you to update or log Work Items directly from Outlook.

What is also very nice and handy is that the linking of the Affected user happens automatically, the "From" is used for the "Affected User", in the same way that the Exchange Connector for SCSM works.

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-36-44.png" >}}

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-37-38.png" >}}

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-38-33.png" >}}

All required Fields completed, OK button is now available.

{{< figure src="http://fskelly.files.wordpress.com/2014/06/2014-06-17_07-42-10.png" >}}

Updates to work Items are handled in pretty much the same way, select the e-mail, Right Click -> Service Manager -> Choose to Update or add to Work Item. Search for Work Item and and Click OK.

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-47-56.png" >}}

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-51-47-1.png" >}}

OK, so you clicked "OK" and t disappeared, how do I check?

Very easy, you can use the "Edit" option and search for Incident and you can check it was added as a log.

{{< figure src="http://fskelly.files.wordpress.com/2014/06/2014-06-17_07-55-47.png" >}}

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-56-30.png" >}}

{{< figure src="/wp-content/uploads/2014/06/2014-06-17_07-57-18.png" >}}

A lot of though has gone into this product, I ALWAYS recommend this product to my customers, as most of us spend the majority of our time within Outlook as it is, this simply adds the immense power of System Centre Service Manager into Outlook as well, allowing you to further empower your IT Staff.

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)

