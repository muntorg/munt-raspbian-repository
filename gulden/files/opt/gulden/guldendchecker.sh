#!/bin/sh
# set -x
# Shell script to monitor GuldenD running on the G-DASH node
# If the number of GuldenD processes is <= 0
# it will start GuldenD.
# -------------------------------------------------------------------------
# set alert level 0 is default
ALERT=0
#
#::::::::::::::::::::::::::::
#
usep=$(ps aux | grep GuldenD | wc -l | awk '{print $1-1}')
echo $usep
if [ $usep -le $ALERT ] ; then
/opt/gulden/guldenstart.sh
fi