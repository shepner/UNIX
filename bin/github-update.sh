#!/bin/sh

GITHUBARCHIVE="/tmp/master.zip"

#fetch the latest files from gethub
curl -L https://github.com/shepner/UNIX/archive/master.zip > $GITHUBARCHIVE


#extract stuff

unzip -jo $GITHUBARCHIVE Docker-master/UNIX/.* -d ~/
chmod -R 750 .vim
chmod 700 .vimrc
chmod 640 .profile
chmod 600 .inputrc

unzip -jo $GITHUBARCHIVE Docker-master/UNIX/bin/* -d ~/bin
chmod -R 750 ~/bin

unzip -jo $GITHUBARCHIVE Docker-master/UNIX/etc/* -d ~/etc
chmod 750 ~/etc
chmod 640 ~/etc/*

case `uname` in
  Darwin)
    echo OSX
    ;;
  FreeBSD)
    echo FreeBSD
    ;;
  Linux)
    echo Linux
    ;;
  *)
    echo unknown OS
    ;;
esac
