syntax on

set number

set shiftwidth=4
set tabstop=4
set expandtab

set nowrap
set scrolloff=10

set hlsearch
set incsearch

set ignorecase
set smartcase

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 

imap <C-c> <Esc>

set viminfo+=n~/.vim/viminfo
