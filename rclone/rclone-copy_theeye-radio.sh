#!/usr/bin/env bash

# Purpose: Use the same settings every time when copying with rclone.

SOURCE="WWWtheeye:Radio"
DEST="omg:OMG_share/mirrors-collections/the-eye/Radio"
URL="https://raw.githubusercontent.com/The-OMG/rclone_tools/master/rclone_copy.sh"

curl -s "$URL" | bash /dev/stdin "$SOURCE" "$DEST"
