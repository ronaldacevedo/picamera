#!/bin/bash
# kill running server

# find script location
selfpath=$(dirname $(readlink -f $0))

# 1. raspicam to udp stream
pidfile="$selfpath/01-picamera.raspivid2udp.pid"
if [ -e $pidfile ]; then
	kill -9 $(cat $pidfile) $(( 1 + $(cat $pidfile) ))
	rm $pidfile
fi

# 2. udp stream to hls
pidfile="$selfpath/02-picamera.udp2hls.pid"
if [ -e $pidfile ]; then
	kill -9 $(cat $pidfile) $(( 1 + $(cat $pidfile) ))
	rm $pidfile
fi

