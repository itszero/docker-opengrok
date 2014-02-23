#!/bin/sh
mkdir $OPENGROK_INSTANCE_BASE
mkdir $OPENGROK_INSTANCE_BASE/data
mkdir $OPENGROK_INSTANCE_BASE/etc

wget -O - http://java.net/projects/opengrok/downloads/download/opengrok-0.11.1.tar.gz | tar zxvf -
mv opengrok-* opengrok
cd /opengrok/bin
./OpenGrok deploy
