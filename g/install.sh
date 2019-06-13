cd $(dirname $0)
. ../lib.sh

G_VERSION=0.4.0

curl https://raw.githubusercontent.com/stefanmaric/g/$G_VERSION/bin/g >~/bin/g
chmod +x ~/bin/g

put g.zsh ~/.oh-my-zsh/custom/


