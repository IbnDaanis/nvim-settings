vim.cmd("packadd packer.nvim")

packer = require("packer")

return packer.startup(function()
  -- Packer can manage itself
  use({ "wbthomason/packer.nvim", opt = true })

  local config = function(name)
    return string.format("require('plugins.%s')", name)
  end

  local use_with_config = function(path, name)
    use({ path, config = config(name) })
  end

  -- additional functionality
  use({
    "windwp/nvim-autopairs",
    config = config("autopairs"),
  })

  -- TreeSitter
  use({
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate',
    config = config("treesitter")
  })

  -- lsp
  use("neovim/nvim-lspconfig") 
  use("nvim-lua/completion-nvim")

  -- Completion 
  use'hrsh7th/cmp-nvim-lsp'
  use'hrsh7th/cmp-buffer'
  use({
    'hrsh7th/nvim-cmp',
    config = config("cmp")
  })
  use'hrsh7th/cmp-vsnip'
  use'hrsh7th/vim-vsnip'

  -- VS Code Like Pictograms
  use'onsails/lspkind-nvim'

  -- Lualine 
  use({
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
    config = config("lualine")
  })

  -- Neoscroll
  use({
    "karb94/neoscroll.nvim",
    config = config("neoscroll")
  })

  -- Colorizer
  use({
    "norcalli/nvim-colorizer.lua",
    config = config("colorizer")
  })

  -- Dracula
  use({
    'dracula/vim',
    as = 'dracula',
    config = config("colorscheme")
  })

end)
