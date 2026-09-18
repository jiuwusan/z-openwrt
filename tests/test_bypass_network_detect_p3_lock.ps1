$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'stale_pid_check') { throw 'Stale-lock PID recheck is missing' }
Write-Output 'PASS: P3 stale-lock recheck'
