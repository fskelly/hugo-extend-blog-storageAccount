+++
type = "post"
author = "Fletcher Kelly"
title = "Cubes Missing from Data Warehouse and throwing error from within the SCSM Console"
date = "2013-03-20T21:45:36+00:00"
tags = [
  "Cubes",
  "Data Warehouse",
  "Deployment",
  "DWH",
  "Processing"
]
categories = [
  "Service Manager"
]
+++

<!-- CANBEPUBLISHED -->

So, just the other day I opened the SCSM console to look at the cubes and process as needed, since some new reports needed to be built and Excel spread sheets created by our BI person for business. So, I start to process the cubes and the first cube starts processing without issue. However when I attempt to process the second cube (Change and Activity Management cube). It presented an error stating that "Could not find any resources appropriate for the specified culture or the neutral culture".

I have never seen an error like this before, so it was time to do some investigating.

I started by looking at the Data Warehouse Wunderbar and more specifically the “Data Warehouse Jobs” tab. I noticed that all the Cubes which were giving me said error where missing from the “Data Warehouse Jobs” tab.

I then remembered about a Patch Window that occurred while I was on leave and decided to look further. I was digging through the Event Logs, when I found the following error

Event id: 33410

Source : Deployment
{{< figure src="/wp-content/uploads/2013/02/image_thumb4.png" >}}

And as you can see from the screenshot, there are plenty of these. Clearly the patching window had interrupted a job. So now with at least something to work with, I started looking around some more and remembered that the MPSyncJOB is responsible for Management Pack Synchronization and upon opening the status of this job, I saw that the Management Packs related to the now problematic cubes were **dissociated**]. 

So, from here it was time to check and start putting the pieces of the puzzle together. Upon opening the “Management Pack” section of the “Data Warehouse” Wunderbar, I could see that the deployment of these Management Packs had failed.
{{< figure src="/wp-content/uploads/2013/02/snaghtml53c4c56_thumb.png" >}}

So, the next step is to “Restart Deployment”
{{< figure src="/wp-content/uploads/2013/02/snaghtml54834f04_thumb.png" >}}

With mine, nothing happened and I found the following error
{{< figure src="/wp-content/uploads/2013/02/image_thumb5.png" >}}


Fortunately enough the solution is listed within the error message.

Simple, delete the cube and then re-deploy the Management Pack.

1. Open SQL Management Studio on server hosting the SQL Analysis Services

1. Connect to the server type : Analysis Services
{{< figure src="/wp-content/uploads/2013/02/image_thumb6.png" >}}

1. Expand Databases, expand DWASDataBase, Expand Cubes
{{< figure src="/wp-content/uploads/2013/02/image_thumb7-1.png" >}}

1. Select cube from error and delete the Cube.
{{< figure src="/wp-content/uploads/2013/02/image_thumb8-1.png" >}}

The deletion of the cube can take some time. Once Deleted, go back to the Console and “Restart Deployment”
{{< figure src="/wp-content/uploads/2013/02/snaghtml552e490_thumb.png" >}}

This time you will see an Event log like this.
{{< figure src="/wp-content/uploads/2013/02/image_thumb9.png" >}}

The Cube is now re-deploying.
{{< figure src="/wp-content/uploads/2013/02/image_thumb10.png" >}}

You can now process your cubes as normal without any errors

Follow me,

[Twitter](https://www.twitter.com/fskelly)  
[LinkedIn](https://linkedin.com/in/fletcherkelly)