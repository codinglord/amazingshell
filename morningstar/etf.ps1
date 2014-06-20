







Function Write-EngineETF($issueNo,$notes,$contents,$to){

$html = @"
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
	<title>Asia ETF Newsletter </title>
</head>
<body>
	<form name="form1" method="post" action="newsletter.aspx?CLANG=EN-US&amp;period=NLNUM{0}"
	id="form1">
	<div>
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="" />
	</div>
	<table border="0" align="center" style="font-size: 12px; padding: 0 0 0 0;">
		<tr>
			<td>
				<table border="0" width="800" align="center" cellspacing="0" cellpadding="1" style="border-bottom: 1px solid #a5a5a5;
					border-left: 1px solid #a5a5a5; border-right: 1px solid #a5a5a5; border-top: 8px solid #ff0000">
					<tr>
						<td width="100%" align="right" style="padding: 7px 17px 0px 17px;">
							<table border="0" width="100%" cellspacing="0" cellpadding="0" style="border-bottom: 1px solid #c6c6c6;">
								<tr>
									<td width="170" valign="bottom" align="left" bgcolor="#ffffff">
										<a href="http://hk.morningstar.com">
											<img src="http://www.morningstar.co.uk/includes/images/logo_morningstar.gif" border="0"></a>
									</td>
									<td bgcolor="#FFFFFF" valign="top" align="left">
										<a style="font-size: 14px; line-height: 18px; color: #585858; font-family: Verdana, Arial, Helvetica, sans-serif;
											text-decoration: none;" href="http://hk.morningstar.com"><span id="Label1">Asia ETF
												Newsletter</span></a>
									</td>
									<td bgcolor="#FFFFFF" valign="top" align="right" style="font-size: 9px; line-height: 12px;
										color: #585858; font-family: Verdana, Arial, Helvetica, sans-serif; text-decoration: none;">
										<div style="color: #666666; float: Left; height: 25px; padding-right: 10px; padding-top: 6px;
											text-align: right; font-size: 12px;">
										</div>
										<div style="color: #666666; float: right; height: 25px; padding-right: 10px; padding-top: 6px;
											text-align: right; font-size: 12px;">
										</div>
									</td>
								</tr>
								<tr height="30">
									<td colspan="3">
										&nbsp;
									</td>
								</tr>
							</table>
							<table border=0 width="100%" cellspacing=0 cellpadding=0>
								<tr>
									<td valign=top style="font-size: 13px; color: #585858; line-height: 18px; font-family: Verdana, Arial, Helvetica, sans-serif; text-decoration: none; padding: 6px 0 0 0; text-align: left;">
									   <span id="lbNote">
                                            
                                            <!-- ETF Note -->
                                            {1}
										    
										    
                                       </span>
									</td>
								</tr>
							</table>
							<table border="0" width="100%" cellspacing="0" cellpadding="0">
								<col width="400" />
								<col width="16" />
								<col width="320" />
								<tr height="10">
									<td colspan="3">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="3" style="background-color: #ffffff; height: 110px; width: 100%">
										<!-- Image Tag (Tag for Images only) //TAG for network 665: Morningstar // Website: Morningstar Hong Kong // Page: M* HK ETF Centre // Placement: M* HK ETF Newsletter LB_TH (3749748)  // created at: Apr 10, 2012 11:09:30 AM  -->
										<a href="http://adserver.adtech.de/adlink|3.0|665|3749748|0|225|ADTECH;cookie=no;uid=no;key=key1+key2+key3+key4;grp=[group]"
											target="_blank">
											<img src="http://adserver.adtech.de/adserv|3.0|665|3749748|0|225|ADTECH;cookie=no;uid=no;key=key1+key2+key3+key4;grp=[group]"
												border="0" height="90" width="728" alt="[Alt-Text]"></a>
									</td>
								</tr>
								<tr>
									<td>
										<!-- ETF Heading-->
										<div style="background-color: #FDFDFD; padding-bottom: 5px; padding-top: 1px; float: left;"
											id="ctl00_titleDiv">
											<h1 id="ctl00__headline" style="color: #000000; font-size: 18px; padding-bottom: 10px;
												font-family: Verdana, Arial, Helvetica, sans-serif; text-align: left;">
												<span id="lbETFHeader" style="font-size: 18px;">Exchange Traded Funds (ETFs)</span></h1>
										</div>
									</td>
								</tr>
								<tr>
									<td valign="top" style="text-align: left; width: 400px; height: 18px;" bgcolor="#FFFFFF">
										<!-- ETF left side-->
										<div id="indexDiv" style="text-align:left;margin-right: 16px; padding-top: 3px; width: 370px;">
                
                <div id="etf"  style="width: 370px;float:left; margin-right:0px;text-align:left;">

                                                                    
                        
                            
                    
                    <!-- LOOP Content -->
                    {2}



   
                            
                                                
                        

                    <div class="ms_space_row" style="clear:both;height:10px;text-align:left; "></div>
                    
                </div>
                
                

            </div>
										<!-- End ETF left side -->
									</td>
									<td style="width: 16px; height: 18px;">
										&nbsp;
									</td>
									<td valign="top" align="left">
										<!-- Image Tag (Tag for Images only) //TAG for network 665: Morningstar // Website: Morningstar Hong Kong // Page: M* HK ETF Centre // Placement: M* HK ETF Newsletter MPU_TH (3749813)  // created at: Apr 10, 2012 11:09:45 AM  -->
										<a href="http://adserver.adtech.de/adlink|3.0|665|3749813|0|170|ADTECH;cookie=no;uid=no;key=key1+key2+key3+key4;grp=[group]"
											target="_blank">
											<img src="http://adserver.adtech.de/adserv|3.0|665|3749813|0|170|ADTECH;cookie=no;uid=no;key=key1+key2+key3+key4;grp=[group]"
												border="0" height="250" width="300" alt="[Alt-Text]"></a>
									</td>
								</tr>
								<tr height="20">
									<td>
										&nbsp;
									</td>
									<tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="padding: 7px 17px 7px 17px; vertical-align: middle; text-align: left;
							height: 34px; background-color: #A5A5A5;">
							<font style="font-size: 10px; line-height: 12px; color: #FFFFFF; font-family: Verdana, Arial, Helvetica, sans-serif;
								text-decoration: none;">If you no longer wish to receive this newsletter, simply
								opt-out using the <a href="http://www.elabs3.com/functions/unsubscribed.html" style="text-decoration: underline;
									color: white">unsubscribe page</a>.</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
"@

$template = @"
<!--{0}-->
<div style="border-top-color: gray;border-top-style: solid;border-top-width: 1px;text-align:left; 	padding:0px 0px 0px 0px;padding-right:6; width: 370px; ">
    <div style="clear:both;height:5px;width:76%;text-align:left;"></div>
    <img style='border-width:0px;padding-top:5px;' src='{2}' height='80' width='80' style=' float: right;height: 80px;margin-left: 5px;width: 80px;margin-top: 5px;'>
    <div style="line-height:20px; float:left;  width:76%; 	padding:0px 0px 0px 0px;">





        <span id="ResearchArticleRepeater_ctl01_LinkText" style="line-height:16px;font-size:12px;font-family:Verdana, Arial, Helvetica, sans-serif;font-weight:700;text-decoration:none;color:Black;;"><a style='text-decoration: none;color:Black;' href='{1}'>{0}</a></span>
        <div style=' padding-top:3px; text-align:left;   '></div>
        <div style=' font-size:12px;padding:0 0 0 0; text-align:left;font-family: Verdana, Arial, Helvetica, sans-serif; '>
            {3}
        </div>


    </div>
    <div style=' font-size:10px;padding:0 0 0 0; text-align:left;font-family: Verdana, Arial, Helvetica, sans-serif;  clear:both; padding-top:3px;'>{4}</div>
    <div style="clear:both;height:5px;text-align:left; "></div>

</div>
"@

$content = ""

$note = ""

$contents | % {

    $content += [String]::Format($template,
        $_.Subject,
        $_.Link,
        $_.ImagePath,
        $_.Summary,
        $_.Author
    );

}


$notes | % {

    $note += [String]::Format("<p>{0}</p>",$_)

}


CLS
"**********************************Copy Below Text!**********************************"
$content


$issueContent = [String]::Format($html,$issueNo,$note,$content)


$issueContent | Out-File -FilePath $to


}





<#
****************************************
Send parameter to write ETF letter.
****************************************
#>



$headlines = New-Object System.Collections.ArrayList($null)


$headlines.Add(@{
        "Subject" = "Asia ETF Roundup (Market) – May 2014"; 
        "Link" = "http://www.morningstarthailand.com/th/news/125318/asia-etf-roundup-(market)-%e2%80%93-may-2014.aspx";
        "ImagePath" = "http://hkbeta.morningstar.com/ods_images/icon_etftimes.gif";
        "Summary" = "The US Federal Reserve began to lay plans for monetary policy normalization.";
        "Author" = "Jackie Choy, CFA | 2014-06-05"
     });

$headlines.Add(@{
        "Subject" = "Asia ETF Roundup (Industry) – May 2014"; 
        "Link" = "http://my.morningstar.com/ap/news/125140/Asia-ETF-Roundup-(Industry)-%e2%80%93-May-2014.aspx";
        "ImagePath" = "http://hkbeta.morningstar.com/ods_images/icon_ceftimes.gif";
        "Summary" = "RQFII Equity Sector ETFs Launched in Hong Kong";
        "Author" = "Jackie Choy, CFA | 2014-06-05"
     });

$headlines.Add(@{
        "Subject" = "New and Updated ETF Research (As of 4 June 2014)"; 
        "Link" = "http://www.morningstarthailand.com/th/news/125319/new-and-updated-etf-research-(as-of-4-june-2014).aspx";
        "ImagePath" = "http://hkbeta.morningstar.com/ods_images/icon_radar.jpg";
        "Summary" = "Our ETF analyst team has recently published updated a research report on an exchange-traded fund (ETF) listed in Taiwan.";
        "Author" = "Morningstar ETF Analysts | 2014-06-04"
     });

$headlines.Add(@{
        "Subject" = "Tracking Chinese Equity ETFs"; 
        "Link" = "http://www.morningstarthailand.com/th/news/125320/tracking-chinese-equity-etfs.aspx";
        "ImagePath" = "http://hkbeta.morningstar.com/ods_images/icon_marketflat.jpg";
        "Summary" = "The report examined the factors that influence the tracking performance of Chinese equity ETFs. The universe we have examined in this study includes 33 ETFs tracking five popular Chinese equit.";
        "Author" = "Jackie Choy, CFA | 2014-05-29"
     });

$headlines.Add(@{
        "Subject" = "Risk Management: Protect Your Portfolio from Market Falls"; 
        "Link" = "http://www.morningstarthailand.com/th/news/125321/risk-management-protect-your-portfolio-from-market-falls.aspx";
        "ImagePath" = "http://hkbeta.morningstar.com/ods_images/icon_risk.jpg";
        "Summary" = "Investors wanting to protect themselves from market fluctuations have a range of tools at their disposal - prepare for losses and you can mitigate them.";
        "Author" = "Gordon Rose, CIIA | 2014-05-22"
     });

$headlines.Add(@{
        "Subject" = "Risk Management: Lower the Risk in Your ETF Portfolio"; 
        "Link" = "http://www.morningstarthailand.com/th/news/125322/risk-management-lower-the-risk-in-your-etf-portfolio.aspx";
        "ImagePath" = "http://hkbeta.morningstar.com/ods_images/icon_risk.jpg";
        "Summary" = "In the fourth part of our series on managing risk in your portfolio we look at how alternative strategies solve inherent flaws in market-cap-weighted indices";
        "Author" = "Gordon Rose, CIIA | 2014-05-15"
     });




$notes = @(  "It was a relatively quiet month in the ETF industry and across the global markets. The US Federal Reserve began to lay plans for monetary policy normalization, though it did not specify a timeline. Meanwhile the political situation in Thailand had some impact on the local market and its currency. Within the ETF industry, we saw the launch of the first two RQFII equity sector ETFs. For more details, please read our ""Asia ETF Roundup (Market) – May 2014"" and ""Asia ETF Roundup (Industry) – May 2014"".",
             "In this newsletter, we feature our research report ""On the Right Track: Measuring Tracking Efficiency in Chinese Equity ETFs,"" which examines the factors that influence the tracking efficiency of Chinese equity ETFs. In addition, our analysts also continued their work on the topic of risk management, and we showcase the last two installments of the series. Lastly, we feature an updated research report on the Yuanta/P-shares Taiwan Top 50 ETF (0050)."
          );


Write-EngineETF -issueNo "25" `
                -notes $notes `
                -contents $headlines `
                -to "D:\Thailand\ETFsNewsletter\Asia-Newsletter-25.htm"
