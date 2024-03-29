local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local sources = { null_ls.builtins.formatting.stylua, null_ls.builtins.formatting.prettier }

null_ls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting()
        end,
      })
    end
  end,
})
