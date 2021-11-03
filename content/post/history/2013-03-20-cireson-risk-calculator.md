---
title: Cireson Risk Calculator
author: fskelly
type: post
date: 2013-03-20T21:45:36+00:00
url: /2013/03/20/cireson-risk-calculator/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - Uncategorized

---
When looking at Change Management, usually the most difficult to decide on, is the “Severity” or “Impact” of the Change. This has been addressed by [Cireson][1] with one of their many [applications][2]. This one is called the [SCSM Risk Calculator][3] and as the name suggests, it is an application to help establish “Change Risk” by asking simple questions. It is designed to ask any set of questions, this is of course configurable. Based on the answers provided by the person logging the change, the “Risk is calculated and nicely added to the Change Request.

The import process and configuration aspect of this application is very nicely covered in the Installation Documentation provided.

Once imported, the settings for this application can be found in the “Administration” Wunderbar under Settings, as like all [Cireson][1] applications I have tested thus far.

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb.png" width="497" height="265" />][4]

As seen below, the questions are easy to configure and can be presented in "User” English making this an easy application to present to end-users. The application allows for the configuration of up to 10 questions. A toggle to count “No” instead of “Yes’ is also provided.

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb1.png" width="505" height="294" />][5]

The next step is to simply configure the count of “Yes” or “No” answers respectively to qualify as “Low”, “Medium” or “High” risk changes

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb2.png" width="507" height="295" />][6]

Ok, so now the configuration is done, now to see the [SCSM Risk Calculator][3] in action

Lets create a Change Request

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb3.png" width="516" height="275" />][7]

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb4.png" width="517" height="423" />][8]

Example of “Low Risk” as per settings

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb5.png" width="383" height="296" />][9]

Example of “Medium Risk” as per settings

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb6.png" width="387" height="299" />][10]

Example of “High Risk” as per settings

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb7.png" width="394" height="305" />][11]

When you click “OK” the information entered above including questions and answers is copied d into the Risk Assessment Plan

[<img loading="lazy" title="image" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image" src="/wp-content/uploads/2013/03/image_thumb8.png" width="396" height="373" />][12]

All the information is saved in the same place all the time. At the same time you have a tool that can relate to end users and provide an accurate Risk Assessment.

Thank you [Cireson][1], get more [information here][3].

[(E-Mail me)][13]

[<img loading="lazy" title="image_thumb_thumb_thumb_thumb_thumb" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="image_thumb_thumb_thumb_thumb_thumb" src="http://fskelly.files.wordpress.com/2013/02/image_thumb_thumb_thumb_thumb_thumb_thumb.png" width="184" height="32" />][14]

<span style="font-size:small;font-family:calibri;">Follow me.</span>

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" title="facebook-small322252222" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="facebook-small322252222" src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg" width="44" height="44" /></span>][15] Facebook (Personal)

[<span style="font-size:small;font-family:calibri;"><img loading="lazy" title="twitter-small322252222" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="twitter-small322252222" src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg" width="44" height="44" /></span>][16]Twitter (Personal & System Center)

[<img loading="lazy" title="scsmlogo25232" style="background-image:none;padding-top:0;padding-left:0;margin:0;display:inline;padding-right:0;border-width:0;" border="0" alt="scsmlogo25232" src="/wp-content/uploads/2013/02/scsmlogo25232.jpg" width="56" height="43" />][17] Twitter (System Center Focused)

<span style="font-size:small;font-family:calibri;"><a href="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb_1.jpg"><img loading="lazy" title="MCC11_Logo_Horizontal_2-color_thumb_" style="background-image:none;padding-top:0;padding-left:0;display:inline;padding-right:0;border-width:0;" border="0" alt="MCC11_Logo_Horizontal_2-color_thumb_" src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg" width="244" height="99" /></a></span>

 [1]: http://www.cireson.com/
 [2]: http://www.cireson.com/app-store/
 [3]: http://www.cireson.com/app-store/scsm-risk-calculator/
 [4]: /wp-content/uploads/2013/03/image.png
 [5]: /wp-content/uploads/2013/03/image1.png
 [6]: /wp-content/uploads/2013/03/image2.png
 [7]: /wp-content/uploads/2013/03/image3.png
 [8]: /wp-content/uploads/2013/03/image4.png
 [9]: /wp-content/uploads/2013/03/image5.png
 [10]: /wp-content/uploads/2013/03/image6.png
 [11]: /wp-content/uploads/2013/03/image7.png
 [12]: /wp-content/uploads/2013/03/image8.png
 [13]: mailto:systemcenterguyza@live.com
 [14]: /wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png
 [15]: http://www.facebook.com/fletcher.kelly
 [16]: http://twitter.com/#!/fskelly
 [17]: http://twitter.com/syscenterguyza