#!/bin/bash

#prevent script re-entrancy
ps | grep $0 | grep -v grep > /var/tmp/$0.pid
pids=$(cat /var/tmp/$0.pid | cut -d ' ' -f 1)
for pid in $pids
do
   if [ $pid -ne $$ ]; then
      logprint " $0 is already running. Exiting"
      exit 7
   fi
done
rm -f /var/tmp/$0.pid

echo "Stopping GuldenD service"
/opt/gulden/gulden/Gulden-cli -datadir=/opt/gulden/datadir stop

echo "Fetching update headers"
sudo apt-get update

echo "Killing GuldenD if still running"
killall -9 GuldenD

echo "Checking for Gulden update"
sudo apt-get -y --allow-unauthenticated install gulden

echo "Removing peers.dat"
rm /opt/gulden/datadir/peers.dat
sleep 5

#Grab a bootstrap if we are a fresh sync
if [ ! -d "/opt/gulden/datadir/blocks" ]
then
    echo "fetching bootstrap.dat"

    curl -s https://api.github.com/repos/gulden/gulden-official/releases/latest \
    | grep "bootstrap.dat.xz" \
    | cut -d '"' -f 4 \
    | xargs wget -ci {} -P /opt/gulden/datadir/

    echo "decompress bootstrap.dat"
    xz -dT0 /opt/gulden/datadir/bootstrap.dat.xz
else
    #Clean up any leftover bootstrap
    if [ -f /opt/gulden/datadir/bootstrap.dat.old ]
    then
        rm /opt/gulden/datadir/bootstrap.dat.old
    fi
fi

#Enable small potential memory usage reduction
export MALLOC_ARENA_MAX=1

echo "Starting GuldenD"
/opt/gulden/gulden/GuldenD -datadir=/opt/gulden/datadir &

