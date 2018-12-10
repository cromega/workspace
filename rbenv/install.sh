cd $(dirname $0)
. ../lib.sh

github sstephenson/rbenv ~/.rbenv
github sstephenson/ruby-build ~/.rbenv/plugins/ruby-build

put rbenv.zsh ~/.oh-my-zsh/custom/
put .gemrc ~

if check_command "apt-get"; then
  sudo apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
fi
