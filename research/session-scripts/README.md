# 历史脚本：研究记录，不是安装器

这里保留今天实机研究过程中使用的代码，以便核对方法和失败原因。

- **不要直接批量执行。** 脚本含当时固定的应用 UID、路径、缓存状态和阶段性前提，未在第二台机器验证。
- `device.py` 是当时的控制器快照；公开可配置版本位于 `../../scripts/device.py`，没有研究机器的真实 IP。
- `configure-playback.py` 中的 UID 10051 是当时实机 UID，复用前查询当前 BLBL UID。
- `prepare_adb_auth.py` 需要自己的 ADB 公钥；不会附带原操作电脑的密钥。
- `install-manager.sh` 是中间过程：在一个 su 会话里杀父 daemon 可能中断剩余命令。最终采用统一 `/system/bin/magisk` 路径后重启；不推荐执行该历史脚本来迁移已经工作的 root。
- `install-permanent-root.sh` 是首次受控完整提权后的安装阶段，不能在普通 shell 下直接运行，也不能代替前置备份与认证配置。
- `cleanup-*.sh` 和厂商包清单对应 PB70.51.02，不能按包名前缀不加判断地全删。

临时 ARM ELF 的原创汇编和构建器在本目录。完整上下文、目录属性、能力限制和回滚细节见 [实机手册](../../docs/research-2026-11-10.md)。
