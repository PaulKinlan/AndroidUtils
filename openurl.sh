#! /bin/sh

# Take input parameters
timeout=10 # 10 seconds default
url=$1

[ -d output ] || mkdir ./output
 
adb kill-server
adb start-server
for i in `adb devices|egrep -o [a-f0-9]{16}`; do
  echo "Connecting to $i"
  if [ $# -gt  0 ]
  then
    adb -s $i shell am start -a android.intent.action.VIEW -d $url
    adb -s $i shell screenrecord --time-limit $timeout $timeout /sdcard/output$i.mp4
    
    # copy from SD card
    adb -s $i pull /sdcard/output$i.mp4 ./output/output$i.mp4 
  fi
done
