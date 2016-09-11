" TODO - try switch to buffers?

set nocompatible
set shell=/bin/bash
filetype off

" ***************************** Vundle ************************************** "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Tab completion: trying out ycm. Use supertab if YCM not compiled
" Follow instructions carefully to compile ycm
" Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'

" Fuzzy file finder. Use this rather than command-t because simpler /shrug
Plugin 'ctrlpvim/ctrlp.vim'

" Find and replace
Plugin 'dkprice/vim-easygrep'

" easily comment things (gc<movement>)
Plugin 'tpope/vim-commentary'

" git in vim (G[status|diff|etc])
Plugin 'tpope/vim-fugitive'

" File tree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" undo
Plugin 'sjl/gundo.vim'

" Status bar
Plugin 'bling/vim-airline'

" speed up little things
Plugin 'tpope/vim-unimpaired'

" Language specific
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'solarnz/thrift.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/syntastic'

call vundle#end()
" ***************************** Vundle ************************************** "

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
:highlight LineNr ctermfg=grey

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

" colors
set background=dark

" Searching and highlighting
set hlsearch
set incsearch
highlight Search cterm=NONE ctermfg=black ctermbg=lightgray
nnoremap <expr> N (v:searchforward ? 'N' : 'n')
nnoremap <expr> n (v:searchforward ? 'n' : 'N')

" match whitespace and redraw when leaving/entering insert mode
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/

" folding
set foldmethod=indent
set foldlevelstart=20
nnoremap <leader>f za
nnoremap <silent> <leader>jj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>jk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

" mappings
map Y y$

" get rid annoying .swp files
" these dirs must exist
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" don't hit shift all the time
noremap ; :

" easy new tab
ca tn tabnew

" spellcheck
ca spell setlocal spell spelllang=en_us
ca nospell set nospell
highlight clear SpellBad
highlight SpellBad ctermbg=Green

" Create horizontal split like vertical split (:vsp filename)
nnoremap <C-W><C-H> sp

" move between splits
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Force me to use hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" Move 10 easily
noremap <leader>j J
noremap J 10j
" map <leader>k vim vim-go https://github.com/fatih/vim-go/issues/140
noremap K 10k

" backspace refuses to kill linebreaks and things not inserted during this insert?
set backspace=indent,eol,start

" set statusline to always show
set laststatus=2

" **************************** Syntastic ************************************ "
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" only check on W
command W w | SyntasticCheck

" Go - contains both syntastic and vim-go commands
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" Run goimports on gofmt (each save)
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
" **************************** Syntastic ************************************ "

" ctrl-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_map = '<leader>p'
" default to open in
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
set wildignore+=*/vendor/*

" nerdtree
let g:nerdtree_tabs_open_on_console_startup = 0
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" gundo
nnoremap <Leader>g :GundoToggle<CR>
let g:gundo_preview_bottom = 1

" easygrep
ca gr Grep
let g:EasyGrepRoot = "search:.git"
let g:EasyGrepMode = 2
let g:EasyGrepCommand = 1
let g:EasyGrepFilesToExclude = "*vendor*"
let g:EasyGrepEveryMatch = 1
let g:EasyGrepRecursive = 1
