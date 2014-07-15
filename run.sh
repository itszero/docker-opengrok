#!/bin/sh
service tomcat7 start

# link mounted source directory to opengrok
ln -s /src $OPENGROK_INSTANCE_BASE/src

# first-time index
echo "** Running first-time indexing"
cd /opengrok/bin
./OpenGrok index

# ... and we keep running the indexer to keep the container on
echo "** Waiting for source updates..."
touch $OPENGROK_INSTANCE_BASE/reindex
inotifywait -mr -e CLOSE_WRITE $OPENGROK_INSTANCE_BASE/src | while read f; do
  printf "*** %s\n" "$f"
  echo "*** Updating index"
  ./OpenGrok index
done
