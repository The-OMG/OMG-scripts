#!/usr/bin/env bash

################################################################################
#### This .profile makes your login shell "zsh" instead of "bash" or "sh". #####
################################################################################
#							      ___           ___           ___                            #
#							     /  /\         /__/\         /  /\                           #
#							    /  /::\       |  |::\       /  /:/_                          #
#							   /  /:/\:\      |  |:|:\     /  /:/ /\                         #
#							  /  /:/  \:\   __|__|:|\:\   /  /:/_/::\                        #
#							 /__/:/ \__\:\ /__/::::| \:\ /__/:/__\/\:\                       #
#							 \  \:\ /  /:/ \  \:\~~\__\/ \  \:\ /~~/:/                       #
#							  \  \:\  /:/   \  \:\        \  \:\  /:/                        #
#							   \  \:\/:/     \  \:\        \  \:\/:/                         #
#							    \  \::/       \  \:\        \  \::/                          #
#							     \__\/         \__\/         \__\/                           #
#                                                                              #
################################################################################
## Check out everything else: https://github.com/The-OMG/orionsbelt
#
## No root required.
#
## Tested on: https://ultraseedbox.com/
#             https://cloud.google.com/compute/
#             https://www.digitalocean.com/
#
## Tested on: Debian 8,9
#             Ubuntu 16.04 - 18.04
#
# Usage: untar [-v|--verbose] file
#
################################################################################

script=$(basename $0)

opts=$(getopt -n "$script" -o "v" -l "verbose" -- "$@")
if [ ! $? -eq 0 ]; then exit 1; fi # getopt failed
# Overwrite the script's positional parameters with getopt's output:
set -- $opts

verbose=false

while [ $# -gt 0 ]; do
  case "$1" in
    -v) verbose=true ;;
    --verbose) verbose=true ;;
    --)
      shift
      break
      ;;
    *) break ;;
  esac
  shift
done

flags=

if [ true = $verbose ]; then
  flags="-v $flags"
fi

function file_type() {
  if [ ! -e $1 ]; then
    echo "missing"
    return 1
  fi

  case $(file --brief --dereference --mime --uncompress $1) in
    application/x-tar*application/x-gzip*)
      echo "tar.gz"
      ;;
    application/x-tar*application/x-bzip2*)
      echo "tar.bz2"
      ;;
    application/x-tar*)
      echo "tar"
      ;;
    *)
      echo "unknown"
      return 1
      ;;
  esac
}

function handle_file() {
  target=$(eval echo $1) # strip 'quotes' that getopt made

  case $(file_type $target) in
    missing)
      echo "$script: $target: No such file"
      return 1
      ;;
    tar.gz)
      tar $flags -xzf $target
      ;;
    tar.bz2)
      tar $flags -xjf $target
      ;;
    tar)
      tar $flags -xf $target
      ;;
    *)
      clear
      echo "$script: $target: That's not a tarball, silly"
      curl parrot.live
      return 1
      ;;
  esac
}

handle_file $1
