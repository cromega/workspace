set nocompatible

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "required
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-rails'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'

call vundle#end() "required
filetype plugin indent on "required

"Vundle end

syntax on
set ts=2
set sw=2
set expandtab
set ai
set nu
"set rnu
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

let mapleader = ","

set background=dark
"colorscheme grb256

set wildmenu
set wildmode=longest:full,full

set viminfo='10,\"100,:20,%,n~/.viminfo

" remember cursos position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

function! ToggleNumbering()
  if(&relativenumber == 1 || &number == 1)
    set nonu
    set nornu
  else
    set nu
    set rnu
  end
endfunc

nnoremap l :call ToggleNumbering()<cr>
nnoremap <c-f> :Ag<cr>
nnoremap <c-m> :NERDTreeToggle<cr>
nnoremap <c-l> :bn<cr>
nnoremap <c-j> :bp<cr>
:nnoremap ≈ :call nerdtree#invokeKeyMap("o")<CR>


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 0
autocmd Filetype gitcommit setlocal spell textwidth=72

let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

map <leader>/ <plug>NERDCommenterToggle
