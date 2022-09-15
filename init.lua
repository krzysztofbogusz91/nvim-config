vim.cmd("autocmd!")
vim.api.nvim_exec('language en_US', true)
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.wo.number = true

-- set space to be a leader
vim.g.mapleader = " "
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2

-- must haves
vim.opt.spell = true

vim.opt.tabstop = 2
vim.opt.wrap = true -- Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
-- for cmp
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.cmd([[set clipboard=unnamedplus]])
vim.cmd([[set signcolumn=yes]])

 require "mappings.mappings"
require "ext.autopairs"
require "ext.gruvbox"
require "ext.better_escape"

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

