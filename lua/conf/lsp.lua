local lspconfig = require 'lspconfig'

local on_attach = function()
  vim.wo.signcolumn = 'yes'
  vim.bo.formatexpr = 'v:lua.vim.lsp.formatexpr'

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = true })
  vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition, { buffer = true })
  vim.keymap.set('n', '<localleader>f', vim.lsp.buf.formatting, { buffer = true })
  vim.keymap.set('n', '<localleader>a', vim.lsp.buf.code_action, { buffer = true })
  vim.keymap.set('n', '<localleader>r', vim.lsp.buf.rename, { buffer = true })

  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { buffer = true })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = true })
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
lspconfig.pyright.setup {}
lspconfig.zls.setup {}
lspconfig.clangd.setup {}
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      },
      assist = {
        importGranularity = 'module',
        importPrefix = 'self',
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
-- lspconfig.texlab.setup {}
