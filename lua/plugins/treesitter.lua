require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "css", "scss", "javascript", "typescript", "lua" },
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
}


