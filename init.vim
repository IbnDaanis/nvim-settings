imap jj <Esc>

set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'karb94/neoscroll.nvim'
call plug#end()

syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set noswapfile
set undodir=~/.vim/undod/
set smartcase
set incsearch
set hidden
set undofile
set incsearch
set nohlsearch
set scrolloff=8
set signcolumn=yes
filetype plugin indent on
let mapleader = " "

if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula

nnoremap <leader>v :e $MYVIMRC<CR>

lua require('neoscroll').setup()
