---
title: Adding Comments to Work Items with Orchestrator
author: fskelly
type: post
date: 2014-04-04T08:18:16+00:00
url: /2014/04/04/adding-comments-to-work-items-with-orchestrator/
publicize_linkedin_url:
  - 'http://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=5857763708725403648&type=U&a=ve0V'
  - 'http://www.linkedin.com/updates?discuss=&scope=51344436&stype=M&topic=5857763708725403648&type=U&a=ve0V'
publicize_twitter_user:
  - fskelly
  - fskelly
publicize_twitter_url:
  - http://t.co/yubs78F3oF
  - http://t.co/yubs78F3oF
categories:
  - System Center
tags:
  - Integration Project
  - Orchestrator
  - powershell
  - SCSM
  - Service Manager

---
Hi All,

It has been a little while, i have been quite involved with an Integration Project. With this project there was a requirement to add comments to a Work Item. The information is passed on from &ldquo;System A&rdquo; to &ldquo;System B&rdquo; via XML. Using PowerShell, extracting the XML contents is not too difficult, if anyone would like to dive into that a little bit, please let me know with Comments.

I decided not to re-invent the wheel, so some searching was in order, and I found the following [post][1], this post gave the basics. However every time I tried to add additional comments, the comments were over-written and NOT replaced. Not quite the desired effect. So after some more checking and research and tinkering within the [Service Manager][2], I discovered the following about comments.

When adding a Comment, there is adding of a relationship class, already mentioned in this [post][1], however it also uses a GUID.

[<img loading="lazy" title="2014-04-03_07-51-37" style="border-top:0;border-right:0;border-bottom:0;border-left:0;display:inline;" border="0" alt="2014-04-03_07-51-37" src="/wp-content/uploads/2014/04/2014-04-03_07-51-37_thumb3.jpg" width="595" height="90" />][3] 

There is also another trick to adding comments within Orchestrator, this is discovered by trying to add a comment and then pulling all the available fields and looking at them. It is a small component which can be easily missed. The &ldquo;Display Name&rdquo; must also be the same GUID. So you might be asking how do we get the GUID?

Well, PowerShell can easily handle this for you.

[code language=&#8221;powershell&#8221;]$guid = [System.Guid]::NewGuid().ToString()[/code]

You simply use this a pre-cursor step and publish this data from &ldquo;Run .Net Script&rdquo;, so a sample would look like this.

[<img loading="lazy" title="2014-04-03_07-58-27" style="border-top:0;border-right:0;border-bottom:0;border-left:0;display:inline;" border="0" alt="2014-04-03_07-58-27" src="/wp-content/uploads/2014/04/2014-04-03_07-58-27_thumb1-1.jpg" width="582" height="214" />][4] 

Get-Object Properties

I pass on the ID Value I want to modify from another Runbook

[<img loading="lazy" title="2014-04-03_07-58-58" style="border-top:0;border-right:0;border-bottom:0;border-left:0;display:inline;" border="0" alt="2014-04-03_07-58-58" src="/wp-content/uploads/2014/04/2014-04-03_07-58-58_thumb1.jpg" width="578" height="399" />][5] 

Create Related Object Properties

I use an &ldquo;Extended&rdquo; class of comments needed for this project, principal remains the same.

[<img loading="lazy" title="2014-04-03_08-01-08" style="border-top:0;border-right:0;border-bottom:0;border-left:0;display:inline;" border="0" alt="2014-04-03_08-01-08" src="/wp-content/uploads/2014/04/2014-04-03_08-01-08_thumb3.jpg" width="580" height="400" />][6] 

I hope this saves&nbsp; you some time and add some value.

&nbsp; 

[(E-Mail me)][7] 

<img loading="lazy" alt="" src="/wp-content/uploads/2013/11/111913_0952_sendemailto3.png?w=614" width="184" height="32" /> 

&nbsp; 

Follow me, 

&nbsp; 

<img loading="lazy" alt="" src="/wp-content/uploads/2013/11/111913_0952_sendemailto5-1.jpg?w=614" width="55" height="55" /> [Twitter (Personal & System Centre)][8] 

[<img loading="lazy" alt="" src="/wp-content/uploads/2013/11/111913_0952_sendemailto6-1.jpg?w=614" width="70" height="54" />][9]&nbsp;[Twitter (System Centre Focused)][9]

 [1]: http://social.technet.microsoft.com/Forums/en-US/63ce41e2-e9c5-4ba0-a28f-30f8e8fb17d2/adding-scsm-user-comment-from-orchestrator-or-powershell
 [2]: http://technet.microsoft.com/en-us/library/hh305220.aspx
 [3]: /wp-content/uploads/2014/04/2014-04-03_07-51-375-1.jpg
 [4]: /wp-content/uploads/2014/04/2014-04-03_07-58-273-1.jpg
 [5]: /wp-content/uploads/2014/04/2014-04-03_07-58-583-1.jpg
 [6]: /wp-content/uploads/2014/04/2014-04-03_08-01-087-1.jpg
 [7]: mailto:systemcenterguyza@live.com
 [8]: https://twitter.com/fskelly
 [9]: https://twitter.com/syscenterguyza