set nocompatible

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "required
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-rails'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
Plugin 'hashivim/vim-terraform'
Plugin 'martin-svk/vim-yaml'

call vundle#end() "required
filetype plugin indent on "required

"Vundle end

syntax on
set ts=2
set sw=2
set expandtab
set ai
set nu
set ruler
set lbr
set hidden
set hlsearch
set incsearch
set ignorecase
set pastetoggle=<F2>
set backspace=2
set laststatus=2
set noswapfile
set colorcolumn=100

let mapleader = ","

set background=dark
colorscheme onedark

set wildmenu
set wildmode=longest:full,full

set viminfo='10,\"100,:20,%,n~/.viminfo

"remember cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

"augroup resCur
  "autocmd!
  "autocmd BufWinEnter * call ResCur()
"augroup END

nnoremap <c-l> :set nu!<cr>
nnoremap <c-f> :Ag<cr>
nnoremap <c-\> :NERDTreeToggle<cr>
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>
nnoremap <c-y> :%w !xclip -selection clipboard<cr><cr>
vnoremap <c-y> :'<,'>w !xclip -selection clipboard<cr><cr>
map <c-_> <plug>NERDCommenterToggle


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 0
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType yaml setl indentkeys-=<:>

au BufRead,BufNewFile Vagrantfile set filetype=ruby

let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

let NERDTreeShowHidden=1

"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'go', 'c', 'css']

"mark before removing trailing whitespace on save to prevent jumping in file
command! -range=% TR mark `|execute <line1> . ',' . <line2> . 's/\s\+$//'|normal! ``
autocmd BufWritePre * :mark `|%s/\s\+$//e|normal! ``

let g:ackprg = 'ag --vimgrep'
