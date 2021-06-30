cd $(dirname $0)
. ../lib.sh

N_VERSION=7.3.0

curl https://raw.githubusercontent.com/tj/n/v$N_VERSION/bin/n > ~/bin/n
chmod +x ~/bin/n

put n.zsh ~/.oh-my-zsh/custom/


