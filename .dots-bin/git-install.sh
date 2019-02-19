#!/usr/bin/env bash

set -e

git help > /dev/null
if [ $? != 0 ]; then
    echo "Install Git first!"
    exit 1
fi;

branch=$1
if [ -z "$branch" ]; then
    branch="master"
fi

if [ $2 = "https"]; then
    source="https://github.com/AuHau/dot_files.git"
else
    source="git@github.com:AuHau/dot_files.git"
fi

git clone -b $branch --bare $source $HOME/.dots
function config {
   /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    mkdir -p .dots-backup
    DOTS_FILES=`config checkout 2>&1 | egrep "\s+\." | awk {'print $1'}`
    echo "$DOTS_FILES" | grep / |  xargs -I{} dirname {} | xargs-I{} mkdir -p .dots-backup/{}
    echo "$DOTS_FILES" | xargs -I{} mv {} .dots-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
