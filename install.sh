#!/bin/sh
mkdir $OPENGROK_INSTANCE_BASE
mkdir $OPENGROK_INSTANCE_BASE/data
mkdir $OPENGROK_INSTANCE_BASE/etc

wget https://github.com/OpenGrok/OpenGrok/files/467358/opengrok-0.12.1.6.tar.gz.zip
unzip -p opengrok-0.12.1.6.tar.gz.zip | tar zxvf -
rm opengrok-0.12.1.6.tar.gz.zip
mv opengrok-* opengrok
cd /opengrok/bin
./OpenGrok deploy
