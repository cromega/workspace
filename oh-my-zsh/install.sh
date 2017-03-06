cd $(dirname $0)
. ../lib.sh

if [ ! -d ~/.oh-my-zsh ]; then
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

if [ ! -x /usr/bin/zsh ]; then
  echo "*** WARN: zsh is not installed"
fi

for file in files/*; do
  put "$file" ~/.oh-my-zsh/custom
done
