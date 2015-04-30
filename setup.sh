#!/bin/bash

die() {
  echo $1
  exit 1
}

command -v zsh || die "zsh not found, go get some"
command -v git || die "git not found, go get some"

if [ ! -d ~/.vim ]; then
  mkdir -p ~/.vim/bundle/Vundle.vim
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  cp .vimrc ~/.vim
  ln -s ~/.vim/.vimrc ~
  echo "vim is sorta fixed. Run BundleInstall"
fi

for file in .tmux.conf .gitconfig; do
  if [ ! -f ~/$file ]; then
    cp -v $file ~
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
