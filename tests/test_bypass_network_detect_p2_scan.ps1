$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'temporary_probe "\$gw" "\$prefix\.\$host" already_free') { throw 'Sequential probing does not reuse the free-address check' }
Write-Output 'PASS: P2 sequential probe optimization check'
