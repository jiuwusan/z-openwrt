# z-openwrt

## 旁路由开机网络检测

单文件启动脚本位于：

```text
files/etc/init.d/bypass-network-detect
```

安装到 OpenWrt 后执行：

```sh
chmod +x /etc/init.d/bypass-network-detect
/etc/init.d/bypass-network-detect enable
/etc/init.d/bypass-network-detect start
```

脚本首先检查当前网关；不可达时，依次检测常见品牌默认网关。旁路由地址从网关同网段的 `.2` 依次探测到 `.99`，确认未被占用且网关可达后才提交 UCI 配置。

DHCP 的 `start=100`、`limit=150` 保持不变。脚本通过 DHCP 选项 3 和 6，将旁路由地址作为客户端的默认网关和首选 DNS 下发。

查看运行日志：

```sh
logread -e bypass-network-detect
```

取消开机检测：

```sh
/etc/init.d/bypass-network-detect disable
/etc/init.d/bypass-network-detect stop
```

这只会停止后续开机自动探测，不会恢复已经写入的网络配置。若要恢复为手动配置，请编辑 `/etc/config/network` 和 `/etc/config/dhcp`，再执行：

```sh
uci commit network
uci commit dhcp
/etc/init.d/network restart
/etc/init.d/dnsmasq restart
```

确认不再需要脚本时，可以删除启动文件：

```sh
rm -f /etc/init.d/bypass-network-detect
```
z-openwrt
