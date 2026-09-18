$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'local_address') { throw 'Local-address fallback is missing' }
if ($script -notmatch 'local_address.*candidate') { throw 'Local address must be checked before fallback probing' }
Write-Output 'PASS: P0 local-address fallback check'
