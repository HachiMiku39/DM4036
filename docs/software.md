# 用到的软件、原包和校验值

研究日期：2026-11-10。所有 APK 按 Android 5.1 / ARMv7 核对，原包未重新签名。大包不进入 Git 历史，镜像附件见 [Release](https://github.com/HachiMiku39/DM4036/releases/tag/research-2026-11-10)。

| 软件 | 获取方式 | 原来源 | 对应源码/许可 |
|---|---|---|---|
| BLBL 0.1.29 | 原来源链接，不附二进制镜像 | [下载/发布页](https://github.com/cat3399/blbl/releases) | [对应源码](https://github.com/cat3399/blbl)；No explicit redistribution license found in the examined upstream tree |
| FLauncher 0.18.0 | Release 附件 | [下载/发布页](https://gitlab.com/api/v4/projects/26632151/packages/generic/flauncher/0.18.0/flauncher-0.18.0.apk) | [对应源码](https://gitlab.com/flauncher/flauncher/-/archive/0.18.0/flauncher-0.18.0.tar.gz)；GPL-3.0 |
| 盒子助手 1.2 | Release 附件 | [下载/发布页](https://github.com/HachiMiku39/DM4036/releases/tag/research-2026-11-10) | [对应源码](https://github.com/HachiMiku39/DM4036/tree/main/helper)；MIT (original project code) |
| Magisk 23.0 | Release 附件 | [下载/发布页](https://github.com/topjohnwu/Magisk/releases/tag/v23.0) | [对应源码](https://github.com/topjohnwu/Magisk/archive/refs/tags/v23.0.tar.gz)；GPL-3.0 |
| Firefox 143.0.4 | Release 附件 | [下载/发布页](https://archive.mozilla.org/pub/fenix/releases/143.0.4/android/fenix-143.0.4-android-armeabi-v7a/) | [对应源码](https://archive.mozilla.org/pub/firefox/releases/143.0.4/source/firefox-143.0.4.source.tar.xz)；MPL-2.0 and bundled third-party notices |
| 酷安 13.3 | 原来源链接，不附二进制镜像 | [下载/发布页](https://www.coolapk.com/) | 闭源；Proprietary; no redistribution grant included |
| IJK ARMv7 插件 | 原来源链接，不附二进制镜像 | [下载/发布页](https://cat3399.top/blbl/ijkplayer/armeabi-v7a/libijkplayer.zip) | [对应源码](https://github.com/cat3399/blbl/blob/main/app/src/main/java/blbl/cat3399/feature/player/engine/IjkPlayerPlugin.kt)；See the author build and codec licenses |
| 谷歌拼音 4.5.2 ARMv7 | 原来源链接，不附二进制镜像 | [下载/发布页](https://gitlab.opengapps.org/api/v4/projects/opengapps%2Farm/repository/files/app%2Fcom.google.android.inputmethod.pinyin%2F17%2Fnodpi%2F4520312.apk/raw?ref=master&lfs=true) | [对应源码](https://gitlab.opengapps.org/opengapps/arm/-/blob/master/app/com.google.android.inputmethod.pinyin/17/nodpi/4520312.apk)；Google proprietary application; public archive is an upstream source, not a redistribution grant |

## 使用前核对

- Firefox 为 143.0.4 ARMv7 历史版，软件渲染配置见 `scripts/firefox-user.js`。当前新版已不支持本机系统。
- 酷安官网当日提供的 16.7.2 要求 Android 7（API 24）；研究使用 13.3 历史包，签名与官网下载包一致，首次协议由用户选择。
- 谷歌拼音必须选择 4.5.2.193126728 ARMv7（4520312），不要下载 arm64 或 Wear OS 版本。Git LFS pointer 不是 APK。
- IJK 需下载 ZIP 后提取 `libijkplayer.so`；下面哈希指提取后的库，而非 ZIP。
- BLBL 和部分插件的上游仓库可以查看代码，但这里没有据此推定可任意再分发，保留官方发布链接。

## 研究原包 SHA-256

```text
2c93ff4b4a9a885e2b15075c45e21fc0d4dbb264b91fbd53fc586360ea159bc6  blbl-android-0.1.29-release.apk
376fc528c880cdf7c7c04b2d3708c69f911144498218babb6300808b772af32e  flauncher-0.18.0.apk
3744fc0c8b8e12a3a78758c59cfff798dcabbc356e5a2b3365148fdf41c54ed6  dm4036-time-helper.apk
079bc3a7f67413cb12509d1b811958dd7e7c7fb593d3f0507954fea72077b524  Magisk-v23.0.apk
af560738627d4efc9ace75e708fc48aad6a24c78ef43a89daca27e16ff3829f8  firefox-143.0.4.apk
cbf06722aa499a9763ee7c1d3d9a96b85076e997ac751cf6209f4124e2566ec1  coolapk-compatible-candidate.apk
356169e7803830edfbb641654a9f192120044b6c3296d96becdb41278205e6ad  libijkplayer.so
506a887c03ffadf27efe351317b7059c876086e046f20ecc724ab2e7e3bbd696  google-pinyin-4.5.2-armv7.apk
```

该列表保留研究时文件名；Release 中 Firefox 和助手的文件名作了版本化处理，实际附件名与哈希见 [release-assets.sha256](../checksums/release-assets.sha256)。机器可读清单：[software.json](software.json)。

谷歌拼音开发者证书 SHA-256：`3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a`。酷安证书 SHA-256：`8037a13b154927d4a8e5649e294dab6c09a5296693578e2d5d02ece32a9678dc`。
