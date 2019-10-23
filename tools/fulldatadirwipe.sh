#!/bin/bash

# Kill the app
killall -9 GuldenD

# Wipe all important parts of datadir that can be refenerated (exclude wallet/logs etc.)
rm -rf /opt/gulden/datadir/autocheckpoints || true
rm -rf /opt/gulden/datadir/banlist.dat || true
rm -rf /opt/gulden/datadir/peers.dat || true
rm -rf /opt/Gulden/datadir/blocks || true
rm -rf /opt/Gulden/datadir/chainstate || true
rm -rf /opt/Gulden/datadir/witstate || true

#restart
/opt/gulden/guldenstart.sh &

