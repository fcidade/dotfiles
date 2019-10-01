syntax on
set nu
filetype plugin on
set mouse=a
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed
set nu
set wrap
set linebreak
noremap <c-z> <nop>

" Aside directory tree 
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 13
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Relative numbers
" set relativenumber

" Highlight search
set hlsearch
set incsearch

" Up and down a display line, not a file line
nnoremap j gj
nnoremap k gk

" Go the the start or end of a line
nnoremap B ^
nnoremap E $

" Map esc to jk and disable <esc>
inoremap jk <esc> 
inoremap <esc> <nop>
set t_RV=

set shiftround

" Autocompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Plugins

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', {'as': 'dracula'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ludovicchabant/vim-gutentags'
Plug 'chrisbra/Colorizer'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
" Eslint
Plug 'w0rp/ale'

call plug#end()

" Theme
colorscheme dracula

" Eslint
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '🤬'
let g:ale_sign_warning = '🤔'  

let g:ale_fix_on_save = 1 

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

set wildignore=*.o,*.obj,*~                                                    
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Build
" Lua
autocmd filetype lua nnoremap <F4> :w <bar> exec '!lua  '.shellescape('%')<CR>
autocmd filetype lua nnoremap <F5> :w <bar> exec '!love . '<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec 'python3 '.shellescape('%')<CR>
