# 公共 CA 根证书

这些是本次从 CA 官方站点取得、解析及有效期核验后补入研究机器的 23 个公共证书文件。不是私钥，也不是一个应不加审核覆盖所有 Android 设备的完整信任库。

- https://letsencrypt.org/certificates/
- https://letsencrypt.org/certs/isrgrootx1.pem
- https://letsencrypt.org/certs/isrg-root-x2.pem
- https://pki.goog/roots.pem

Android 5.1 文件名使用 `openssl x509 -subject_hash_old` 的结果与冲突编号；安装前比较证书实际内容，避免覆盖同 hash 的不同证书。保留原文件，owner 为 root、mode 为 0644，完成后恢复 `/system` 只读。不要关闭证书校验。

证书保留签发方的权利、标识和适用条款；本项目 MIT 许可不重新许可这些第三方证书。
