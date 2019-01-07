#!/system/bin/sh

netmgr=`getprop ro.use_data_netmgrd`
multisim=`getprop persist.radio.multisim.config`

if [ "$multisim" = "dsds" ] || [ "$multisim" = "dsda" ]; then
    stop ril-daemon
    start ril-daemon
    start ril-daemon1
fi
case "$netmgr" in
    "true")
    start netmgrd
esac
