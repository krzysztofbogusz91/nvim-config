-- Functional wrapper for mapping custom keybindings
local op = { noremap = true, silent = true }
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- edit file under cursor
map("n", ",gf", "edit <cfile><cr>", op)
vim.cmd([[nmap <c-q> :bd<cr>]], op)
vim.cmd([[nmap <c-s> :wa<cr>]], op)
-- splits // off - interact with diagnostic info
-- noremap("<c-j>", "<c-w>j")
-- noremap("<c-k>", "<c-w>k")
-- noremap("<c-h>", "<c-w>h")
-- noremap("<c-l>", "<c-w>l")
