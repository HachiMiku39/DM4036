# 第三方软件与源码

本项目原创源码的 MIT 许可不覆盖第三方 APK、解码器和 CA 证书。镜像文件保持原始字节与原签名，版本及哈希见 docs/software.json。

## Release 镜像及对应源码

- FLauncher 0.18.0：GPL-3.0，许可全文为 licenses/flauncher.txt。对应源码：https://gitlab.com/flauncher/flauncher/-/archive/0.18.0/flauncher-0.18.0.tar.gz
- Magisk 23.0：GPL-3.0，许可全文为 licenses/magisk.txt。对应源码：https://github.com/topjohnwu/Magisk/archive/refs/tags/v23.0.tar.gz
- Firefox 143.0.4 Android ARMv7：Mozilla Public License 2.0 及包内第三方许可，MPL 全文为 licenses/firefox.txt。对应完整版本源码：https://archive.mozilla.org/pub/firefox/releases/143.0.4/source/firefox-143.0.4.source.tar.xz 。Android 构建代码位于源码中的 mobile/android，官方 Android 发布包为 https://archive.mozilla.org/pub/fenix/releases/143.0.4/android/fenix-143.0.4-android-armeabi-v7a/ 。保留包内的版权/许可及 about:license 信息。

这些是第三方官方程序的原包镜像，源码由上述原发布方公开提供。源码下载不要求购买或支付，镜像附件也不收取费用。本仓库未修改或重新签名上述 APK。若上游链接不可用，请先从上游同版本标签恢复对应源码，而不是换入不同版本程序。

## 仅提供链接与校验值

BLBL、作者 IJK 插件、酷安、谷歌拼音在软件目录中保留发布源与哈希。本次没有为未确认再分发许可的原包建立二进制镜像。源码可见、免费使用、第三方已建立归档均不被自动视为可再分发许可。

CA 证书来源与说明见 ../certs/README.md。厂商原 ROM、libroot、反编译输出、原始系统 APK、ADB 密钥和用户数据不随本仓库发布。
