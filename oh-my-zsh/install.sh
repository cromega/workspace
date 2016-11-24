cd $(dirname $0)
. ../lib.sh

if [ ! -d ~/.oh-my-zsh ]; then
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

put crap.zsh ~/.oh-my-zsh/custom/
put docker.zsh ~/.oh-my-zsh/custom/
put pivotal.zsh ~/.oh-my-zsh/custom/
