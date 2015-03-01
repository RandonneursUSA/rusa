#!/bin/sh

cd /tmp
git clone git@localhost:gdbm
cd gdbm
/usr/local/bin/fab dumpdb
git add data
git commit -m "`date` dump"
git push

cd /tmp
rm -rf gdbm
