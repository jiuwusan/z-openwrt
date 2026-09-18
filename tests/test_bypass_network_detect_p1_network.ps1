$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'NETWORK_CHANGED') { throw 'Network change flag is missing' }
if ($script -notmatch '/etc/init\.d/network restart') { throw 'Network restart is missing' }
Write-Output 'PASS: P1 network-change application check'
