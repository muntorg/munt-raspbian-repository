#!/bin/bash

# Kill the app
killall -9 GuldenD || true

# Wipe all important parts of datadir that can be refenerated (exclude wallet/logs etc.)
rm -rf /opt/gulden/datadir/autocheckpoints || true
rm -rf /opt/gulden/datadir/banlist.dat || true
rm -rf /opt/gulden/datadir/peers.dat || true
rm -rf /opt/gulden/datadir/db.log || true
rm -rf /opt/gulden/datadir/mempool.dat || true
rm -rf /opt/gulden/datadir/blocks || true
rm -rf /opt/gulden/datadir/database || true
rm -rf /opt/gulden/datadir/chainstate || true
rm -rf /opt/gulden/datadir/witstate || true

#restart
/opt/gulden/guldenstart.sh &

