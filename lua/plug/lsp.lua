local lspconfig = require 'lspconfig'

local keybinds = function(client)
  return require('nest').applyKeymaps {
    buffer = true,
    { 'K', vim.lsp.buf.hover },
    { '<c-]>', vim.lsp.buf.definition },
    { '<localleader>f', vim.lsp.buf.formatting },
    { '<localleader>a', vim.lsp.buf.code_action },
    { '<localleader>r', vim.lsp.buf.rename },
  }
end

-- default config
lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  on_attach = keybinds,
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
lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true
      }
    }
  }
}
lspconfig.hls.setup {
  settings = {
    languageServerHaskell = {
      formattingProvider = 'stylish-haskell',
      completionSnippetsOn = true,
    },
  },
}
