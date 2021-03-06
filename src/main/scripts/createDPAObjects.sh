#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "Creating DPA doms objects"

DIR="$BASEDIR/scripts/DPADatamodel/"

for file in $(ls $DIR/*/create.xml); do
    batchProcess $file
done

for file in $(ls $DIR/*/setContent.xml); do
    batchProcess $file
done

for file in $(ls $DIR/*/publish.xml); do
    batchProcess $file
done

echo "There should be no errors in this result. If there are, something has failed."
echo ""
echo ""



