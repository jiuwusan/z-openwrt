$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch '(?s)boot\(\).*?sleep 10.*?detect') { throw 'Boot detection delay is not 10 seconds' }
Write-Output 'PASS: boot detection delay check'
