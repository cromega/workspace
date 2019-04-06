cd $(dirname $0)
. ../lib.sh

DEPENDENCIES="autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev"

github sstephenson/rbenv ~/.rbenv
github sstephenson/ruby-build ~/.rbenv/plugins/ruby-build

put rbenv.zsh ~/.oh-my-zsh/custom/
put .gemrc ~

if check_command "apt-get"; then
  if ! dpkg -l $DEPENDENCIES > /dev/null; then
    sudo apt-get -y install $DEPENDENCIES
  fi
fi
