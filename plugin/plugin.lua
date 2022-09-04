
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

  -- LSP automatization for language servers 
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Linting from lsp
  use 'glepnir/lspsaga.nvim' -- LSP UIs

  -- Cmp code complete, dropdown, snipets
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion

  use 'L3MON4D3/LuaSnip' -- Snipets for CMP
  use { 'saadparwaiz1/cmp_luasnip' } -- Conect luasnip and cmp
  use { 'rafamadriz/friendly-snippets' } -- Conect luasnip and cmp

  use('MunifTanjim/prettier.nvim')

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use { "ellisonleao/gruvbox.nvim" }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }


  use { 'jakewvincent/mkdnflow.nvim',
    config = function()
      require('mkdnflow').setup({})
    end
  }

  use { "terrortylor/nvim-comment",
  config = function() 
    require('nvim_comment').setup()
  end
 }

end)