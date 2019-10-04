cd $(dirname $0)
. ../lib.sh

github gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

put vimrc ~/.vim
symlink ~/.vim/vimrc ~/.vimrc

put onedark.vim ~/.vim/colors/
vim +VundleUpdate +qall
