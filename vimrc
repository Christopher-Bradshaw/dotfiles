set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kchmck/vim-coffee-script'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

set nu
set autoindent
set noerrorbells
set novisualbell
set expandtab
set tabstop=4
set shiftwidth=4

set scrolloff=5
set cmdheight=2

set wildmenu
set incsearch

set hlsearch
highlight Search cterm=NONE ctermfg=Grey ctermbg=Red
syntax on


set foldmethod=indent
set foldlevelstart=20


" mappings
map Y y$


" annoying .swp files
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" save the pinky
noremap ; :
noremap , ;

" colon commands
ca tn tabnew

" more between splits
" remember that it is :vsp filename to open a file in a v split
"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
