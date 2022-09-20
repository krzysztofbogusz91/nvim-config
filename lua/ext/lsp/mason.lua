local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, mason_lsp = pcall(require, "mason-lspconfig")
if (not status2) then return end

local on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs)
    local opts = { buffer = true }
    vim.keymap.set(mode, lhs, rhs, opts)
  end
  -- Mappings.
  local opts = { noremap = true, silent = true }
  -- Displays hover information about the symbol under the cursor
  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  -- Jump to the definition
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  -- Jump to declaration
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  -- Lists all the references
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  -- Renames all references to the symbol under the cursor
  bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

  -- Lists all the implementations for the symbol under the cursor
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  -- Selects a code action available at the current cursor position
  bufmap('n', '<c-a>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  bufmap('x', '<c-a>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
  -- Show diagnostics in a floating window
  bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

  -- Move to the previous diagnostic
  bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

  -- Move to the next diagnostic
  bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local servers = {
  "html",
  "jsonls",


  "cssls",
  "cssmodules_ls",
  "tailwindcss",

  "emmet_ls",

  "tflint",
  "tsserver",
  "angularls",
  "volar",

  "yamlls",
  "bashls",

  -- markdown
  "zk",

  "sumneko_lua",
}
--  TODO eslint test!!
mason.setup({})

mason_lsp.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local status_cmp_ok, cmp_lspconfig = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
cmp_lspconfig.update_capabilities(capabilities)


lspconfig.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    -- for nvim 0.8 need to switch to those:
    --  https://github.com/neovim/nvim-lspconfig/issues/1891#issuecomment-1157964108
    -- client.server_capabilities.documentFormattingProvider = false
    -- client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  -- cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.zk.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

-- Make snipet go last
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = { "emmet_ls", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "haml",
    "xml",
    "xsl",
    "pug",
    "slim",
    "sass",
    "stylus",
    "less",
    "sss",
    "hbs",
    "handlebars",
  },
}
