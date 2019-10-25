#!/bin/bash

#bootstrap
echo "fetching bootstrap"
curl -s https://api.github.com/repos/gulden/gulden-official/releases/latest | grep "bootstrap.dat.xz" | cut -d '"' -f 4 | xargs wget -ci {} -P /opt/gulden/datadir/

echo "decompress bootstrap.dat"
xz -dT0 /opt/gulden/datadir/bootstrap.dat.xz

# Kill the app
echo "Closing GuldenD"
killall -9 GuldenD || true

# Wipe all important parts of datadir that can be refenerated (exclude wallet/logs etc.)
echo "Wipe datadir"
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

