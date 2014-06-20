


Function Check-EngineDiskSpace($remotecomputer)
{
    $disk = $null;
    
    TRY
    {


        $disk = Get-WmiObject Win32_LogicalDisk -ComputerName $remotecomputer | Where "DeviceID" -EQ "C:"
        
    }
    CATCH [Exception]
    {
        Write-Host [String]::Format("{0}",$_.Exception.Message);
    }



    return $disk | Format-Table;
    
}



Check-EngineDiskSpace(".")   # {$_.DeviceID -EQ "C:"}


