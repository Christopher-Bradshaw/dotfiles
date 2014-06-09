set nocompatible
set nu
set autoindent
set noerrorbells
set novisualbell
set expandtab
set tabstop=2
set shiftwidth=2

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
