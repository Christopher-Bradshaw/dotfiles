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
Plugin 'suan/vim-instant-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'wincent/command-t'
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'solarnz/thrift.vim'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()

filetype plugin indent on
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

" Move 10 lines
noremap <leader>j J
noremap J 10j
" https://github.com/fatih/vim-go/issues/140
noremap K 10k

" Syntastic
command W w | SyntasticCheck
let g:syntastic_aggregate_errors = 1
"autocmd BufNewFile,BufRead *.go let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" let g:syntastic_go_checkers = ['go']

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_typescript_checkers = ['tslint']


" Selecta
function! Selecta(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! GitGrep()
  let takeFile = "\| cut -d: -f 1"
  let search = input("> ")
  call Selecta("git grep \"" . search . "\"", takeFile, ":tabnew")
endfunction

nnoremap <leader>s :call Selecta("git ls-files " . expand('%:h'), "", ":tabnew") <CR>
nnoremap <leader>g :call GitGrep() <CR>

" command T defaults
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

" n always forward, N always backward
nnoremap <expr> N (v:searchforward ? 'N' : 'n')
nnoremap <expr> n (v:searchforward ? 'n' : 'N')

" 
set foldmethod=indent
set shortmess+=c
set backspace=indent,eol,start
