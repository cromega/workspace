#!/bin/bash -e
. lib.sh

[ ! -z $DEBUG ] && set -x

if ! check_command "git"; then
  echo "Need to install git"
  sudo apt-get -y install git
fi

install_module() {
  module=$1
  echo "=== installing $module..."
  bash -e $module/install.sh
  echo "=== done."
  echo -e "\n"
}

prepare_environment

for module in $@; do
  install_module "$module"
done
