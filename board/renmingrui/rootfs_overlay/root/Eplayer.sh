#!/bin/sh

# 监控Eplayer进程

echo "Eplayer 守护器开始"
echo "等待网络ok"

wwanStatus=0;
export TSLIB_TSDEVICE=/dev/input/event1
export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/event1
export QT_QPA_FB_TSLIB=1
amixer sset Headphone 127,127
amixer sset 'Right Output Mixer PCM' on
amixer sset 'Left Output Mixer PCM' on
amixer sset Speaker 127,127
amixer sset Playback 236,236
#alsactl --file ~/.config/asound.state restore
while [ $wwanStatus -eq 0 ]
do
    wwanStatus=$(cat /sys/class/net/wwan0/carrier)
    echo "当前网络状态 $wwanStatus"
    sleep 5
done

echo "网络ok"
while true
do
    if pgrep -x "Eplayer" > /dev/null
    then
        echo "Eplayer running"
    else
        echo "Eplayer Stopped,ready to restart"
        /root/Eplayer --platform linuxfb &
    fi
    sleep 5  
done