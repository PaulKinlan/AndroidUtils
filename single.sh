#! /bin/sh

# Take input parameters
timeout = 10 # 10 seconds default

`adb shell screenrecord -t $timeout $0`

# copy from SD card
`adb shell cp $from $to`
