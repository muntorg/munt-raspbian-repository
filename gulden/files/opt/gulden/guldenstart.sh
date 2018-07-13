#!/bin/bash
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

echo "Starting GuldenD"
/opt/gulden/gulden/GuldenD -datadir=/opt/gulden/datadir &
