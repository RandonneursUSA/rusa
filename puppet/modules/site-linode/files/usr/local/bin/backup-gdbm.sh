#!/bin/sh

cd /tmp
git clone git@localhost:gdbm
cd gdbm
fab dumpdb
git add data
git commit -m "`date` dump"
git push

cd /tmp
rm -rf gdbm
