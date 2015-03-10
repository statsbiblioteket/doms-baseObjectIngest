#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "Creating base Radio TV objects"

for file in $(ls $BASEDIR/scripts/RadioTVDatamodel/*/create.xml); do
    batchProcess $file
done

for file in $(ls $BASEDIR/scripts/RadioTVDatamodel/*/setContent.xml); do
    batchProcess $file
done

for file in $(ls $BASEDIR/scripts/RadioTVDatamodel/*/publish.xml); do
    batchProcess $file
done

echo "There should be no undeclared errors in this result. If there are, something has failed."
echo ""
echo ""


