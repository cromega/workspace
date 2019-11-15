cd $(dirname $0)
. ../lib.sh

github sstephenson/rbenv ~/.rbenv
github sstephenson/ruby-build ~/.rbenv/plugins/ruby-build

put rbenv.zsh ~/.oh-my-zsh/custom/
put gemrc ~/.gemrc
