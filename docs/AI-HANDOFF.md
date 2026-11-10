# 给下一位 AI

先读 [README](../README.md)、[完整研究](research-2026-11-10.md)、[软件目录](software.md) 和 [历史脚本说明](../research/session-scripts/README.md)。

1. 取得当前设备的所有者授权，读取型号、固件、ABI、存储及当前软件状态。`BOX_IP` 是占位符，不是设备发现结果。
2. 已完成改造的机器先测试普通 `su -c id`，不要再运行首次提权。核对 `/system/bin/magisk` 与 su 的目标是同一文件，避免 inode 校验失败。
3. 当前预期：开机校时后进 BLBL，HOME 回 FLauncher，设置为原生 Android Settings，时区 Asia/Shanghai，NTP 为阿里云，联网检测为小米。
4. B 站原故障是 AAC OMX 初始化失败。修复是作者 IJK ARMv7 插件 + AVC。HTTP 503、账号画质限制、TLS 错误要分别诊断。
5. 保留投屏/遥控依赖。`research/vendor-app-packages.json` 是本次研究的厂商路径清单，不是适用于所有设备的删除规则。
6. 助手源码构建需自己的签名，不能把新签名包直接覆盖现有特权应用。更新运行中的 APK 要用同目录原子替换并核对 PMS 扫描结果。
7. 结束时验证重启、自启、HOME、原生设置、root 授权、校时、TLS、视频及输入；恢复 `/system` 只读并确认 ADB 认证开启。

没有刷入更高 Android；没有手机投屏端到端验证；没有在酷安协议选择前验收下载；早期上电动画未录屏。原厂 rootserver 和旧内核仍存在，不能把安装权限管理器解释为系统漏洞已被修补。

此仓库没有私钥、Cookie、设备日志、真实局域网 IP 或厂商分区备份。没有自动授权未来 AI 操作任意设备。
