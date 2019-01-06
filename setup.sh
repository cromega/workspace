#!/bin/bash -e
. lib.sh

[ ! -z $DEBUG ] && set -x

if ! check_command "git"; then
  echo "Need to install git"
  sudo apt-get -y install git
fi

default="oh-my-zsh
git-config
go
rbenv
tmux-config
vim
shell_colours
htop"

install_module() {
  module=$1
  echo "=== installing $module..."
  bash -e $module/install.sh
  echo "=== done."
  echo -e "\n"
}


if [ $# -eq 0 ]; then
  for module in $default; do
    install_module "$module"
  done
else
  for module in $@; do
    install_module "$module"
  done
fi




