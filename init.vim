imap jj <Esc>

set nocompatible
filetype off

syntax on

set tabstop=2 softtabstop=2
set shiftwidth=2
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
set scrolloff=20
set signcolumn=yes
filetype plugin indent on
let mapleader = " "

if (has("termguicolors"))
  set termguicolors " enable true colors support
endif

let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula

lua require("plugins")
lua require("lsp") 
