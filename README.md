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

脚本首先检查当前网关；不可达时，依次检测常见品牌默认网关。旁路由地址优先使用网关同网段的 `.2`，冲突时依次尝试 `.3`、`.4`、`.5`。确认可达后才提交 UCI 配置。

DHCP 的 `start=100`、`limit=150` 保持不变。脚本通过 DHCP 选项 3 和 6，将旁路由地址作为客户端的默认网关和首选 DNS 下发。

查看运行日志：

```sh
logread -e bypass-network-detect
```
z-openwrt
