#!bin/bash

# Try close gracefully
killall -15 GuldenD || true
sleep 10

# Kill if that failed
killall -9 GuldenD || true

# Wipe certain parts of datadir
rm -rf /opt/gulden/datadir/autocheckpoints || true
rm -rf /opt/gulden/datadir/banlist.dat || true

# Restart
/opt/gulden/guldenstart.sh &

