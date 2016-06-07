#!/bin/bash

# cd to our base dir
DIR_NAME=`dirname $0`
TOP_DIR=`cd $DIR_NAME && pwd`
cd $TOP_DIR
echo "Running in $PWD"

# how often should we do this?
git fetch --all
git reset --hard origin/master

echo
echo "Running htcondor-user-stats"
./htcondor-user-stats

