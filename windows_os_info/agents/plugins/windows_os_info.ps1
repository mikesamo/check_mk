# Get Operating System Info
$OSInfo = Get-WmiObject -class Win32_OperatingSystem

# Check if plugin is supported (7/2008R2 or higher)
if ($OSInfo.Version -gt 6.1) {

        # Check if Service Pack is installed
        if ($OSInfo.CSDVersion -eq $null) {
                $OSInfo.CSDVersion = "N/A"}

        # Prep infomation for Check_MK
        $WindowsVersion = $OSInfo.Caption
        $WindowsVersion = $WindowsVersion -replace '\s','_'
        $WindowsServicePack = $OSInfo.CSDVersion
        $WindowsServicePack = $WindowsServicePack -replace '\s','_'
        $WindowsSerial = $OSInfo.SerialNumber

        # Export infomation to Check_MK
        Write-Host "<<<windows_os_info>>>"
        Write-Host "$WindowsVersion" "$WindowsServicePack" "$WindowsSerial"}
