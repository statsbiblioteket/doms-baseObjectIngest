#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "UPDATING Radio TV doms objects"

# No new objects since last release. If there are, add the new objects like this:
# batchProcess $BASEDIR/scripts/RadioTVDatamodel/ContentModel_Program/create.xml
# batchProcess $BASEDIR/scripts/RadioTVDatamodel/ContentModel_Program/setContent.xml
# batchProcess $BASEDIR/scripts/RadioTVDatamodel/ContentModel_Program/publish.xml

# No changed objects since last release. If there are, add the changed objects like this:
# batchProcess $BASEDIR/scripts/RadioTVDatamodel/ContentModel_Program/setContent.xml
# batchProcess $BASEDIR/scripts/RadioTVDatamodel/ContentModel_Program/publish.xml

echo "There should be no errors in this result. If there are, something has failed."
echo ""
echo ""


