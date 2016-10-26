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
Plugin 'rust-lang/rust.vim'
Plugin 'lervag/vimtex'

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
" this appears to not work in vim 8?
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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

" js/ts/es/[a-z]s
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']

" python - pylint is anal
let g:syntastic_python_checkers = ['python']

" HTML
" defaults are good, but install `tidy` (package manager)

" CSS
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_css_csslint_args = ['--ignore=box-model']

" rust
" let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently=1
" **************************** Syntastic ************************************ "

" ctrl-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_show_hidden = 1

" default to open in
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*

" nerdtree
let g:nerdtree_tabs_open_on_console_startup = 0
map <leader>n <plug>NERDTreeTabsToggle<CR>

" gundo
nnoremap <leader>g :GundoToggle<CR>
let g:gundo_preview_bottom = 1

" easygrep
ca gr Grep
let g:EasyGrepRoot = "search:.git"
let g:EasyGrepMode = 2
let g:EasyGrepCommand = 1
let g:EasyGrepFilesToExclude = "vendor"
let g:EasyGrepEveryMatch = 1
let g:EasyGrepReplaceWindowMode = 0
" let g:EasyGrepRecursive = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
set t_Co=256

" ycm
let g:ycm_rust_src_path = '/home/vagrant/rust/src'
nnoremap <leader>t :YcmCompleter GoTo<CR>


" tabs?
:tab sball
