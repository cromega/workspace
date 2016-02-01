#!/bin/bash

[ ! -z $DEBUG ] && set -x

die() {
  echo $1
  exit 1
}

file() {
  file="$1"
  path="$2"

  mkdir -p "$path"
  cp "files/$file" "$path"
  echo "$path/$file written."
}

git_clone() {
  mkdir -p "$2"
  git clone "$1" "$2"
}

git_pull() {
  pushd "$1"
  git fetch && git merge origin/master
  popd
}

github() {
  repo="$1"
  path="$2"

  url="https://github.com/${repo}.git"
  if [ -d "$path" ]; then
    git_pull "$path"
  else
    git_clone "$url" "$path"
  fi
}

check_command() {
  command -v "$1" 2>&1 > /dev/null || die "$1 not found"
}

check_command git
check_command zsh

github gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
file .vimrc ~/.vim/
ln -s ~/.vim/.vimrc ~
file onedark.vim ~/.vim/colors/

if [ ! -d ~/.oh-my-zsh ]; then
  wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

github sstephenson/rbenv ~/.rbenv
github sstephenson/ruby-build ~/.rbenv/plugins/ruby-build
file rbenv.zsh ~/.oh-my-zsh/custom/

go_version="1.5.1"
mkdir -p ~/go
if [ ! -d ~/go/$go_version ]; then
  set -e
  wget https://storage.googleapis.com/golang/go${go_version}.linux-amd64.tar.gz -O - | tar -xzf - -C ~/go
  mv ~/go/go ~/go/$go_version
  [ -L ~/go/current ] && rm ~/go/current
  ln -s ~/go/$go_version ~/go/current
  set +e
fi
file go.zsh ~/.oh-my-zsh/custom/

file crap.zsh ~/.oh-my-zsh/custom/
file .tmux.conf ~
file .gitconfig ~
