---
title: Cireson Outlook Console
author: fskelly
type: post
date: 2014-06-17T06:01:55+00:00
url: /2014/06/17/cireson-outloook-console/
geo_public:
  - 0
  - 0
publicize_linkedin_url:
  - 'http://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=5884556467574448128&type=U&a=ilwl'
  - 'http://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=5884556467574448128&type=U&a=ilwl'
publicize_twitter_user:
  - fskelly
  - fskelly
publicize_twitter_url:
  - http://t.co/ru9TZqnq2z
  - http://t.co/ru9TZqnq2z
categories:
  - Service Manager
  - System Center

---
So, [Cireson][1]&nbsp;have been investing into System Centre Service Manager (SCSM) very heavily and the end results are WELL worth it. 

The [Cireson Outlook Console][2]&nbsp;has been out a little while, however it just keeps getting better and better. The Console is super easy to install. The Install instructions are provided by Cireson. There are a few steps to follow as well as the installation of an Outlook Plugin.

Yes, as you may have guessed from the name, this allows you to connect to Service Manager with almost a full experience directly from OUTLOOK, how great is that. It simply sits in a corner and connects automatically or it can be set not to, if you are like me and always traveling and do not always have connection to your SCSM Environment. I have tested with extensively, it works VERY WELL over Mobile Broadband (please note that I am in South Africa, the broadband here is NOT great) with a VPN Connection.

Yes, you read that correctly, it is configured in such a way to be light enough to use or a mobile connection with a VPN connection to your environment. Like I said, well worth the wait.

So, once the installation is complete and the Management Packs have been imported and the Outlook Plugin has been installed, the fun can start.

Ok, so onto configuring the Outlook Client,

Click Settings

<img title="2014-06-17_07-04-42" border="0" alt="2014-06-17_07-04-42" src="/wp-content/uploads/2014/06/2014-06-17_07-04-42.png" /> 

Configure as needed, you will notice that I have configured some of the features, like &ldquo;When Outlook starts, disable features and don&#8217;t connect&rdquo;, i have done purely because i am NOT domain joined and do not always want the Outlook Console to always try and connect especially when I am NOT connected to my corporate environment in any way, this can be easily set and configured to meet your needs. I also enable the the &ldquo;Prompt for Credentials when connecting&rdquo;, if&nbsp;I do not do this, it will try to connect&nbsp;using NON DOMAIN credentials. [Cireson][1]&nbsp;have clearly thought of this scenario. 🙂

&nbsp;

<img title="2014-06-17_07-11-13" border="0" alt="2014-06-17_07-11-13" src="/wp-content/uploads/2014/06/2014-06-17_07-11-13.png" /> 

So, now we can connect to the Environment.

<img title="2014-06-17_07-13-00" border="0" alt="2014-06-17_07-13-00" src="/wp-content/uploads/2014/06/2014-06-17_07-13-00-1.png" /> 

Provide the required username, password and domain.

<img title="2014-06-17_07-14-00" border="0" alt="2014-06-17_07-14-00" src="/wp-content/uploads/2014/06/2014-06-17_07-14-00-1.png" /> 

The connection is usually made quite quickly and you can easily see when the connection has been made as a few more icons will now appear and allow you to start using the real power of the Outlook Connector.

<img title="2014-06-17_07-16-44" border="0" alt="2014-06-17_07-16-44" src="/wp-content/uploads/2014/06/2014-06-17_07-16-44-1.png" /> 

Very quickly, you can see that you can easily Create, Edit and see you Active Work Items. The connector is very intuitive, and easy to use. Simply click one the buttons above or right click on an e-mail, this allows you to create or update a Work Item (yes, you can do this for Problems, Incidents, Changes and Service Requests). This outlook connector really is a ONE-STOP shop for everything Service Manager related.

Creation is easy, and the subsequent menu are easy to understand

<img title="2014-06-17_07-20-49" border="0" alt="2014-06-17_07-20-49" src="/wp-content/uploads/2014/06/2014-06-17_07-20-49-1.png" /> 

As is editing an incident,

<img title="2014-06-17_07-22-08" border="0" alt="2014-06-17_07-22-08" src="http://fskelly.files.wordpress.com/2014/06/2014-06-17_07-22-08.png" /> 

With the Edit, it allows to search for the Work Item and then modify the required Work item.

<img title="2014-06-17_07-23-42" border="0" alt="2014-06-17_07-23-42" src="/wp-content/uploads/2014/06/2014-06-17_07-23-42.png" /> 

The Outlook Console has a very familiar look and feel to it, allowing pretty much all the same functionality as the Native SCSM Console. When it comes to tasks and the like, such as resolving, you will notice that there is NO context pane for these tasks. However, this is solved by Cireson, with the use of a &ldquo;Tasks drop down&rdquo;, allowing for the simplest tasks do to completed as efficiently as possible.

<img title="2014-06-17_07-24-37" border="0" alt="2014-06-17_07-24-37" src="/wp-content/uploads/2014/06/2014-06-17_07-24-37.png" /> 

Notice the tasks,

<img title="2014-06-17_07-27-58" border="0" alt="2014-06-17_07-27-58" src="http://fskelly.files.wordpress.com/2014/06/2014-06-17_07-27-58.png" /> 

All tasks like re-assignment work in much the same way as the Native SCSM Console, also allowing for searching as you type.

<img title="2014-06-17_07-29-19" border="0" alt="2014-06-17_07-29-19" src="/wp-content/uploads/2014/06/2014-06-17_07-29-19.png" /> 

Once all the required updates and/or tasks have been completed, simply click apply or OK, whichever you normal use.

**More Functionality**

You can also use email received by you to log calls.

So, here is the scenario, you normally allow people to send email and then the call gets logged, or you get an e-mail directly from a user. This should be a new call or perhaps an update to an existing call, the [Cireson Outlook Console][2]&nbsp;handles this with ease. The [Cireson Outlook Console][2]&nbsp;allows you to update or log Work Items directly from Outlook.

What is also very nice and handy is that the linking of the Affected user happens automatically, the &ldquo;From&rdquo; is used for the &ldquo;Affected User&rdquo;, in the same way that the [Exchange Connector for SCSM][3] works.

<img title="2014-06-17_07-36-44" border="0" alt="2014-06-17_07-36-44" src="/wp-content/uploads/2014/06/2014-06-17_07-36-44.png" /> 

<img title="2014-06-17_07-37-38" border="0" alt="2014-06-17_07-37-38" src="/wp-content/uploads/2014/06/2014-06-17_07-37-38.png" /> 

<img title="2014-06-17_07-38-33" border="0" alt="2014-06-17_07-38-33" src="/wp-content/uploads/2014/06/2014-06-17_07-38-33.png" /> 

All required Fields completed, OK button is now available.

<img title="2014-06-17_07-42-10" border="0" alt="2014-06-17_07-42-10" src="http://fskelly.files.wordpress.com/2014/06/2014-06-17_07-42-10.png" /> 

Updates to work Items are handled in pretty much the same way, select the e-mail, Right Click -> Service Manager -> Choose to Update or add to Work Item. Search for Work Item and and Click OK.

<img title="2014-06-17_07-47-56" border="0" alt="2014-06-17_07-47-56" src="/wp-content/uploads/2014/06/2014-06-17_07-47-56.png" /> 

<img title="2014-06-17_07-51-47" border="0" alt="2014-06-17_07-51-47" src="/wp-content/uploads/2014/06/2014-06-17_07-51-47-1.png" /> 

OK, so you clicked &ldquo;OK&rdquo; and t disappeared, how do I check?

Very easy, you can use the &ldquo;Edit&rdquo; option and search for Incident and you can check it was added as a log.

<img title="2014-06-17_07-55-47" border="0" alt="2014-06-17_07-55-47" src="http://fskelly.files.wordpress.com/2014/06/2014-06-17_07-55-47.png" /> 

<img title="2014-06-17_07-56-30" border="0" alt="2014-06-17_07-56-30" src="/wp-content/uploads/2014/06/2014-06-17_07-56-30.png" /> 

<img title="2014-06-17_07-57-18" border="0" alt="2014-06-17_07-57-18" src="/wp-content/uploads/2014/06/2014-06-17_07-57-18.png" /> 

A lot of though has gone into this product, I ALWAYS recommend this product to my customers, as most of us spend the majority of our time within Outlook as it is, this simply adds the immense power of System Centre Service Manager into Outlook as well, allowing you to further empower your IT Staff.

[(E-Mail me)][4] 

<img loading="lazy" alt="" src="/wp-content/uploads/2013/11/111913_0952_sendemailto3.png?w=184&h=32" width="184" height="32" /> &nbsp;

Follow me, 

<img loading="lazy" alt="" src="/wp-content/uploads/2013/11/111913_0952_sendemailto5-1.jpg?w=55&h=55" width="55" height="55" /> [Twitter (Personal & System Centre)][5] 

[<img loading="lazy" alt="" src="/wp-content/uploads/2013/11/111913_0952_sendemailto6-1.jpg?w=70&h=54" width="70" height="54" />][6]&nbsp;[Twitter (System Centre Focused)][6]

<div class="bjtags">
  Tags: <a rel="tag" href="http://technorati.com/tag/SCSM">SCSM</a>, <a rel="tag" href="http://technorati.com/tag/Service+Manager">Service+Manager</a>, <a rel="tag" href="http://technorati.com/tag/Cireson">Cireson</a>, <a rel="tag" href="http://technorati.com/tag/Outlook+Console">Outlook+Console</a>
</div>

 [1]: http://www.cireson.com/
 [2]: http://cireson.com/apps/outlook-console/
 [3]: http://www.microsoft.com/en-us/download/details.aspx?id=38791
 [4]: mailto:systemcenterguyza@live.com
 [5]: https://twitter.com/fskelly
 [6]: https://twitter.com/syscenterguyza