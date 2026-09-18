$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'required in uci ip ping') { throw 'Required-command check is missing' }
Write-Output 'PASS: P3 dependency check'
