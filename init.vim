imap jj <Esc>

set nocompatible
filetype off


call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'preservim/nerdtree' 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme gruvbox
map <silent> <C-n> :NERDTreeFocus<CR>

syntax on
set background=dark
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set noswapfile
set undodir=~/.vim/undod/
set undofile
set incsearch
set nohlsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

