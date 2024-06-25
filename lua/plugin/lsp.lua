-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<space>da", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>dr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>dl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- default config
      lspconfig.util.default_config =
        vim.tbl_deep_extend("force", lspconfig.util.default_config, {
          capabilities = capabilities,
        })

      -- LSPs
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" }, -- Revisit after https://github.com/folke/neodev.nvim/issues/185 is fixed
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }
      lspconfig.purescriptls.setup {}
      lspconfig.clangd.setup {
        cmd = { "clangd-16" },
      }
      lspconfig.gopls.setup {
        settings = {
          gopls = {
            gofumpt = true,
          },
        },
      }
      lspconfig.marksman.setup {}
      lspconfig.pylsp.setup {
        plugins = {
          black = {
            enabled = true,
          },
          mypy = {
            enabled = true,
          },
        },
      }
      lspconfig.hls.setup {}
      lspconfig.gleam.setup {}
      lspconfig.zls.setup {}
    end,
  },

  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },

    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },

    opts = {
      mappings = true,
    },
  },
}
