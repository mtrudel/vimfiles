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

" Window bits

set title
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

set colorcolumn=80

set background=light
colorscheme solarized
set mouse=a

if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

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
nnoremap j gj
nnoremap k gk
inoremap jj <esc>
cnoremap jj <c-c>
cnoremap <M-OD>  <S-Left>
cnoremap <M-OC>  <S-Right>
map QQ ZQ
map WW :wa<CR>
nmap ; :
map <C-K> <C-W>k<C-W>
map <C-J> <C-W>j<C-W>

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
    autocmd bufwritepost .vimrc source ~/.vimrc
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



" CtrlP
" =====

nnoremap <silent> <leader>t :ClearCtrlPCache<cr>\|:CtrlP<cr>
inoremap <silent> <leader>t <esc> :ClearCtrlPCache<cr>\|:CtrlP<cr>
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp)$|(^|[/\\])\.(git)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_dotfiles = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_height = 30
let g:ctrlp_cmd = 'CtrlP' 
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

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

