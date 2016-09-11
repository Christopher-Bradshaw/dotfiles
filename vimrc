set nocompatible
set shell=/bin/bash
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'suan/vim-instant-markdown'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/command-t'
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'

" Language specific
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'solarnz/thrift.vim'
call vundle#end()

filetype plugin indent on
syntax on
autocmd BufNewFile,BufReadPost *.md set filetype=markdown syntax=off

let mapleader=','

" Don't annoy me
set noerrorbells
set novisualbell

" numbering
set relativenumber
set number

" tabs vs spaces
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" give me more space in commands and while scrolling
set scrolloff=5
set cmdheight=2

" lets you do tab completion in command bar
set wildmenu

" Searching and highlighting
set hlsearch
set incsearch
highlight Search cterm=NONE ctermfg=Grey ctermbg=Red
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
nnoremap <expr> N (v:searchforward ? 'N' : 'n')
nnoremap <expr> n (v:searchforward ? 'n' : 'N')

" match whitespace and redraw when leaving/entering insert mode
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/

" xxx learn how to do this
set foldmethod=indent
set foldlevelstart=20

" mappings
map Y y$

" get rid annoying .swp files
" these dirs must exist
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" don't hit shift all the time
noremap ; :

" colon commands
ca tn tabnew
ca W w

" spellcheck
ca spell setlocal spell spelllang=en_us
ca nospell set nospell
highlight clear SpellBad
highlight SpellBad ctermbg=Green

" Create splits
nnoremap <C-W><C-H> sp

" move between splits
" remember that it is :vsp filename to open a file in a v split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Force me to use hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" Move 10 easily
noremap <leader>j J
noremap J 10j
" https://github.com/fatih/vim-go/issues/140
noremap K 10k

" backspace refuses to kill linebreaks and things not inserted during this insert?
set backspace=indent,eol,start
