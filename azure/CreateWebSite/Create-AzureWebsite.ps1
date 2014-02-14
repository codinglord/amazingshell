

[xml]$SharedConfig = Get-Content -Path "C:\Projects\GITsDEMO\amazingshell\azure\config.config"







Function Create-WebSite()
{

    #Shortname config
    $conf = $SharedConfig 


    #Import publishsetting
    Import-AzurePublishSettingsFile `
        -PublishSettingsFile $conf.SelectSingleNode("/configuration/create-azurewebsite/publishsettings")."#text"




    New-AzureWebsite `
        -Hostname $conf.SelectSingleNode("/configuration/create-azurewebsite/hostname")."#text"`
        -Location $conf.SelectSingleNode("/configuration/create-azurewebsite/location")."#text"
        




    #Publish-AzureServiceProject -ServiceName 

}






Function Main(){


    Create-WebSite

}

Main 