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
  set -e
  mkdir -p ~/.vim/bundle/Vundle.vim
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ln -s ~/.vim/.vimrc ~
  set +e
  echo "vim is sorta fixed. Run BundleInstall"
fi
file .vimrc ~/.vim/

if [ ! -d ~/.oh-my-zsh ]; then
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo "got rbenv now!"
else
  pushd ~/.rbenv
  git fetch && git merge origin/master
  popd
  pushd ~/.rbenv/plugins/ruby-build
  git fetch && git merge origin/master
  popd
fi
file rbenv.zsh ~/.oh-my-zsh/custom/

go_version="1.4.2"
mkdir -p ~/go
if [ ! -d ~/go/$go_version ]; then
  set -e
  wget https://storage.googleapis.com/golang/go${go_version}.linux-amd64.tar.gz -O - | tar -xzf - -C ~/go
  mv ~/go/go ~/go/$go_version
  pushd ~/go/$go_version/src
  ./make.bash
  popd
  [ -L ~/go/current ] && rm ~/go/current
  ln -s ~/go/$go_version ~/go/current
  set +e
fi
file go.zsh ~/.oh-my-zsh/custom/

file crap.zsh ~/.oh-my-zsh/custom/

file .tmux.conf ~
file .gitconfig ~
