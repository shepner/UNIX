#!/bin/sh

GITHUBARCHIVE="/tmp/master.zip"

#fetch the latest files from gethub
curl -L https://github.com/shepner/Docker/archive/master.zip > $GITHUBARCHIVE

unzip -jo $GITHUBARCHIVE Docker-master/UNIX/bin/* -d ~/bin
chmod -R 750 ~/bin

unzip -jo $GITHUBARCHIVE Docker-master/UNIX/etc/* -d ~/etc
chmod 750 ~/etc
chmod 640 ~/etc/*

