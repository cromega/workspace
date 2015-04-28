#!/bin/bash -e

stupid_error() {
    echo ********************** $1 **************************
}

die_if_no_git() {
  if [ ! git ]; then
    stupid_error "OMG NO GIT"
    exit 1
  fi
}

[ ! -L ~/.vimrc ] && ln -s .vim/.vimrc ~/.vimrc

for file in .tmux.conf .gitconfig; do [ ! -f $file ] && cp $file ~; done

[ ! zsh ] && echo ********************** INSTALL ZSH! *************************
if [ ! -d ~/.oh-my-zsh ]; then
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
  echo 'got zsh now!'
fi

if [ ! rbenv ]; then
  die_if_no_git
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.oh-my-zsh/custom/rbenv.zsh
  echo 'eval "$(rbenv init -)"' >> ~/.oh-my-zsh/custom/rbenv.zsh
  echo "got rbenv now!"
fi
