#!/bin/bash

sleep 3
fs-uae -conf $HOME/FS-UAE/Configurations/A500.fs-uae --fullscreen --texture_filter=nearest --video_sync=1

#it is importand due to a bug in KMS/DRM
clear
