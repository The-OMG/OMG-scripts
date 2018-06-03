#!/usr/bin/env bash

# Purpose: Use the same settings every time when copying with rclone.

curl -s https://raw.githubusercontent.com/The-OMG/rclone_tools/master/rclone_copy.sh | bash /dev/stdin "edu:OMG_share/Books" "edu:OMG_share/_TD/Books"
