#!/bin/bash

die() {
  echo $1
  exit 1
}

[ "zsh --version" ] || die "zsh not found, go get some"
[ "git" ] || die "git not found, go get some"

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
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

if [ ! rbenv ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.oh-my-zsh/custom/rbenv.zsh
  echo 'eval "$(rbenv init -)"' >> ~/.oh-my-zsh/custom/rbenv.zsh
  echo "got rbenv now!"
fi
