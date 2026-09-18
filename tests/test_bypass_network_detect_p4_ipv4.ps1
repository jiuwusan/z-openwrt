$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'octet.*-le 255') { throw 'IPv4 octet range validation is missing' }
Write-Output 'PASS: P4 IPv4 range validation check'
