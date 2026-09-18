$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'ip -4 route show default dev') { throw 'Default-route gateway discovery is missing' }
if ($script -notmatch 'GATEWAYS=.*DISCOVERED_GATEWAY') { throw 'Discovered gateway is not prepended to candidates' }
if ($script -notmatch 'SEEN_GATEWAYS') { throw 'Gateway candidates are not deduplicated' }
Write-Output 'PASS: P1 gateway discovery check'
