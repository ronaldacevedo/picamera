#!/bin/bash

gst-launch-1.0 udpsrc port=5000 ! application/x-rtp,payload=96 ! rtph264depay ! mpegtsmux ! hlssink max-files=5 target-duration=5 location=segment%05d.ts playlist-location=playlist.m3u8
