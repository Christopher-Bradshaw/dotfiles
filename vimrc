" Todo
" CommandT
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize          
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Used
Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
"Plugin 'vim-scripts/AutomaticLaTexPlugin'
"Plugin 'lervag/vimtex'
Plugin 'groenewege/vim-less'
Plugin 'suan/vim-instant-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'

" Not used
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Gundo'
" Get? 
" ControlP
call vundle#end()

filetype plugin indent on
" would be nice if we could disable this for .md files
syntax on
autocmd BufNewFile,BufReadPost *.md set filetype=markdown syntax=off

let mapleader=','
set noerrorbells
set novisualbell

" Look back at this in a bit
set relativenumber
set number

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

set scrolloff=5
set cmdheight=2

set wildmenu
set incsearch
set hlsearch
highlight Search cterm=NONE ctermfg=Grey ctermbg=Red
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen  
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/  


set foldmethod=syntax
set foldlevelstart=20


" mappings
map Y y$


" get rid annoying .swp files
" these dirs must exist
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" save the pinky
noremap ; :
noremap , ;

" colon commands
ca tn tabnew
" This compiles the latex file
ca t TEX

" Saving is hard
ca 2 w
ca m make

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

" Shortcut sup and spuer script on md
ca ss %s/_{/<sub>/eg \| %s/_}/<\/sub>/eg \| %s/\^{/<sup>/eg \| %s/\^}/<\/sup>/eg

" zeal
:nnoremap gz :!zeal --query "<cword>"&<CR><CR>
