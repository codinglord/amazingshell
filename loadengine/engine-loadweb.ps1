Clear-Host


#Configuration Section
$ShareConfigUri = "C:\Users\wthatar\Desktop\morningstar-loadengine\Conf.xml"
$ShareEmailTemplate = "success"
$ShareSuccessEmailArgs = New-Object System.Collections.Stack
$ShareWarningEmailArgs = New-Object System.Collections.Stack
$ShareErrorEmailArgs = New-Object System.Collections.Stack


FUNCTION GetConfiguration($configUri)
{
    $dom = [xml](Get-Content $configUri)
    return $dom

}

 FUNCTION SendMail($emailTemplate,$emailArgs)
 {
    $_Now = [DateTime]::Now
    $conf = GetConfiguration($ShareConfigUri)
    
    $emailConf = @{}
    $emailConf.Add("from",     ($conf.SelectNodes("//mailSettings/smtp") | Select-Object -First 1).from)
    $emailConf.Add("host",     ($conf.SelectNodes("//mailSettings/smtp/network") | Select-Object -First 1).host)
    $emailConf.Add("port",     ($conf.SelectNodes("//mailSettings/smtp/network") | Select-Object -First 1).port)
    $emailConf.Add("userName", ($conf.SelectNodes("//mailSettings/smtp/network") | Select-Object -First 1).userName)
    $emailConf.Add("password", ($conf.SelectNodes("//mailSettings/smtp/network") | Select-Object -First 1).password)
    $emailConf.Add("defaultCredential", ($conf.SelectNodes("//mailSettings/defaultCredential") | Select-Object -First 1))
    
    
    $mailTemplate = ($conf.SelectNodes("//mailSettings/mailTemplate") | Where-Object {
        $_.id -eq $emailTemplate
    })


    #Combine email template with parameter
    $parsedEmail = [string]::Format($mailTemplate.template."#cdata-section",$emailArgs.ToArray() )


    $username = $emailConf.userName
    $password = cat $emailConf.password | convertto-securestring
    $cred = new-object  -typename System.Management.Automation.PSCredential `
                        -argumentlist $username, $password






        # Mail variables #
        $enablemail="yes"
    
        $smtpServer = $emailConf.host
        $mailfrom = $emailConf.from
        #$mailto = "Me"
        #$replyto = "codeengine@live.com"

        if ($enablemail -match "yes") 
        { 
	        $msg = new-object Net.Mail.MailMessage
	        
	        $smtp = new-object Net.Mail.SmtpClient($smtpServer) 
	        $msg.From = $mailfrom
	        $msg.IsBodyHtml = $true

            $mailTemplate.recipient.ToString().Split(",") | ForEach-Object {

                $msg.To.Add($_.Trim())


            }
            $mailTemplate.cc.ToString().Split(",") | ForEach-Object {

                $msg.CC.Add($_.Trim())

            }


	        #$msg.ReplyTo = $replyto
	        $msg.Subject = $mailTemplate.subject
	        $msg.Body = $parsedEmail
	        

            $conf.configuration.download.item | ForEach-Object {
                
                $iFile = [String]::Format($_.to,$_Now.AddDays(- $_.delay))
                if (Test-Path (Split-Path $iFile)){

                    $iAtt = new-object Net.Mail.Attachment($iFile)
                    $msg.Attachments.Add($iAtt)

                }

            }
            LogInfo -message "Start to send an email."
	        $smtp.Send($msg)
            LogInfo -message "An email has been sent successfully."
            $smtp.dispose()
        }



   
    
}

FUNCTION LogFail($message)
{
        $conf = GetConfiguration($ShareConfigUri)
        Write-Host $message
        Write-EventLog  -LogName Application `
                    -Source $conf.configuration.healthMonitor.log.source `
                    -EventId "1" `
                    -Message $message `
                    -EntryType Error 
                    
}

FUNCTION LogInfo($message)
{
    $conf = GetConfiguration($ShareConfigUri)
    Write-Host $message
    Write-EventLog  -LogName Application `
                    -Source $conf.configuration.healthMonitor.log.source `
                    -EventId "1" `
                    -Message $message `
                    -EntryType Information
}

FUNCTION LogSuccess($message)
{
    $conf = GetConfiguration($ShareConfigUri)
    Write-Host $message
    Write-EventLog  -LogName Application `
                    -Source $conf.configuration.healthMonitor.log.source `
                    -EventId "1" `
                    -Message $message `
                    -EntryType Information
}

FUNCTION InitAutomate()
{
    <#
    cd C:\DotNetProjects\DotComDotAU\lib\Watin
    [System.Reflection.Assembly]::LoadFile((get-item Interop.SHDocVw.dll).FullName)
    [System.Reflection.Assembly]::LoadFile((get-item Microsoft.mshtml.dll).FullName)
    [System.Reflection.Assembly]::LoadFile((get-item WatiN.Core.dll).FullName)
    #>

    dir $conf.configuration.waitn.path

    $conf = GetConfiguration($ShareConfigUri)
    $conf.configuration.waitn.lib.source | ForEach-Object {


    [System.Reflection.Assembly]::LoadFile((get-item $_.Trim()).FullName)


    }

}

FUNCTION MAIN($configUri)
{
    <# Automate was disabled! #>
    #InitAutomate


    LogInfo -message "Begin Downlaod"


    #Load Configuration
    $conf = GetConfiguration($ShareConfigUri)
  

    $_PostData = @{}
    $_Request = $null
    $_Now = [DateTime]::Now
    $_LoginUri = ($conf.SelectNodes("//loginurl") | Select-Object -First 1)."#text".ToString().Trim()
    $_Session = $null
    
    $_MailErrorMessage = $null
    $_MailWarnningMessage = $null
    $_MailCompleteMessage = $null
    
    $_MailSender = $null
    $_MailRecipients = $null
    



    #Init postdata
    $conf.SelectNodes("//postdata/*") | ForEach-Object {
        
        $_PostData.Add($_.Name,$_."#text")

    }
    

    #Login
    Invoke-WebRequest -Uri $_LoginUri -Body $_PostData -SessionVariable session `
                      -UserAgent "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36" 
                      #-Method Post
                      
                      
            


    #Init download items
    $conf.SelectNodes("//download/item") | ForEach-Object {
    
        $iTo = [String]::Format($_.to,$_Now.AddDays(- $_.delay))
        $iFrom = [String]::Format($_.from,$_Now.AddDays(- $_.delay))
        

        try
        {
            $iMsg = "[Downloading] --- " + $iFrom
            LogInfo -message $iMsg
            LogInfo -message $iFrom
            

        

            $r1 = Invoke-WebRequest -Uri $iFrom -WebSession $session `
                    -UserAgent "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36" 
                    #-Method Post
            
            
            #Write file to folder
            $r1.Content.ToString() | Out-File $iTo -Force utf8 
          
            

            #Log both success or error
            if ((Get-Item $iTo).Length -lt 15KB){
                throw New-Object System.Exception("[Business] - Invalid file format.\r\nPlease check " + $iTo + "\r\nAlso " + $iFrom)
            }
            else
            {
                LogSuccess -message ([string]::Format("Download {0} was successfuly.",$iFrom) )
                $ShareSuccessEmailArgs.Push($iFrom)
            }

        }
        catch [Exception]
        {
            LogFail -message $_.Exception.Message
            $ShareWarningEmailArgs.Push($iFrom)
        }


    }

    
    LogInfo "End Download"
}



    try
    {

        MAIN($ShareConfigUri)
        
    }
    catch [Exception]
    {
    
        $msg = [string]::Format("Unexpected error has been occured.<br />-CategoryInfo : {0}<br />-ScriptStackTrace : {1}",$_.CategoryInfo,  ($_.InvocationInfo | Format-List | Out-String) )
        LogFail -message $msg 
        $ShareErrorEmailArgs.Push($msg)

    }
    finally
    {
    
        $paramMail = New-Object System.Collections.ArrayList
        if ($ShareErrorEmailArgs.Count -gt 0)
        {
            $paramMail.Add(($ShareErrorEmailArgs | Format-List | Out-String))
            SendMail -emailTemplate "error" `
                     -emailArgs $paramMail
        }
        elseif ($ShareWarningEmailArgs.Count -gt 0)
        {

            $paramMail.Add((($ShareSuccessEmailArgs) | ForEach-Object { "$_ <br />" } | Format-List | Out-String))
            $paramMail.Add((($ShareWarningEmailArgs) | ForEach-Object { "$_ <br />" } | Format-List | Out-String))
            
            
            SendMail -emailTemplate "warning" `
                     -emailArgs $paramMail

        }
        else
        {
            $paramMail.Add(($ShareSuccessEmailArgs | ForEach-Object { "$_ <br />" } | Format-List | Out-String))
            SendMail -emailTemplate "success" `
                     -emailArgs $paramMail  
        }


        

    }
