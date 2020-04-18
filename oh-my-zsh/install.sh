cd $(dirname $0)
. ../lib.sh

if [ ! -d ~/.oh-my-zsh ]; then
  umask g-w,o-w
  github robbyrussell/oh-my-zsh ~/.oh-my-zsh
fi

github zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/
github zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/

if [ ! -x /usr/bin/zsh ]; then
  if check_command "apt-get"; then
    sudo apt-get -y install zsh
  else
    echo "*** WARN: zsh is not installed"
  fi
fi

for file in custom/*; do
  put "$file" ~/.oh-my-zsh/custom
done

put themes/cromega.zsh-theme ~/.oh-my-zsh/themes
put zshrc ~/.zshrc

