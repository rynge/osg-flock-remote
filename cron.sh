#!/bin/bash

# cd to our base dir
DIR_NAME=`dirname $0`
TOP_DIR=`cd $DIR_NAME && pwd`
cd $TOP_DIR
echo "Running in $PWD"

# only update from git every so often
find . -max-level 1 -name .git-update.ts -mmin +720 -exec rm -f {} \;
if [ ! -e .gratia.ts ]; then
    git fetch --all
    git reset --hard origin/master
    touch .git-update.ts
fi

# lock
find . -max-level 1 -name .cron.lock -mmin +60 -exec rm -f {} \;
if [ -e .cron.lock ]; then
    exit 0
fi
touch .cron.lock

echo
echo "Running htcondor-user-stats"
./htcondor-user-stats

rm -f .cron.lock

