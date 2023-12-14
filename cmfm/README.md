# CMFM 摆烂版使用说明

## 从这里开始

1. 修改 config.yaml 文件按照提示填写订阅地址
2. 重启
3. 浏览器访问 `http://localhost:23333` 进入喵面板（喵口令默认为 `node` ，可在 `src/config.json` 中自定义）

## 温馨提醒

- 你不知道怎么改就别乱改，跑不起来就是你的锅
- 看 Features.md 以获得更加丰富的功能介绍
- 拥有百度免流包的免流佬可以在网页面板中设置 DNS 代理组为百度免流以减小跳点
- 多机场用户可以参照 多机场示例.yaml 修改 config.yaml
- 配置错误请运行以下命令进行检查
`su -c /system/bin/clash -t -d /data/adb/cmfm/ -f /data/adb/cmfm/config.yaml`
