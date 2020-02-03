" Encoding
set encoding=utf-8

"" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" Begin
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()
" End

filetype plugin indent on
""

" Syntax highlighting
syntax enable

" Line number
set number

" Remap Esc
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Better cursor movement
nnoremap <silent> k gk
nnoremap <silent> j gj

" Tabs (PEP 8)
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=4

" Auto identation
set autoindent

" Folding
set foldmethod=indent
set foldlevel=99


"" Run files

" Python
autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%')<CR>

" Rust
autocmd filetype rust nnoremap <F4> :w <bar> exec '!cargo run'<CR>
 
