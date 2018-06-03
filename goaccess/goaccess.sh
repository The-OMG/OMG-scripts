#!/usr/bin/env bash

# brew install goaccess --with-libmaxminddb

# wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz
# tar x -f GeoLite2-Country.tar.gz

LOGS=(
  "$HOME/logs/access-RcloneHydra.log"
  #"$HOME/logs/error-RcloneHydra.log"
)

OPTIONS=(
  # "--daemonize"
  #"--enable-geoip=mmdb"
  #"--geoip-database $HOME/.config/goaccess/GeoLite2-Country.mmdb"
  "--keep-db-files"
  "--load-from-disk"
  "--with-mouse"
  #  "--enable-geoip=mmdb"
  # "--color-scheme 3"
  # "--log-format=COMBINED"
  # "--output=~/www/cartoons.omg.irish.html"
  # "--port=7890"
  # "--real-time-html"
  # "--real-time-html"
  #"--enable-tcb=memhash"
)

goaccess "${LOGS[@]}" "${OPTIONS[@]}"
