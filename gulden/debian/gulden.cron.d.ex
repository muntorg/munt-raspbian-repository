#
# Regular cron jobs for the gulden package
#
0 4	* * *	root	[ -x /usr/bin/gulden_maintenance ] && /usr/bin/gulden_maintenance
