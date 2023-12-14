wait_until_login()
{
    # in case of /data encryption is disabled
    while [ "$(getprop sys.boot_completed)" != "1" ]; do
        sleep 1
    done

    # we doesn't have the permission to rw "/sdcard" before the user unlocks the screen
    local test_file="/sdcard/Android/.CFMTEST"
    true > "$test_file"
    while [ ! -f "$test_file" ]; do
        true > "$test_file"
        sleep 1
    done
    rm "$test_file"
}

wait_until_login

sleep 5

dataDir="/data/adb/cmfm"
srcDir="${dataDir}/src"
runPath="${dataDir}/run"
busyboxPath="/data/adb/magisk/busybox"

mv -f ${runPath}/node.log ${runPath}/node.log.old
nohup ${srcDir}/bundle > ${runPath}/node.log 2>&1 &
