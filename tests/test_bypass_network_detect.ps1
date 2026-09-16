$ErrorActionPreference = 'Stop'
$legacyPath = "$PSScriptRoot/../files/usr/sbin/bypass-network-detect"
if (Test-Path $legacyPath) { throw 'Detection logic must remain in the init.d file' }
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch '192\.168\.31\.1') { throw 'Xiaomi gateway is missing' }
if ($script -notmatch '192\.168\.50\.1') { throw 'ASUS gateway is missing' }
if ($script -notmatch '192\.168\.68\.1') { throw 'Deco gateway is missing' }
if ($script -notmatch 'wanted_options=.*3,\$ip.*6,\$ip') { throw 'DHCP gateway/DNS options are not configured' }
if ($script -notmatch 'add_list dhcp\.lan\.dhcp_option="\$option"') { throw 'DHCP options are not written as list entries' }
if ($script -notmatch 'host in 2 3 4 5') { throw 'Static-IP collision fallback is missing' }
if ($script -notmatch 'start=100 and limit=150 remain relative') { throw 'DHCP pool preservation is missing' }
Write-Output 'PASS: bypass-network-detect static checks'
