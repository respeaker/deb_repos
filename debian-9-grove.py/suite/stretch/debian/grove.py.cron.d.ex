#
# Regular cron jobs for the grove-py package
#
0 4	* * *	root	[ -x /usr/bin/grove-py_maintenance ] && /usr/bin/grove-py_maintenance
