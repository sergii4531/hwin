Stop-Service -Name wuauserv -Force
Set-Service -Name wuauserv -StartupType Disabled
Stop-Service -Name bits -Force
Set-Service -Name bits -StartupType Disabled
Stop-Service -Name cryptsvc -Force
Set-Service -Name cryptsvc -StartupType Disabled
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download" -Recurse -Force
New-Item -Path "C:\Windows\SoftwareDistribution\Download" -ItemType Directory -Force
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 1 -Type DWord
