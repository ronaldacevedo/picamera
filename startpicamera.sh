#!/bin/bash
# stream from raspicam using Gstreamer and HLS

# find our location
selfpath=$(dirname $(readlink -f $0))

# 1. raspicam to udp stream
$selfpath/01-picamera.raspivid2udp.sh &
echo $! > $selfpath/01-picamera.raspivid2udp.pid

# 2. udp stream to hls
$selfpath/02-picamera.udp2hls.sh &
echo $! > $selfpath/02-picamera.udp2hls.pid

# 3. start web server
cd $selfpath
python -m SimpleHTTPServer 8080
