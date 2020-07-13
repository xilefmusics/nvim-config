let mapleader = ' '
autocmd! bufwritepost init.vim source % " autmoatically source init.vim
autocmd BufWritePre * %s/\s\+$//e " delete trailing whitespaces
set number relativenumber " linenumbers
set ts=2 sw=2 expandtab " use 2 spaces instead of 1 tab
set autoindent
set incsearch ignorecase nohlsearch
set nobackup noswapfile
set hidden
set clipboard=unnamedplus
filetype plugin indent on
syntax on
set termguicolors
set noshowmode
set splitbelow
