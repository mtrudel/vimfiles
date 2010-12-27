" Load bundles via pathogen
" =========================

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on


" Application settings
" ====================

let mapleader = ","
set nocompatible
set nobackup
set modelines=0
set shell=bash
set encoding=utf-8
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set wrap
set textwidth=79
set formatoptions=qrn1
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch


" Visual things
" =============

set number
set ruler
set hlsearch
set novb  
set shortmess=atI
set cursorline
hi clear CursorLine
hi CursorLine ctermbg=8
syntax on 
set listchars=tab:▸\ ,eol:¬
set scrolloff=3
set showmode
set showcmd
set hidden
set expandtab       " Use spaces in lieu of tab characters
set tabstop=2
set softtabstop=2   " Tabs are 2 spaces wide
set shiftwidth=2
set autoindent

" Window bits
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

if v:version > 730
  set colorcolumn=80,120
endif

if v:version > 702
  set relativenumber
endif


" Key mappings
" ============

noremap <silent> <Space> :silent noh<Bar>echo<CR>
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %
nnoremap j gj
nnoremap k gk

nmap <leader>l :set list!<CR>

nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>n :split<CR> <C-w><C-w>
nmap <leader>w <C-w><C-w>_

" Keyboard remaps
nmap <silent> <Leader>o :NERDTreeToggle<CR>
map <silent> <Leader>/ :TComment<CR>
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
vmap <leader>c :w !pbcopy<CR><CR>
nmap <leader>c :.w !pbcopy<CR><CR>
map <leader>s :shell<CR>
map <leader>f :Ack 
map <leader>q ZQ
map QQ ZQ
map WW ZZ
nmap <silent> <leader>w :set wrap!<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nnoremap <leader>1 yypVr=
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nmap <leader>v :e $MYVIMRC<CR>


" File type tweaks
" =================

" http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2400289#2400289
if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif

autocmd FileType make set noexpandtab
autocmd FileType md set nonumber

