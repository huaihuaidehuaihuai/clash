SKIPUNZIP=1

dataDir="/data/adb/cmfm"
timeStamp=$(date "+%Y%m%d%H%M")
UIPrint="ui_print"
SetPerm="set_perm"
SetPermRecursive="set_perm_recursive"

case "${ARCH}" in
    arm64)
        ;;
    *)
        ${UIPrint} "不支持的架构"
        exit 1
esac

unzip -o "${ZIPFILE}" -x 'META-INF/*' -d ${MODPATH} >&2

if [ ! -d ${dataDir} ] ; then
    ${UIPrint} "- 首次安装，开始初始化环境"
    mkdir -p ${dataDir}
    mv -f ${MODPATH}/cmfm/* ${dataDir}/
else
    ${UIPrint} "- 非首次安装，开始备份数据"
    mkdir -p ${dataDir}.old/${timeStamp}
    mv -f ${dataDir}/* ${dataDir}.old/${timeStamp}/
    ${UIPrint} "- 旧数据已备份至 ${dataDir}.old/${timeStamp}/"
    cp -rf ${MODPATH}/cmfm/* ${dataDir}/
    cp -f "${dataDir}.old/${timeStamp}/cache.db" "${dataDir}/cache.db"
    cp -f "${dataDir}.old/${timeStamp}/config.yaml" "${dataDir}/config.yaml"
    cp -f "${dataDir}.old/${timeStamp}/GeoSite.dat" "${dataDir}/GeoSite.dat"
    cp -f "${dataDir}.old/${timeStamp}/GeoIP.dat" "${dataDir}/GeoIP.dat"
    cp -f "${dataDir}.old/${timeStamp}/src/caches.json" "${dataDir}/src/caches.json"
    cp -rf ${dataDir}.old/${timeStamp}/ProxyProviders/* ${dataDir}/ProxyProviders/
    cp -rf ${dataDir}.old/${timeStamp}/RuleProviders/* ${dataDir}/RuleProviders/
    cp -rf ${dataDir}.old/${timeStamp}/ClashDashboard/* ${dataDir}/ClashDashboard/
    cp -rf ${MODPATH}/cmfm/ClashDashboard/YacdMeta/* ${dataDir}/ClashDashboard/YacdMeta/
    ${UIPrint} "- 已迁移 ProxyProviders 文件夹，RuleProviders 文件夹，ClashDashboard 文件夹（强制更新 Yacd-Meta），config.yaml，versionCache.json，geoxCache，subInfoCache.json 及 GeoX 数据库"
    ${SetPerm} ${MODPATH}/updateConfig 0 0 7777
    ${SetPerm} ${MODPATH}/system/bin/node 0 0 7777
    ${MODPATH}/system/bin/node ${MODPATH}/updateConfig "${dataDir}.old/${timeStamp}/src/config.json" "${dataDir}/src/config.json" > updateConfig.log 2>&1
    updateLog=$(cat updateConfig.log)
    ${UIPrint} "${updateLog}"
fi

rm -rf ${MODPATH}/cmfm
rm -rf ${MODPATH}/updateConfig
rm -rf updateConfig

sleep 1

${UIPrint} "- 开始设置环境权限"
${SetPermRecursive} ${MODPATH} 0 0 7777 7777
${SetPermRecursive} ${dataDir} 0 0 7777 7777