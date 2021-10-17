vim.cmd("packadd packer.nvim")

packer = require('packer')

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
    "windwp/nvim-autopairs", -- autocomplete pairs
    config = config("autopairs"),
  })

  -- lsp
  use("neovim/nvim-lspconfig") -- makes lsp configuration easier
  use("nvim-lua/completion-nvim")

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = config("lualine")
  }
end)
