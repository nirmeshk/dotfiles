" enbale syntax highlighting
filetype plugin indent on

syntax enable
colorscheme molokai
set background=dark

" set encoding to utf-8
set enc=utf-8

" set line number
set number

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
call plug#end()
map <C-n> :NerdTreeToggle<CR>
