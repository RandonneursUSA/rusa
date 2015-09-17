#!/bin/sh

set -x
WORKDIR="/tmp/backup-gdbm.$$"

mkdir $WORKDIR
cd $WORKDIR
git clone git@localhost:gdbm
cd gdbm
TMPDIR=$WORKDIR /usr/local/bin/fab dumpdb
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
rm -rf $WORKDIR
