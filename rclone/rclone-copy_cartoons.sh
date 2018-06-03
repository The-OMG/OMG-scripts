#!/usr/bin/env bash

# Purpose: Use the same settings every time when copying with rclone.

SOURCE="orionsbeltnas-TDcartoons-matt07211:"
DEST="orionsbeltnas-TDtv:_Incoming_TV.Kids"
URL="https://raw.githubusercontent.com/The-OMG/rclone_tools/master/rclone_copy.sh"

curl -s "$URL" | bash /dev/stdin "$SOURCE" "$DEST"
