set nocompatible

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set backspace=indent,eol,start

syntax on

let mapleader = ","

map <Leader>f :NERDTreeToggle <CR>
map <Leader>n :noh <CR>
map <Leader>k <C-W>k
map <Leader>j <C-W>j
map <Leader>h <C-W>h
map <Leader>l <C-W>l
map <Leader>t :CommandT <CR>

map <C-h> :bprev <CR>
map <C-l> :bnext <CR>

set gcr=n:blinkon0

set nobackup
set history=50
set ruler
set nu
set showcmd
set hls is ic scs
set laststatus=2
set statusline=%F\ %m%r%h%w\ [%l,%v]\ [%L]\ (%p%%)
set showmatch

filetype plugin indent on
au FileType text setlocal textwidth=78
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


