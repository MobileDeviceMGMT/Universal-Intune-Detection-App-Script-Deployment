try
{
$Apps = @()
#$Apps += Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" -ErrorAction Ignore 
$Apps += Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" -ErrorAction Ignore 

$display = $Apps | Where-Object {$PSItem.Displayname -like "YOUR APP NAME*"} | Select DisplayVersion 
[version]$version = $display.DisplayVersion

If($version -ge "YOUR APP VERSION")
{
Write-Host "Application $($version) is installed - checked in regedit"
exit 0
}
else
{
Write-Host "Application is NOT Installed -checked in regedit"
exit 1
}
}
catch
{
Write-Host "Application is NOT Installed"
Write-Host "General error during detection method, message: $($_.Exception.Message)"
exit 1
}
