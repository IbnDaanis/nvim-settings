imap jj <Esc>

set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'karb94/neoscroll.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'norcalli/nvim-colorizer.lua'

    " Language Server Protocol
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'onsails/lspkind-nvim'

    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
call plug#end()

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

nnoremap <leader>v :e $MYVIMRC<CR>

lua require('neoscroll').setup()

lua require('gitsigns').setup()

lua require('nvim-autopairs').setup()

let g:airline#extensions#tabline#formatter = 'jsformatter'

" neovim/nvim-lspconfig {{{
" npm i -g typescript typescript-language-server
lua << EOF
local util = require "lspconfig/util"
require 'lspconfig'.tsserver.setup{
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json"),
    --[=====[ 
    handlers = {
      ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
        local ignore_codes = { 80001, 7016 };
        if params.diagnostics ~= nil then
          local idx = 1
          while idx <= #params.diagnostics do
            if vim.tbl_contains(ignore_codes, params.diagnostics[idx].code) then
              table.remove(params.diagnostics, idx)
            else
              idx = idx + 1
            end 
          end
        end
        vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
      end,
    },
    --]=====]
}
EOF

lua << EOF
-- npm install -g eslint_d
local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}
-- brew install efm-langserver
require "lspconfig".efm.setup {
    init_options = {documentFormatting = true, codeAction = true},
    filetypes = {"javascriptreact", "javascript", "typescript", "typescriptreact"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            javascript = {eslint},
            javascriptreact = {eslint},
       }
    }
}
EOF

lua << EOF
-- npm i -g vscode-langservers-extracted
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require "lspconfig".html.setup {
  capabilities = capabilities,
}
EOF


" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
