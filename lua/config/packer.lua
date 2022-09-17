local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

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

  use { 'nvim-telescope/telescope.nvim', commit = '30e2dc5232d0dd63709ef8b44a5d6184005e8602'}
  use {'nvim-telescope/telescope-file-browser.nvim', commit = '60bcf4e70ecb9392445c2a2205ee8181dff964d5'}
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
 
  -- GIT
  use "f-person/git-blame.nvim"
  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
      require('git-conflict').setup()
  end}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)