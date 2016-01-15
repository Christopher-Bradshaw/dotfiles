" Todo
" CommandT
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize          
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Used
Plugin 'gmarik/Vundle.vim'
" Language specific
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
"Plugin 'vim-scripts/AutomaticLaTexPlugin'
"Plugin 'lervag/vimtex'
Plugin 'suan/vim-instant-markdown'

" General
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-unimpaired'
Plugin 'christoomey/vim-tmux-navigator'

" Not used
Plugin 'vim-scripts/Gundo'
" Get? 
" ControlP, unimpaired
call vundle#end()

filetype plugin indent on
syntax on
autocmd BufNewFile,BufReadPost *.md set filetype=markdown syntax=off

let mapleader=','
set noerrorbells
set novisualbell

set relativenumber
set number

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
autocmd BufNewFile,BufReadPost *.go set shiftwidth=4 tabstop=4

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
" ca t TEX

" spellcheck
ca spell setlocal spell spelllang=en_us
ca nospell set nospell
highlight clear SpellBad
highlight SpellBad ctermbg=Green

" Create splits
" move between splits
" remember that it is :vsp filename to open a file in a v split

" Force me to use hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>
noremap <leader>j J
noremap <leader>k K
noremap J 10j
noremap K 10k

" Shortcut sup and spuer script on md
ca ss %s/_{/<sub>/eg \| %s/_}/<\/sub>/eg \| %s/\^{/<sup>/eg \| %s/\^}/<\/sup>/eg

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
noremap <LEADER>m :lnext

let g:syntastic_javascript_checkers = ['jsxhint']
