---
title: Import CI Items with Cireson Asset Import Tool
author: fskelly
type: post
date: 2013-05-17T05:10:29+00:00
url: /2013/05/17/import-ci-items-with-cireson-asset-import-tool/
publicize_twitter_user:
  - fskelly
  - fskelly
categories:
  - Service Manager
tags:
  - Asset Import
  - Cireson
  - CSV
  - CSV Import
  - import
  - SCSM 2012

---
With my [previous post][1] about importing data, I showed you how to use the built-in CSV connector to do this task and how to create the required Projection Classes. However if you are looking for a quicker more automated to achieve this, enter [Cireson][2] and their [Asset Import Tool.][3] It takes all the guess work out of the import process and handles the Projection Classes for you.

The installation of the application is easy and requires the copying a DLL file to the Service Manager Installation folder and the import of a Management Pack ( a management Pack Bundle in this case). The instructions provided with the application are very clear and concise.

As usual with the Cireson applications, the settings for the applications can be found and tweaked in the Administration | Settings. This time, this is where the License Key will need to be entered  
[<img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb6-1.png" width="648" height="372" />][4]

So now, onto the “meat”. Let’s actually use the application and see how it works. The application works pretty much the same way as the CSV Connector. It is classified as a connector, and as such to use it, a new connector would need to be created. Connectors are found under Administration | Connectors

[<img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb7-1.png" width="628" height="360" />][5]

If you have any Projection or Combinations classes you would like to use the application does allow the use of this.[<img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb8.png" width="627" height="472" />][6]

For this demo, I have used the Windows Computer Class, additional information around the Projection classes can be found [here][7], this will allow to see the information (headers) used by the required class. The Windows Computer class has the following information.

<div align="center">
  <table cellspacing="0" cellpadding="1" width="654" align="center" border="1">
    <tr>
      <td valign="top" width="213" align="center">
        <font size="1">Name</font>
      </td>
      
      <td valign="top" width="179" align="center">
        <font size="1">Type</font>
      </td>
      
      <td valign="top" width="72" align="center">
        <font size="1">MinLength</font>
      </td>
      
      <td valign="top" width="94" align="center">
        <font size="1">MaxLength</font>
      </td>
      
      <td valign="top" width="94" align="center">
        <font size="1">AutoIncrement</font>
      </td>
    </tr>
    
    <tr>
      <td valign="top" width="213">
        <p>
          <font size="1">PrincipalName</font>
        </p>
      </td>
      
      <p>
        </font></td> 
        
        <td valign="top" width="179">
          <p>
            <font size="1">string</font>
          </p>
        </td>
        
        <p>
          </font></td> 
          
          <td valign="top" width="72">
            <font size="1"></font>
          </td>
          
          <td valign="top" width="94">
            <p>
              <font size="1">256</font>
            </p>
          </td>
          
          <p>
            </font></td> 
            
            <td valign="top" width="94">
              <p>
                <font size="1">FALSE</font>
              </p>
            </td>
            
            <p>
              </font></td> </tr> 
              
              <tr>
                <td valign="top" width="213">
                  <p>
                    <font size="1">DNSName</font>
                  </p>
                </td>
                
                <p>
                  </font></td> 
                  
                  <td valign="top" width="179">
                    <p>
                      <font size="1">string</font>
                    </p>
                  </td>
                  
                  <p>
                    </font></td> 
                    
                    <td valign="top" width="72">
                      <font size="1"></font>
                    </td>
                    
                    <td valign="top" width="94">
                      <p>
                        <font size="1">256</font>
                      </p>
                    </td>
                    
                    <p>
                      </font></td> 
                      
                      <td valign="top" width="94">
                        <p>
                          <font size="1">FALSE</font>
                        </p>
                      </td>
                      
                      <p>
                        </font></td> </tr> 
                        
                        <tr>
                          <td valign="top" width="213">
                            <p>
                              <font size="1">NetbiosComputerName</font>
                            </p>
                          </td>
                          
                          <p>
                            </font></td> 
                            
                            <td valign="top" width="179">
                              <p>
                                <font size="1">string</font>
                              </p>
                            </td>
                            
                            <p>
                              </font></td> 
                              
                              <td valign="top" width="72">
                                <font size="1"></font>
                              </td>
                              
                              <td valign="top" width="94">
                                <p>
                                  <font size="1">256</font>
                                </p>
                              </td>
                              
                              <p>
                                </font></td> 
                                
                                <td valign="top" width="94">
                                  <p>
                                    <font size="1">FALSE</font>
                                  </p>
                                </td>
                                
                                <p>
                                  </font></td> </tr> 
                                  
                                  <tr>
                                    <td valign="top" width="213">
                                      <p>
                                        <font size="1">NetbiosDomainName</font>
                                      </p>
                                    </td>
                                    
                                    <p>
                                      </font></td> 
                                      
                                      <td valign="top" width="179">
                                        <p>
                                          <font size="1">string</font>
                                        </p>
                                      </td>
                                      
                                      <p>
                                        </font></td> 
                                        
                                        <td valign="top" width="72">
                                          <font size="1"></font>
                                        </td>
                                        
                                        <td valign="top" width="94">
                                          <p>
                                            <font size="1">256</font>
                                          </p>
                                        </td>
                                        
                                        <p>
                                          </font></td> 
                                          
                                          <td valign="top" width="94">
                                            <p>
                                              <font size="1">FALSE</font>
                                            </p>
                                          </td>
                                          
                                          <p>
                                            </font></td> </tr> 
                                            
                                            <tr>
                                              <td valign="top" width="213">
                                                <p>
                                                  <font size="1">IPAddress</font>
                                                </p>
                                              </td>
                                              
                                              <p>
                                                </font></td> 
                                                
                                                <td valign="top" width="179">
                                                  <p>
                                                    <font size="1">string</font>
                                                  </p>
                                                </td>
                                                
                                                <p>
                                                  </font></td> 
                                                  
                                                  <td valign="top" width="72">
                                                    <font size="1"></font>
                                                  </td>
                                                  
                                                  <td valign="top" width="94">
                                                    <p>
                                                      <font size="1">256</font>
                                                    </p>
                                                  </td>
                                                  
                                                  <p>
                                                    </font></td> 
                                                    
                                                    <td valign="top" width="94">
                                                      <p>
                                                        <font size="1">FALSE</font>
                                                      </p>
                                                    </td>
                                                    
                                                    <p>
                                                      </font></td> </tr> 
                                                      
                                                      <tr>
                                                        <td valign="top" width="213">
                                                          <p>
                                                            <font size="1">NetworkName</font>
                                                          </p>
                                                        </td>
                                                        
                                                        <p>
                                                          </font></td> 
                                                          
                                                          <td valign="top" width="179">
                                                            <p>
                                                              <font size="1">string</font>
                                                            </p>
                                                          </td>
                                                          
                                                          <p>
                                                            </font></td> 
                                                            
                                                            <td valign="top" width="72">
                                                              <font size="1"></font>
                                                            </td>
                                                            
                                                            <td valign="top" width="94">
                                                              <p>
                                                                <font size="1">256</font>
                                                              </p>
                                                            </td>
                                                            
                                                            <p>
                                                              </font></td> 
                                                              
                                                              <td valign="top" width="94">
                                                                <p>
                                                                  <font size="1">FALSE</font>
                                                                </p>
                                                              </td>
                                                              
                                                              <p>
                                                                </font></td> </tr> 
                                                                
                                                                <tr>
                                                                  <td valign="top" width="213">
                                                                    <p>
                                                                      <font size="1">ActiveDirectoryObjectSid</font>
                                                                    </p>
                                                                  </td>
                                                                  
                                                                  <p>
                                                                    </font></td> 
                                                                    
                                                                    <td valign="top" width="179">
                                                                      <p>
                                                                        <font size="1">string</font>
                                                                      </p>
                                                                    </td>
                                                                    
                                                                    <p>
                                                                      </font></td> 
                                                                      
                                                                      <td valign="top" width="72">
                                                                        <font size="1"></font>
                                                                      </td>
                                                                      
                                                                      <td valign="top" width="94">
                                                                        <p>
                                                                          <font size="1">256</font>
                                                                        </p>
                                                                      </td>
                                                                      
                                                                      <p>
                                                                        </font></td> 
                                                                        
                                                                        <td valign="top" width="94">
                                                                          <p>
                                                                            <font size="1">FALSE</font>
                                                                          </p>
                                                                        </td>
                                                                        
                                                                        <p>
                                                                          </font></td> </tr> 
                                                                          
                                                                          <tr>
                                                                            <td valign="top" width="213">
                                                                              <p>
                                                                                <font size="1">IsVirtualMachine</font>
                                                                              </p>
                                                                            </td>
                                                                            
                                                                            <p>
                                                                              </font></td> 
                                                                              
                                                                              <td valign="top" width="179">
                                                                                <p>
                                                                                  <font size="1">string</font>
                                                                                </p>
                                                                              </td>
                                                                              
                                                                              <p>
                                                                                </font></td> 
                                                                                
                                                                                <td valign="top" width="72">
                                                                                  <font size="1"></font>
                                                                                </td>
                                                                                
                                                                                <td valign="top" width="94">
                                                                                  <p>
                                                                                    <font size="1">256</font>
                                                                                  </p>
                                                                                </td>
                                                                                
                                                                                <p>
                                                                                  </font></td> 
                                                                                  
                                                                                  <td valign="top" width="94">
                                                                                    <p>
                                                                                      <font size="1">FALSE</font>
                                                                                    </p>
                                                                                  </td>
                                                                                  
                                                                                  <p>
                                                                                    </font></td> </tr> 
                                                                                    
                                                                                    <tr>
                                                                                      <td valign="top" width="213">
                                                                                        <p>
                                                                                          <font size="1">DomainDnsName</font>
                                                                                        </p>
                                                                                      </td>
                                                                                      
                                                                                      <p>
                                                                                        </font></td> 
                                                                                        
                                                                                        <td valign="top" width="179">
                                                                                          <p>
                                                                                            <font size="1">string</font>
                                                                                          </p>
                                                                                        </td>
                                                                                        
                                                                                        <p>
                                                                                          </font></td> 
                                                                                          
                                                                                          <td valign="top" width="72">
                                                                                            <font size="1"></font>
                                                                                          </td>
                                                                                          
                                                                                          <td valign="top" width="94">
                                                                                            <p>
                                                                                              <font size="1">256</font>
                                                                                            </p>
                                                                                          </td>
                                                                                          
                                                                                          <p>
                                                                                            </font></td> 
                                                                                            
                                                                                            <td valign="top" width="94">
                                                                                              <p>
                                                                                                <font size="1">FALSE</font>
                                                                                              </p>
                                                                                            </td>
                                                                                            
                                                                                            <p>
                                                                                              </font></td> </tr> 
                                                                                              
                                                                                              <tr>
                                                                                                <td valign="top" width="213">
                                                                                                  <p>
                                                                                                    <font size="1">OrganizationalUnit</font>
                                                                                                  </p>
                                                                                                </td>
                                                                                                
                                                                                                <p>
                                                                                                  </font></td> 
                                                                                                  
                                                                                                  <td valign="top" width="179">
                                                                                                    <p>
                                                                                                      <font size="1">string</font>
                                                                                                    </p>
                                                                                                  </td>
                                                                                                  
                                                                                                  <p>
                                                                                                    </font></td> 
                                                                                                    
                                                                                                    <td valign="top" width="72">
                                                                                                      <font size="1"></font>
                                                                                                    </td>
                                                                                                    
                                                                                                    <td valign="top" width="94">
                                                                                                      <p>
                                                                                                        <font size="1">256</font>
                                                                                                      </p>
                                                                                                    </td>
                                                                                                    
                                                                                                    <p>
                                                                                                      </font></td> 
                                                                                                      
                                                                                                      <td valign="top" width="94">
                                                                                                        <p>
                                                                                                          <font size="1">FALSE</font>
                                                                                                        </p>
                                                                                                      </td>
                                                                                                      
                                                                                                      <p>
                                                                                                        </font></td> </tr> 
                                                                                                        
                                                                                                        <tr>
                                                                                                          <td valign="top" width="213">
                                                                                                            <p>
                                                                                                              <font size="1">ForestDnsName</font>
                                                                                                            </p>
                                                                                                          </td>
                                                                                                          
                                                                                                          <p>
                                                                                                            </font></td> 
                                                                                                            
                                                                                                            <td valign="top" width="179">
                                                                                                              <p>
                                                                                                                <font size="1">string</font>
                                                                                                              </p>
                                                                                                            </td>
                                                                                                            
                                                                                                            <p>
                                                                                                              </font></td> 
                                                                                                              
                                                                                                              <td valign="top" width="72">
                                                                                                                <font size="1"></font>
                                                                                                              </td>
                                                                                                              
                                                                                                              <td valign="top" width="94">
                                                                                                                <p>
                                                                                                                  <font size="1">256</font>
                                                                                                                </p>
                                                                                                              </td>
                                                                                                              
                                                                                                              <p>
                                                                                                                </font></td> 
                                                                                                                
                                                                                                                <td valign="top" width="94">
                                                                                                                  <p>
                                                                                                                    <font size="1">FALSE</font>
                                                                                                                  </p>
                                                                                                                </td>
                                                                                                                
                                                                                                                <p>
                                                                                                                  </font></td> </tr> 
                                                                                                                  
                                                                                                                  <tr>
                                                                                                                    <td valign="top" width="213">
                                                                                                                      <p>
                                                                                                                        <font size="1">ActiveDirectorySite</font>
                                                                                                                      </p>
                                                                                                                    </td>
                                                                                                                    
                                                                                                                    <p>
                                                                                                                      </font></td> 
                                                                                                                      
                                                                                                                      <td valign="top" width="179">
                                                                                                                        <p>
                                                                                                                          <font size="1">string</font>
                                                                                                                        </p>
                                                                                                                      </td>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        </font></td> 
                                                                                                                        
                                                                                                                        <td valign="top" width="72">
                                                                                                                          <font size="1"></font>
                                                                                                                        </td>
                                                                                                                        
                                                                                                                        <td valign="top" width="94">
                                                                                                                          <p>
                                                                                                                            <font size="1">256</font>
                                                                                                                          </p>
                                                                                                                        </td>
                                                                                                                        
                                                                                                                        <p>
                                                                                                                          </font></td> 
                                                                                                                          
                                                                                                                          <td valign="top" width="94">
                                                                                                                            <p>
                                                                                                                              <font size="1">FALSE</font>
                                                                                                                            </p>
                                                                                                                          </td>
                                                                                                                          
                                                                                                                          <p>
                                                                                                                            </font></td> </tr> 
                                                                                                                            
                                                                                                                            <tr>
                                                                                                                              <td valign="top" width="213">
                                                                                                                                <p>
                                                                                                                                  <font size="1">OffsetInMinuteFromGreenwichTime</font>
                                                                                                                                </p>
                                                                                                                              </td>
                                                                                                                              
                                                                                                                              <p>
                                                                                                                                </font></td> 
                                                                                                                                
                                                                                                                                <td valign="top" width="179">
                                                                                                                                  <p>
                                                                                                                                    <font size="1">int (range: [-2147483648, 2147483647])</font>
                                                                                                                                  </p>
                                                                                                                                </td>
                                                                                                                                
                                                                                                                                <p>
                                                                                                                                  </font></td> 
                                                                                                                                  
                                                                                                                                  <td valign="top" width="72">
                                                                                                                                    <font size="1"></font>
                                                                                                                                  </td>
                                                                                                                                  
                                                                                                                                  <td valign="top" width="94">
                                                                                                                                    <p>
                                                                                                                                      <font size="1">256</font>
                                                                                                                                    </p>
                                                                                                                                  </td>
                                                                                                                                  
                                                                                                                                  <p>
                                                                                                                                    </font></td> 
                                                                                                                                    
                                                                                                                                    <td valign="top" width="94">
                                                                                                                                      <p>
                                                                                                                                        <font size="1">FALSE</font>
                                                                                                                                      </p>
                                                                                                                                    </td>
                                                                                                                                    
                                                                                                                                    <p>
                                                                                                                                      </font></td> </tr> 
                                                                                                                                      
                                                                                                                                      <tr>
                                                                                                                                        <td valign="top" width="213">
                                                                                                                                          <p>
                                                                                                                                            <font size="1">LastInventoryDate</font>
                                                                                                                                          </p>
                                                                                                                                        </td>
                                                                                                                                        
                                                                                                                                        <p>
                                                                                                                                          </font></td> 
                                                                                                                                          
                                                                                                                                          <td valign="top" width="179">
                                                                                                                                            <p>
                                                                                                                                              <font size="1">datetime</font>
                                                                                                                                            </p>
                                                                                                                                          </td>
                                                                                                                                          
                                                                                                                                          <p>
                                                                                                                                            </font></td> 
                                                                                                                                            
                                                                                                                                            <td valign="top" width="72">
                                                                                                                                              <font size="1"></font>
                                                                                                                                            </td>
                                                                                                                                            
                                                                                                                                            <td valign="top" width="94">
                                                                                                                                              <p>
                                                                                                                                                <font size="1">256</font>
                                                                                                                                              </p>
                                                                                                                                            </td>
                                                                                                                                            
                                                                                                                                            <p>
                                                                                                                                              </font></td> 
                                                                                                                                              
                                                                                                                                              <td valign="top" width="94">
                                                                                                                                                <p>
                                                                                                                                                  <font size="1">FALSE</font>
                                                                                                                                                </p>
                                                                                                                                              </td>
                                                                                                                                              
                                                                                                                                              <p>
                                                                                                                                                </font></td> </tr> 
                                                                                                                                                
                                                                                                                                                <tr>
                                                                                                                                                  <td valign="top" width="213">
                                                                                                                                                    <p>
                                                                                                                                                      <font size="1">ObjectStatus</font>
                                                                                                                                                    </p>
                                                                                                                                                  </td>
                                                                                                                                                  
                                                                                                                                                  <p>
                                                                                                                                                    </font></td> 
                                                                                                                                                    
                                                                                                                                                    <td valign="top" width="179">
                                                                                                                                                      <p>
                                                                                                                                                        <a href="/Users/Fletcher/AppData/Local/Temp/WindowsLiveWriter1286139640/supfiles11F64D0/AppendixA8.html"><font color="#ff0000" size="1"><u>enum:System.</u></font></a>
                                                                                                                                                      </p>
                                                                                                                                                      
                                                                                                                                                      <p>
                                                                                                                                                        <font color="#ff0000" size="1"><u>ConfigItem.ObjectStatusEnum</u></font>
                                                                                                                                                      </p>
                                                                                                                                                    </td></td> 
                                                                                                                                                    
                                                                                                                                                    <td valign="top" width="72">
                                                                                                                                                      <font size="1"></font>
                                                                                                                                                    </td>
                                                                                                                                                    
                                                                                                                                                    <td valign="top" width="94">
                                                                                                                                                      <p>
                                                                                                                                                        <font size="1">256</font>
                                                                                                                                                      </p>
                                                                                                                                                    </td>
                                                                                                                                                    
                                                                                                                                                    <p>
                                                                                                                                                      </font></td> 
                                                                                                                                                      
                                                                                                                                                      <td valign="top" width="94">
                                                                                                                                                        <p>
                                                                                                                                                          <font size="1">FALSE</font>
                                                                                                                                                        </p>
                                                                                                                                                      </td>
                                                                                                                                                      
                                                                                                                                                      <p>
                                                                                                                                                        </font></td> </tr> 
                                                                                                                                                        
                                                                                                                                                        <tr>
                                                                                                                                                          <td valign="top" width="213">
                                                                                                                                                            <p>
                                                                                                                                                              <font size="1">AssetStatus</font>
                                                                                                                                                            </p>
                                                                                                                                                          </td>
                                                                                                                                                          
                                                                                                                                                          <p>
                                                                                                                                                            </font></td> 
                                                                                                                                                            
                                                                                                                                                            <td valign="top" width="179">
                                                                                                                                                              <p>
                                                                                                                                                                <a href="/Users/Fletcher/AppData/Local/Temp/WindowsLiveWriter1286139640/supfiles11F64D0/AppendixA9.html"><font color="#ff0000" size="1"><u>enum:System.</u></font></a>
                                                                                                                                                              </p>
                                                                                                                                                              
                                                                                                                                                              <p>
                                                                                                                                                                <font color="#ff0000" size="1"><u>ConfigItem.AssetStatusEnum</u></font>
                                                                                                                                                              </p>
                                                                                                                                                            </td></td> 
                                                                                                                                                            
                                                                                                                                                            <td valign="top" width="72">
                                                                                                                                                              <font size="1"></font>
                                                                                                                                                            </td>
                                                                                                                                                            
                                                                                                                                                            <td valign="top" width="94">
                                                                                                                                                              <p>
                                                                                                                                                                <font size="1">256</font>
                                                                                                                                                              </p>
                                                                                                                                                            </td>
                                                                                                                                                            
                                                                                                                                                            <p>
                                                                                                                                                              </font></td> 
                                                                                                                                                              
                                                                                                                                                              <td valign="top" width="94">
                                                                                                                                                                <p>
                                                                                                                                                                  <font size="1">FALSE</font>
                                                                                                                                                                </p>
                                                                                                                                                              </td>
                                                                                                                                                              
                                                                                                                                                              <p>
                                                                                                                                                                </font></td> </tr> 
                                                                                                                                                                
                                                                                                                                                                <tr>
                                                                                                                                                                  <td valign="top" width="213">
                                                                                                                                                                    <p>
                                                                                                                                                                      <font size="1">Notes</font>
                                                                                                                                                                    </p>
                                                                                                                                                                  </td>
                                                                                                                                                                  
                                                                                                                                                                  <p>
                                                                                                                                                                    </font></td> 
                                                                                                                                                                    
                                                                                                                                                                    <td valign="top" width="179">
                                                                                                                                                                      <p>
                                                                                                                                                                        <font size="1">richtext</font>
                                                                                                                                                                      </p>
                                                                                                                                                                    </td>
                                                                                                                                                                    
                                                                                                                                                                    <p>
                                                                                                                                                                      </font></td> 
                                                                                                                                                                      
                                                                                                                                                                      <td valign="top" width="72">
                                                                                                                                                                        <font size="1"></font>
                                                                                                                                                                      </td>
                                                                                                                                                                      
                                                                                                                                                                      <td valign="top" width="94">
                                                                                                                                                                        <font size="1">4000</font>
                                                                                                                                                                      </td>
                                                                                                                                                                      
                                                                                                                                                                      <td valign="top" width="94">
                                                                                                                                                                        <p>
                                                                                                                                                                          <font size="1">FALSE</font>
                                                                                                                                                                        </p>
                                                                                                                                                                      </td>
                                                                                                                                                                      
                                                                                                                                                                      <p>
                                                                                                                                                                        </font></td> </tr> 
                                                                                                                                                                        
                                                                                                                                                                        <tr>
                                                                                                                                                                          <td valign="top" width="213">
                                                                                                                                                                            <p>
                                                                                                                                                                              <font size="1">DisplayName</font>
                                                                                                                                                                            </p>
                                                                                                                                                                          </td>
                                                                                                                                                                          
                                                                                                                                                                          <p>
                                                                                                                                                                            </font></td> 
                                                                                                                                                                            
                                                                                                                                                                            <td valign="top" width="179">
                                                                                                                                                                              <p>
                                                                                                                                                                                <font size="1">string</font>
                                                                                                                                                                              </p>
                                                                                                                                                                            </td>
                                                                                                                                                                            
                                                                                                                                                                            <p>
                                                                                                                                                                              </font></td> 
                                                                                                                                                                              
                                                                                                                                                                              <td valign="top" width="72">
                                                                                                                                                                                <font size="1"></font>
                                                                                                                                                                              </td>
                                                                                                                                                                              
                                                                                                                                                                              <td valign="top" width="94">
                                                                                                                                                                                <p>
                                                                                                                                                                                  <font size="1">256</font>
                                                                                                                                                                                </p>
                                                                                                                                                                              </td>
                                                                                                                                                                              
                                                                                                                                                                              <p>
                                                                                                                                                                                </font></td> 
                                                                                                                                                                                
                                                                                                                                                                                <td valign="top" width="94">
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <font size="1">FALSE</font>
                                                                                                                                                                                  </p>
                                                                                                                                                                                </td>
                                                                                                                                                                                
                                                                                                                                                                                <p>
                                                                                                                                                                                  </font></td> </tr> </tbody> </table></div> 
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    So, for this, I will bulk import a few computers with only a few simple parameters.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    I am simply adding two machines
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    &#160;<a href="/wp-content/uploads/2013/05/image9.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb9.png" width="529" height="120" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    The <a href="http://www.cireson.com/app-store/scsm-asset-import/">Asset Import Tool</a> also allows you to test your configuration first.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="/wp-content/uploads/2013/05/image10-1.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb10-1.png" width="539" height="410" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    Now we can map the Headers to the Projections, you will see I kept them the same, however if you are getting a file from the IT Department or any other department, this step here allows to map these correctly.<a href="/wp-content/uploads/2013/05/image11.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb11.png" width="545" height="410" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    Next, you can set your frequency, allowing you to automate the import. I have configured mine to run Every Hour.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="/wp-content/uploads/2013/05/image12.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb12.png" width="557" height="421" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    Then you can create the connector.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    Final Connector completed.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="/wp-content/uploads/2013/05/image13.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb13.png" width="555" height="321" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    Now lets run it!!!!
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="/wp-content/uploads/2013/05/image14.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb14.png" width="549" height="315" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    Since we enabled the option to “Test”, the results were written to a log file allowing us to test before running in a production environment.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="/wp-content/uploads/2013/05/image15.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb15.png" width="563" height="284" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    All looks good, let’s run it to bring in the data. A simple change needs to be made. We just need to remove a checkbox.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="/wp-content/uploads/2013/05/image16.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb16.png" width="575" height="433" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    Ok, change made. let’s import the data. So now, let’s re-run the import process.The Connector has now re-run, now we can check the data. This time without the testing.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="/wp-content/uploads/2013/05/image17-1.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb17.png" width="578" height="332" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    Now, we can see the new imported data. We can check here under Configuration Items | Computers | All Windows Computers
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="/wp-content/uploads/2013/05/image18.png"><img loading="lazy" title="image" style="border-top:0;border-right:0;background-image:none;border-bottom:0;padding-top:0;padding-left:0;border-left:0;display:inline;padding-right:0;" border="0" alt="image" src="/wp-content/uploads/2013/05/image_thumb18.png" width="585" height="336" /></a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    And there we have it, importing nice and easy.
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <span style="font-size:small;font-family:calibri;"></span>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <a href="mailto:systemcenterguyza@live.com">(E-Mail me)</a>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <img src="/wp-content/uploads/2013/02/image_thumb_thumb_thumb_thumb_thumb1-1.png" />
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <span style="font-size:small;font-family:calibri;">Follow me.</span>
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <img src="http://fskelly.files.wordpress.com/2012/06/facebook-small322252222.jpg?w=44&h=44" /> Facebook (Personal)
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <img src="http://fskelly.files.wordpress.com/2012/06/twitter-small322252222.jpg?w=44&h=44" />Twitter (Personal & System Center)
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    &#160;<img src="/wp-content/uploads/2013/02/scsmlogo25232.jpg?w=56&h=43" />Twitter (System Center Focused)
                                                                                                                                                                                  </p>
                                                                                                                                                                                  
                                                                                                                                                                                  <p>
                                                                                                                                                                                    <span style="font-size:small;font-family:calibri;"><img src="http://fskelly.files.wordpress.com/2012/06/mcc11_logo_horizontal_2-color_thumb__thumb1.jpg?w=244&h=99" /></span>
                                                                                                                                                                                  </p>

 [1]: http://fskelly.wordpress.com/2013/04/23/importing-data-into-service-managercsv-import-and-xml/
 [2]: http://www.cireson.com/
 [3]: http://www.cireson.com/app-store/scsm-asset-import/
 [4]: /wp-content/uploads/2013/05/image6.png
 [5]: /wp-content/uploads/2013/05/image7-1.png
 [6]: /wp-content/uploads/2013/05/image8-1.png
 [7]: http://blogs.technet.com/b/servicemanager/archive/2009/05/26/appendix-a-to-previous-post.aspx