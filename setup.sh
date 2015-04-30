#!/bin/bash

stupid_message() {
    echo ********************** $1 **************************
}

die_if_no_git() {
  if [ ! git ]; then
    stupid_message "THIS SYSTEM'S LACK OF GIT IS DISTURBING"
    exit 1
  fi
}

[ ! vim ] && stupid_message "VIM IS NOT INSTALLED, WHAT THE ACTUAL FUCK"
if [ ! -L ~/.vimrc -a ! -f ~/.vimrc -a ! -d ~/.vim ]; then
  echo "vim stuff is sub-par, fixing..."
  cp -r .vim ~ && ln -s ~/.vim/.vimrc ~/.vimrc
  echo "vim is sorta fixed"
fi

for file in .tmux.conf .gitconfig; do
  if [ ! -f $file ]; then
    cp $file ~
    echo "placed $file where it belongs"
  fi
done

if [ ! -d ~/.oh-my-zsh ]; then
  die_if_no_git
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

  if [ ! zsh --version ]; then
    stupid_message "ZSH EATS BASH FOR BREAKFAST, GO GET SOME"
  else
    chsh -s /usr/bin/zsh
  fi
fi

if [ ! rbenv ]; then
  die_if_no_git
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.oh-my-zsh/custom/rbenv.zsh
  echo 'eval "$(rbenv init -)"' >> ~/.oh-my-zsh/custom/rbenv.zsh
  echo "got rbenv now!"
fi
