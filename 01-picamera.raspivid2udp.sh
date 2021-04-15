#!/bin/bash

raspivid -n -vf -fl -t 0 -w 1280 -h 960 -b 1200000 -fps 20 -pf baseline -o - | gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay pt=96 config-interval=10 ! udpsink host=192.168.1.6 port=5000
