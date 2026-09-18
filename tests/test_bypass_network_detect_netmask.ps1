$ErrorActionPreference = 'Stop'
$script = Get-Content -Raw "$PSScriptRoot/../files/etc/init.d/bypass-network-detect"
if ($script -notmatch 'current_netmask=.*network\.lan\.netmask') { throw 'Current LAN netmask is not read' }
if ($script -notmatch 'configure "\$current_gw" "\$current_ip" "\$current_netmask"') { throw 'Fast path does not preserve the current netmask' }
if ($script -notmatch 'set_network_option network\.lan\.netmask "\$netmask"') { throw 'configure still forces a fixed netmask' }
Write-Output 'PASS: current static netmask preservation check'
