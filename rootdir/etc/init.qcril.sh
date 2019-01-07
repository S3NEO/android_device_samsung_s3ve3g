#!/system/bin/sh
export PATH=/system/xbin:$PATH

setprop gsm.version.baseband `strings /firmware/image/modem.b21 | grep "^M8626A-" | head -1`

/system/bin/sh setenforce 0
