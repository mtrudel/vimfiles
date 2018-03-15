set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle.vundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slashmili/alchemist.vim'
Plugin 'ervandew/supertab'
Plugin 'elixir-editors/vim-elixir'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjbach/lusty'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'mhinz/vim-mix-format'
Plugin 'sjl/vitality.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'junegunn/fzf'

call vundle#end()
filetype plugin indent on

" Application settings
" ====================

let mapleader = ","
set nobackup
set modelines=0
set encoding=utf-8
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set nowrap
set textwidth=120
set linebreak
set formatoptions=r1tcq
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
hi MatchParen cterm=underline ctermbg=none ctermfg=none
set hlsearch
set dir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set exrc
set secure
set nofoldenable 
set noswapfile

" Visual things
" =============

set number
set ruler
set hlsearch
set novb  
set shortmess=atI
"set cursorline
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
set clipboard=unnamed

" Window bits

set title
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

set colorcolumn=80,120

set background=dark
colorscheme solarized
set mouse=a

" Key mappings
" ============

noremap s "_s
noremap c "_c
noremap C "_C
noremap d "_d
noremap dd "_dd
noremap D "_D
noremap x "_x

map Q <Nop> " shut up ex mode
set pastetoggle=<leader>P 
map QQ ZQ
map WW :wa<CR>
nmap ; :

vnoremap < <gv
vnoremap > >gv

nnoremap <leader><space> :noh<cr>

map <Leader>a ggVG
map <leader>b :LustyJuggler<CR>
inoremap <silent> <Leader>b <esc>:LustyJuggler<CR>
nmap <leader>V :e $MYVIMRC<CR>
nmap <silent> <leader>w :set wrap!<CR>
nmap <leader>1 :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>

" File type tweaks
" ================

if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost vimrc source ~/.vim/vimrc
  augroup END

  autocmd FileType make set noexpandtab
  autocmd FileType md set nonumber
  autocmd BufNewFile,BufRead,BufEnter Rakefile,Capfile,Vagrantfile set filetype=ruby
  autocmd FocusLost * :wall
  autocmd BufWritePre *.js,*.rb :s/\s\+$//e
  autocmd StdinReadPre * let s:std_in=1
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

" Customize plugins
" =================

let g:LustyJugglerSuppressRubyWarning = 1
set wildignore+=*.o,*.obj,.git,*.png,*.otf,build/**
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
highlight clear SignColumn



" FZF
" ===

nnoremap <silent> <leader>t :FZF<cr>
inoremap <silent> <leader>t :FZF<cr>
let $FZF_DEFAULT_COMMAND= 'ag -g ""'

" ack
" ===

map <leader>f :Ack 
set grepprg=ag\ --nogroup\ --nocolor
let g:ackprg = 'ag --nogroup --nocolor --column'


" Powerline / Airline
" ===================

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

" Syntastic
" =========

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_mri_quiet_messages = {'regex': 'assigned but unused variable'}

" RainbowParentheses
" ==================

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
nmap <leader>r :RainbowParentheses!!<CR>

" vim-mix-format
" ==============

let g:mix_format_on_save = 1
