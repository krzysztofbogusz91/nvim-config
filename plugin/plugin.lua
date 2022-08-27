
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-lua/plenary.nvim' -- Common utilities
  -- use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip' -- Snipets for CMP

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Linting from lsp
  use 'glepnir/lspsaga.nvim' -- LSP UIs

  use 'MunifTanjim/prettier.nvim' 

  use { "ellisonleao/gruvbox.nvim" }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }

  -- Your plugins go here
end)