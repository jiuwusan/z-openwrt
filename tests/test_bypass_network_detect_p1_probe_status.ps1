$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'PROBE_RESULT') { throw 'Probe result classification is missing' }
if ($script -notmatch 'PROBE_RESULT=busy') { throw 'Busy probe result is missing' }
if ($script -notmatch 'PROBE_RESULT=error') { throw 'Probe error result is missing' }
if ($script -notmatch 'PROBE_RESULT=unreachable') { throw 'Gateway-unreachable result is missing' }
if ($script -notmatch 'ADDRESS_CHECK_RESULT') { throw 'Address-check result classification is missing' }
Write-Output 'PASS: P1 probe status classification check'
