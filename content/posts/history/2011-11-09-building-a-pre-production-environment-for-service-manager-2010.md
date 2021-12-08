---
title: Building a Pre-Production environment for Service Manager 2010
author: fskelly
type: post
date: 2011-11-09T06:25:16+00:00
url: /2011/11/09/building-a-pre-production-environment-for-service-manager-2010/
categories:
  - System Center

---
&#160;

I can now post this, as my steps have been published on the SCSM Team Engineering site [here][1].

Have you ever needed to build a pre-production environment to test an update or work on workflows, I did.

Thought I would share this and maybe it would help someone else as well.

It at the moment consists of the following.

1 Domain Controller

1 Management Server

1 Data Warehouse Server

&#160;

So the steps I followed to create this.

1. Promote a new DC into Production, wait for replication.

2. Add a admin account to Schema Admins (this is needed later on) – <font>Gotcha ONE</font>

3. Do not reset any passwords of any run as accounts (learnt this one the hard way) – <font>Gotcha TWO</font>

4. Move DC into ring-fenced network.

5. Seize all required roles to the “Lab DC” (ntdsutil, this is where the Schema admin is needed for Schema Master)

> 2 GREAT resources from Petri ([www.petri.co.il][2]), if you administer Active Directory, you know this website
> 
> [Delete Failed DCs from Active Directory][3]
> 
> [Seizing FSMO Roles][4]

6. Restored a DPM backup of MS vhd and DW vhd

7. Restored the required databases for the MS (serviceManager LDF and MDF)

8. Restored the required databases for the DW (DataMart, StagingAndConfig and Repository)

9. Create the required Virtual Machines using the vhd’s you restored.

10. Present additional VHDs to replicate production drives. Each of the servers had two additional drives for MDF and LDF files respectively.

11. Copy the required MDF and LDF to the necessary locations on both the MS and the DW.

12. You may get an error in the Application Log of your SCSM MS Server regarding the creation of a log file. The first hint that there is a problem is that the service will start and then stop a few seconds later. I had to create the folder structure manually for the creation of the templog.ldf file – <font>Gotcha THREE</font>

13. Restart both MS and DW

14. Once restarted, check the System Center Data Access Service, System Center Management and System Center Management Configuration Services

15. Check for a warning regarding SPN, stating that a SPN must be created. – <font>Gotcha FOUR</font>

> a. Log onto the server complaining about SPN (Usually MS and DW)

> b. Run the following command (without quotes) 

  * i. “setspn –U domain\username –A MSOMSdksvc/netbiosnameofMS” 

  * ii. “setspn –U domain\username –A MSOMSdksvc/FQDNofMS” 

  * iii. “setspn –U domain\username –A MSOMSdksvc/netbiosnameofDW” 

  * iv. “setspn –U domain\username –A MSOMSdksvc/FQDNofMS” 

  * <font>For example mine – “setspn –U europcar\sa-servicemanager -A MSOMSdksvc/SCSM</font> 
  * <font>For example mine – “setspn –U europcar\sa-servicemanager -A MSOMSdksvc/SCSM.servicemanager.demo</font> 

16. If you got the error mentioned above, restart&#160; System Center Data Access Service, System Center Management and System Center Management Configuration Services

17. That got me up and running.

[<img loading="lazy" style="background-image:none;padding-left:0;padding-right:0;display:inline;padding-top:0;border-width:0;" title="image" border="0" alt="image" src="http://fskelly.files.wordpress.com/2011/11/image_thumb.png" width="928" height="742" />][5]

 [1]: http://blogs.technet.com/b/servicemanager/archive/2011/11/08/setting-up-a-pre-production-test-environment.aspx?CommentPosted=true&wa=wsignin1.0
 [2]: http://www.petri.co.il
 [3]: http://www.petri.co.il/delete_failed_dcs_from_ad.htm
 [4]: http://www.petri.co.il/seizing_fsmo_roles.htm
 [5]: http://fskelly.files.wordpress.com/2011/11/image.png