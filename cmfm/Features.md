# 特性说明

## Clash 相关

- 纯 tun 模式
- 无黑白名单
- 免流跳点极低
- 较详细的启动日志
- 支持启动前自动更新内核
- 更好用的分流规则

## Node 相关

- 提供 Clash 启动前预下载订阅文件的能力
- 提供 Clash 控制、log 查看的服务（请访问网页面板以获得技术支持 `http://localhost:23333` ）
- 提供旧版核心可用的热点模式
请在 src/config.json 里面配置 `APMode` 项目，只支持 `alpha-9424610` 以下（不含）的核心开启，已做版本验证，使用时请配置 `forwardUpdateKernel`（自动更新内核）
- 提供 GeoX 定时更新的能力
请在 src/config.json 里配置 `autoUpdateGeoX` （自动更新开关）及 `geoxInterval` （自动更新时间间隔，单位：毫秒） 项目
- 提供订阅信息查看的服务（请访问网页面板以获得技术支持 `http://localhost:23333` ）
支持添加黑名单，请在 config.yaml 中给不想查询订阅信息的 proxyProvider 添加 `info-blacklist` 属性并置为 `true`

## Magisk 相关

- 支持升级时保留旧版备份
- 支持升级时迁移旧版配置文件
