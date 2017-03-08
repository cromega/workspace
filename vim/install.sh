cd $(dirname $0)
. ../lib.sh

github gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

put .vimrc ~/.vim
[ ! -L ~/.vimrc ] && ln -s ~/.vim/.vimrc ~

put onedark.vim ~/.vim/colors
