#!/bin/bash -e
. lib.sh

[ ! -z $DEBUG ] && set -x

default="oh-my-zsh
git-config
go
rbenv
tmux-config
vim
shell_colours
htop"

if [ $# -eq 0 ]; then
  for module in $default; do
    echo "installing $module..."
    bash $module/install.sh
  done
else
  for module in $@; do
    echo "installing $module..."
    bash $module/install.sh
  done
fi




