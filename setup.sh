#!/bin/bash

die() {
  echo $1
  exit 1
}

file() {
  file="$1"
  path="$2"

  if [ ! -f "$path/$file" ]; then
    mkdir -p "$path"
    cp "files/$file" "$path"
    echo "created $path/$file"
  else
    current_hash=$(sha1sum "$path/$file" | awk '{print $1}')
    new_hash=$(sha1sum "files/$file" | awk '{print $1}')
    if [ $current_hash != $new_hash ]; then
      cp "files/$file" "$path"
      echo "updated $path/$file"
    fi
  fi
}

check_command() {
  command -v "$1" 2>&1 > /dev/null || die "$1 not found"
}

check_command git
check_command zsh

if [ ! -d ~/.vim ]; then
  mkdir -p ~/.vim/bundle/Vundle.vim
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  file .vimrc ~/.vim/
  ln -s ~/.vim/.vimrc ~
  echo "vim is sorta fixed. Run BundleInstall"
fi

if [ ! -d ~/.oh-my-zsh ]; then
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  file rbenv.zsh ~/.oh-my-zsh/custom/
  echo "got rbenv now!"
fi

file .tmux.conf ~
file .gitconfig ~

