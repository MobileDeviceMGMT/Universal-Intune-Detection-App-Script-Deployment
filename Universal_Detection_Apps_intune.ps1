try
{
$Apps = @()
#$Apps += Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" -ErrorAction Ignore 
$Apps += Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" -ErrorAction Ignore 

$display = $Apps | Where-Object {$PSItem.Displayname -like "Java(TM) SE Development Kit 21*"} | Select DisplayVersion 
[version]$version = $display.DisplayVersion

If($version -ge "21.0.5.0")
{
Write-Host "JAVA JDK $($version) is installed - checked in regedit"
exit 0
}
else
{
Write-Host "JAVA JDK is NOT Installed -checked in regedit"
exit 1
}
}
catch
{
Write-Host "JAVA JDK is NOT Installed"
Write-Host "General error during detection method, message: $($_.Exception.Message)"
exit 1
}