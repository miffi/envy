local lspconfig = require 'lspconfig'

local on_attach = function(client)
  local vimp = require 'vimp'
  vimp.nnoremap('K', vim.lsp.buf.hover)
  vimp.nnoremap('<c-]>', vim.lsp.buf.definition)
  vimp.nnoremap('<localleader>f', vim.lsp.buf.formatting)
  vimp.nnoremap('<localleader>a', vim.lsp.buf.code_action)
  return vimp.nnoremap('<localleader>r', vim.lsp.buf.rename)
end

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
lspconfig.clangd.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.hls.setup {
  settings = {
    languageServerHaskell = {
      formattingProvider = 'stylish-haskell',
      completionSnippetsOn = true,
    },
  },
}
