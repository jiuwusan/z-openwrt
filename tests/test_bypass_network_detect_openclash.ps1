$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'sleep 10') { throw 'OpenClash stability delay is missing' }
if ($script -notmatch '/etc/init\.d/openclash') { throw 'OpenClash service check is missing' }
if ($script -notmatch 'restart_openclash_after_network') { throw 'Delayed OpenClash restart helper is missing' }
Write-Output 'PASS: delayed OpenClash restart check'
