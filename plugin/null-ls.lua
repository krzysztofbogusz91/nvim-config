local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.completion.spell,
    -- null_ls.builtins.completion.luasnip,
}, 
-- prettier setup
on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

    -- format on save
    vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  end

  if client.server_capabilities.documentRangeFormattingProvider then
    vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
  end
end,

}