#!/bin/sh

#This is a horribly dumb little script which will walk a dir tree and commit any changes back to github.
#It makes all sorts of assumptions

DIRLIST=`find ~ ! \( -regex '.*Dropbox.*' -o -regex '.*Library.*' -o -regex '.*Trash.*' \) -a -name '.git' | sed s/\.git//`
STARTDIR=$PWD

for i in "${DIRLIST[@]}"
do
  echo "$i"
 
  cd $i
  pwd

  git pull
  git status
  git add -A
  git status
  git commit -m "autocommit"
  git push

  cd $STARTDIR
  pwd
done
