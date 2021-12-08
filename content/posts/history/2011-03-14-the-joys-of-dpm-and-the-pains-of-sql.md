---
title: The joys of DPM and the pains of SQL
author: fskelly
type: post
date: 2011-03-14T11:36:25+00:00
url: /2011/03/14/the-joys-of-dpm-and-the-pains-of-sql/
categories:
  - Uncategorized

---
Just recently, as in the weekend just gone, I had a change for an upgrade of SQL 2008 to SQL 2008 R2. The one half went like a dream.

However the other half, revoking names on purpose, was not so easy. Let’s just say&#160; that Reporting Services is not always the easiest thing to upgrade. My upgrade went TERRIBLY wrong. It was however a great learning exercise and at the same time reminds we why i LOVE DPM so much, SQL backups through DPM are the king. Again, i will scream this “ I LOVE DPM!!!!”

In this process of the upgrade I ended up with some “Suspect” databases. I found some scripts that MIGHT allow the recovery of the data. PLEASE NOTE THAT IS A LAST DITCH EFFORT. The scripts below should only be used as a final resort as there MIGHT be DATA LOSS. 

&#160;

They should be used in the following order 

1. SETEmeregency.sql (put database in emergency mode and attempt repair, PLEASE NOTE AGAIN THAT THERE MIGHT BE DATA LOSS

2. FindSPID.sql (find which SPID is locking the database)

3. KillSPID (kill the connection that is locking the database.

4. SQL SetMultiUser (put database in multi-user mode and check, and hope that there is no data loss.

In case the files do not upload correctly.

SETEmergency.sql

<div style="border-bottom:silver 1px solid;text-align:left;border-left:silver 1px solid;line-height:12pt;background-color:#f4f4f4;width:97.5%;font-family:&#039;direction:ltr;max-height:200px;font-size:8pt;overflow:auto;border-top:silver 1px solid;cursor:text;border-right:silver 1px solid;margin:20px 0 10px;padding:4px;" id="codeSnippetWrapper">
  <div style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;padding:0;" id="codeSnippet">
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum1">   1:</span> <span style="color:#0000ff;">USE</span> master;</pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum2">   2:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum3">   3:</span> <span style="color:#0000ff;">GO</span></pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum4">   4:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum5">   5:</span> <span style="color:#0000ff;">ALTER</span> <span style="color:#0000ff;">DATABASE</span> ReportServer <span style="color:#0000ff;">SET</span> EMERGENCY </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum6">   6:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum7">   7:</span> <span style="color:#0000ff;">GO</span></pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum8">   8:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum9">   9:</span> <span style="color:#0000ff;">ALTER</span> <span style="color:#0000ff;">DATABASE</span> ReportServer <span style="color:#0000ff;">SET</span> SINGLE_USER </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum10">  10:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum11">  11:</span> <span style="color:#0000ff;">GO</span></pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum12">  12:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum13">  13:</span> <span style="color:#0000ff;">DBCC</span> CHECKDB (ReportServer, REPAIR_ALLOW_DATA_LOSS) <span style="color:#0000ff;">WITH</span> NO_INFOMSGS;</pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum14">  14:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum15">  15:</span> <span style="color:#0000ff;">GO</span> </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum16">  16:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum17">  17:</span>  </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum18">  18:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum19">  19:</span> <span style="color:#0000ff;">USE</span> ReportServer;</pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum20">  20:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum21">  21:</span>  </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum22">  22:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum23">  23:</span> <span style="color:#0000ff;">DBCC</span> CHECKDB <span style="color:#0000ff;">WITH</span> NO_INFOMSGS;</pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum24">  24:</span>&#160; </pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum25">  25:</span> GO</pre></p>
  </div>
</div>

FindSPID.sql 

<div style="border-bottom:silver 1px solid;text-align:left;border-left:silver 1px solid;line-height:12pt;background-color:#f4f4f4;width:97.5%;font-family:&#039;direction:ltr;max-height:200px;font-size:8pt;overflow:auto;border-top:silver 1px solid;cursor:text;border-right:silver 1px solid;margin:20px 0 10px;padding:4px;" id="codeSnippetWrapper">
  <div style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;padding:0;" id="codeSnippet">
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum1">   1:</span> <span style="color:#0000ff;">use</span> master</pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum2">   2:</span> <span style="color:#0000ff;">go</span></pre>
    
    <p>
      <!--CRLF-->
    </p>
    
    <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum3">   3:</span> sp_who</pre>
    
    <p>
      <!--CRLF--></div> </div> 
      
      <p>
        KillSPID.sql
      </p>
      
      <div style="border-bottom:silver 1px solid;text-align:left;border-left:silver 1px solid;line-height:12pt;background-color:#f4f4f4;width:97.5%;font-family:&#039;direction:ltr;max-height:200px;font-size:8pt;overflow:auto;border-top:silver 1px solid;cursor:text;border-right:silver 1px solid;margin:20px 0 10px;padding:4px;" id="codeSnippetWrapper">
        <div style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;padding:0;" id="codeSnippet">
          <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum1">   1:</span> <span style="color:#0000ff;">kill</span> &lt;SPID&gt;</pre>
          
          <p>
            <!--CRLF--></div> </div> 
            
            <p>
              SQLSetMultiUser.sql
            </p>
            
            <div style="border-bottom:silver 1px solid;text-align:left;border-left:silver 1px solid;line-height:12pt;background-color:#f4f4f4;width:97.5%;font-family:&#039;direction:ltr;max-height:200px;font-size:8pt;overflow:auto;border-top:silver 1px solid;cursor:text;border-right:silver 1px solid;margin:20px 0 10px;padding:4px;" id="codeSnippetWrapper">
              <div style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;padding:0;" id="codeSnippet">
                <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum1">   1:</span> <span style="color:#0000ff;">ALTER</span> <span style="color:#0000ff;">DATABASE</span> ReportServer <span style="color:#0000ff;">SET</span> MULTI_USER</pre>
                
                <p>
                  <!--CRLF-->
                </p>
                
                <pre style="text-align:left;line-height:12pt;background-color:#f4f4f4;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum2">   2:</span>&#160; </pre>
                
                <p>
                  <!--CRLF-->
                </p>
                
                <pre style="text-align:left;line-height:12pt;background-color:white;width:100%;font-family:&#039;direction:ltr;color:black;font-size:8pt;overflow:visible;border-style:none;margin:0;padding:0;"><span style="color:#606060;" id="lnum3">   3:</span> <span style="color:#0000ff;">GO</span></pre>
                
                <p>
                  <!--CRLF--></div> </div> 
                  
                  <p>
                    &#160;
                  </p>
                  
                  <p>
                    I can stress enough that is not a replacement in any way for a proper backup plan.
                  </p>
                  
                  <p>
                    &#160;
                  </p>
                  
                  <p>
                    <em><strong><font color="#ff0000" size="6" face="Broadway">“EMBRACE YOUR INNER GEEK AND</font></strong></em>
                  </p>
                  
                  <p>
                    <em><strong><font color="#ff0000" size="6" face="Broadway">ROCK ON”</font></strong></em>
                  </p>