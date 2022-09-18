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
  -- todo update in the future for now hijack_nerd_tree is not working as intended
  -- https://github.com/nvim-telescope/telescope-file-browser.nvim/commit/c46e7e7e8adb9f17462d9ff1787209b483a640aa
  use {'nvim-telescope/telescope-file-browser.nvim', commit = 'c30fcb6214acf8538616e403e0f82a6430bf6801'}
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

  -- Smooth scrolling for window movement commands (mappings optional): <C-u>, <C-d>, <C-b>, <C-f>, <C-y>, <C-e>, zt, zz, zb.
  use {'karb94/neoscroll.nvim', commit = 'd38b613f9177f3ca40dc8958314fce1d77939fc2',
  config = function() 
    require('neoscroll').setup()
  end}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)