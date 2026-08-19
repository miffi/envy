-- Merge capabilities with the default config from lsp/markdown_oxide.lua
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- If using nvim-cmp, extend capabilities (optional)
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

return {
  -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
  -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
  capabilities = vim.tbl_deep_extend(
    'force',
    capabilities,
    {
      workspace = {
	didChangeWatchedFiles = {
	  dynamicRegistration = true,
	},
      },
    }
  ),
}
