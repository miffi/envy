local lspconfig = require 'lspconfig'

local on_attach = function(client)
  vim.wo.signcolumn = 'yes'
  vim.bo.formatexpr = 'v:lua.vim.lsp.formatexpr'

  return require('nest').applyKeymaps {
    buffer = true,
    { 'K', vim.lsp.buf.hover },
    { '<c-]>', vim.lsp.buf.definition },
    { '<localleader>f', vim.lsp.buf.formatting },
    { '<localleader>a', vim.lsp.buf.code_action },
    { '<localleader>r', vim.lsp.buf.rename },
  }
end

--[[ require('null-ls').setup {
  sources = {
    require('null-ls').builtins.formatting.stylua,
    on_attach = keybinds,
  },
} ]]

-- default config
lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }),
  },
})

-- LSPs
lspconfig.dartls.setup {}
lspconfig.clangd.setup {}
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      },
    },
  },
}
lspconfig.texlab.setup {}
