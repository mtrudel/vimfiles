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
set encoding=utf-8
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set nowrap
set textwidth=80
set linebreak
set formatoptions=r1tcq
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set dir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set exrc
set secure
set nofoldenable 

" Visual things
" =============

set number
set ruler
set hlsearch
set novb  
set shortmess=atI
set cursorline
syntax on 
set listchars=tab:▸\ ,eol:¬
set scrolloff=3
set showmode
set showcmd
set hidden
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

" Window bits

set title
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

if v:version > 730
  set colorcolumn=80,120
endif

set background=light
colorscheme solarized
set mouse=a

" Key mappings
" ============

noremap  y "*y
noremap  yy "*yy
noremap  Y "*Y
noremap  p "*p
noremap  P "*P

map Q <Nop> " shut up ex mode
set pastetoggle=<leader>P 
nnoremap <tab> %
vnoremap <tab> %
inoremap jj <esc>
cnoremap jj <c-c>
map QQ ZQ
map WW :wa<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <leader><space> :noh<cr>

map <Leader>a ggVG
map <leader>b :LustyJuggler<CR>
map <leader>f :Ack 
map <silent> <leader>t :CommandTFlush<CR> :CommandT<CR>
nmap <leader>V :e $MYVIMRC<CR>
nmap <silent> <leader>w :set wrap!<CR>

" File type tweaks
" ================

if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END

  autocmd FileType make set noexpandtab
  autocmd FileType md set nonumber
  autocmd BufNewFile,BufRead,BufEnter Rakefile,Capfile,Vagrantfile set filetype=ruby
  autocmd FocusLost * :wall
  autocmd BufWritePre *.js,*.rb :s/\s\+$//e

  autocmd BufWritePost *.md,*.markdown :silent !cat %:p | curl -X PUT -T - http://localhost:8090/
endif


set wildignore+=*.o,*.obj,.git,*.png,*.otf,build/**
