#!/bin/sh
/etc/init.d/tomcat6 start

# link mounted source directory to opengrok
ln -s /src /grok/src

# first-time index
echo "** Running first-time indexing"
cd /opengrok/bin
./OpenGrok index

# ... and we keep running the indexer to keep the container on
echo "** Waiting for source updates..."
touch $OPENGROK_INSTANCE_BASE/reindex
inotifywait -m -e CLOSE_WRITE $OPENGROK_INSTANCE_BASE/reindex | while read f; do
  echo "*** Updating index"
  ./OpenGrok index
done
