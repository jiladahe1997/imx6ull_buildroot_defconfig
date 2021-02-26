#!/bin/sh

# 监控Eplayer进程

echo "Eplayer 守护器开始"
echo "等待网络ok"

#wwanStatus=0;
export TSLIB_TSDEVICE=/dev/input/event1
export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/event1
export QT_QPA_FB_TSLIB=1

#alsactl --file ~/.config/asound.state restore
#while [ $wwanStatus -eq 0 ]
#do
    #wwanStatus=$(cat /sys/class/net/wwan0/carrier)
    #echo "当前网络状态 $wwanStatus"
    #sleep 5
#done

echo "网络ok"

amixerStatus=""
sleep 5s

#while [ "$amixerStatus" = "" ]
#do
#	echo "amixer sset Headphone 101,101"
#	amixerStatus=$(amixer sset Headphone 101,101)
#	echo "amixerStatus: $amixerStatus"
#	sleep 2s
#done
#amixerStatus=""

while [ "$amixerStatus" = "" ]
do
	echo "amixer sset Speaker 116,116"
	amixerStatus=$(amixer sset Speaker 116,116)
	echo "amixerStatus: $amixerStatus"
	sleep 2s
done
amixerStatus=""

while [ "$amixerStatus" = "" ]
do
	echo "amixer sset Playback 250,250"
	amixerStatus=$(amixer sset Playback 250,250)
	echo "amixerStatus: $amixerStatus"
	sleep 2s
done
amixerStatus=""

while [ "$amixerStatus" = "" ]
do
	echo "amixer sset 'Right Output Mixer PCM' on"
	amixerStatus=$(amixer sset 'Right Output Mixer PCM' on)
	echo "amixerStatus: $amixerStatus"
	sleep 2s
done
amixerStatus=""

while [ "$amixerStatus" = "" ]
do
	echo "amixer sset 'Left Output Mixer PCM' on"
	amixerStatus=$(amixer sset 'Left Output Mixer PCM' on)
	echo "amixerStatus: $amixerStatus"
	sleep 2s
done
amixerStatus=""

echo "音频ok"
while true
do
    if pgrep -x "Eplayer" > /dev/null
    then
        #echo "Eplayer running"
		:
    else
        echo "Eplayer Stopped,ready to restart"
        /root/Eplayer --platform linuxfb &
    fi
    sleep 5  
done