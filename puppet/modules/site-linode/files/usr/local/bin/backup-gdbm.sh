#!/bin/sh

cd /tmp
git clone git@localhost:gdbm
cd gdbm
/usr/local/bin/fab dumpdb
git add data
git commit -m "`date` dump"
git push

# Build gdbm files out of the data we just dumped;
/usr/local/bin/fab loaddb

# Promote lynne in the dbs we just generated;
tools/promote-lynne.py

# Update database files on linode;
/usr/local/bin/fab deploy_gdbm

cd /tmp
rm -rf gdbm
