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
noremap <silent> <Space> :silent noh<Bar>echo<CR>
nnoremap <tab> %
vnoremap <tab> %
nnoremap j gj
nnoremap k gk
inoremap jj <esc>
cnoremap jj <c-c>
map QQ ZQ
map WW ZZ

nnoremap <leader><space> :noh<cr>

map <leader>b :LustyJuggler<CR>
map <leader>c :copen<CR>
map <leader>cc :cclose<CR>
map <leader>d :s//\r/<CR>
map <leader>f :Ack 
nmap <leader>l :set list!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nmap <silent> <Leader>o :NERDTreeToggle<CR>
nmap <leader>p "*p
nmap <leader>r :registers<CR>
map <leader>x :shell<CR>
nmap <leader>s :setlocal spell!<CR>
nmap <leader>v :e $MYVIMRC<CR>
nmap <silent> <leader>w :set wrap!<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nmap <leader>y "*y
nnoremap <leader>1 yypVr=
map <silent> <Leader>/ :TComment<CR>
map <silent> <Leader>t :CommandTFlush<CR> :CommandT<CR>
map <leader>q ysiw

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
autocmd BufNewFile,BufRead,BufEnter Rakefile,Capfile,Vagrantfile set filetype=ruby
autocmd BufWritePost * if getline(1) =~ "^#!" | silent !chmod a+x <afile> | endif | endif
autocmd FocusLost * :wa
autocmd BufWritePre *.js,*.rb :s/\s\+$//e

let g:LustyJugglerSuppressRubyWarning = 1

set background=light
colorscheme solarized
set mouse=a

set wildignore+=*.o,*.obj,.git,*.png,*.otf,build/**
