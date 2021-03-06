#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Data model updates in 1.15
#
echo "Migrating to version 1.15"

for file in $(ls $BASEDIR/scripts/migrate/1.15/*/*/*.xml); do
    batchProcess $file
done

echo "There should be no undeclared errors in this result. If there are, something has failed."
echo ""
echo ""
