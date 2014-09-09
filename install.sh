#!/bin/bash

aptitude update && aptitude safe-upgrade -y
aptitude install curl build-essential -y

## ruby
mkdir /tmp/ruby && cd /tmp/ruby
curl -L --progress ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz | tar xz
cd ruby-2.1.2
./configure --disable-install-rdoc
make
sudo make install

## nodejs
mkdir /tmp/nodejs && cd /tmp/nodejs
curl -L --progress http://nodejs.org/dist/v0.10.31/node-v0.10.31.tar.gz | tar xz
cd node-v0.10.31/
./configure
make
make install

## ffmpeg + sqlite
aptitude install ffmpeg sqlite3 libsqlite3-dev -y

## transcodem
mkdir /tmp/transcodem && cd /tmp/transcodem
wget https://codem-downloads.s3.amazonaws.com/codem-scheduler_0.0.0_amd64.deb
wget https://codem-downloads.s3.amazonaws.com/codem-transcoder_0.0.0_amd64.deb

dpkg -i codem-scheduler_0.0.0_amd64.deb
dpkg -i codem-transcoder_0.0.0_amd64.deb
