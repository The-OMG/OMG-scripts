#!/usr/bin/env bash

################################################################################
################ Unzip all files ending in .zip in a directory #################
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
################################################################################

echo "Unzipping all zip files in current directory."
sleep 3

xargARGS=(
  "-0"
  "-P 5"
  "-I fileName"
)

findARGS=(
  "-name "*.zip""
  "-print0"
)

find . "${findARGS[@]}" | xargs "${xargARGS[@]}" sh -c 'unzip -o -d \
  "$(dirname "fileName")/$(basename -s .zip "fileName")" "fileName"'
