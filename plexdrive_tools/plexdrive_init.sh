#!/usr/bin/env bash

PACKAGEPATH="/opt/plexdrive"
PLEXDRIVE="$PACKAGEPATH/plexdrive"
MOUNTPATH="/mnt/plexdrive"

function _init() {
  local plexdriveARGS=(
    "-v 3"
    "--refresh-interval=1m"
    "--chunk-check-threads=8"
    "--chunk-load-threads=8"
    "--chunk-load-ahead=4"
    "--max-chunks=100"
    "--fuse-options=allow_other,read_only"
    "--config=/opt/plexdrive"
    "--cache-file=/opt/plexdrive/cache.bolt"
  )
  "$PLEXDRIVE" mount "${plexdriveARGS[@]}" "$MOUNTPATH"
}

function _packagepath() {
  mkdir -p $PACKAGEPATH
}

function _mountpath() {
  mkdir -p $MOUNTPATH
}

function _dlplexdrive() {
  local RELEASE="https://github.com/dweidenfeld/plexdrive/releases/download/5.0.0/plexdrive-linux-amd64"
  wget $RELEASE
  rf -f $PLEXDRIVE
  mv ./plexdrive-linux* $PLEXDRIVE
  echo "Plexdrive installed to $PLEXDRIVE"
}

function _installbundle() {
  _packagepath
  _mountpath
  _dlplexdrive
}

function _installservice() {
  sudo systemctl daemon-reload
  sudo systemctl enable plexdrive.service
  sudo systemctl start plexdrive.service
}

# _installbundle

_init
