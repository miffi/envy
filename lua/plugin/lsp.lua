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
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              telemetry = {
                enable = false,
              },
            },
          },
        },
        purescriptls = {},
        clangd = {},
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
            },
          },
        },
        marksman = {},
        pylsp = {
          plugins = {
            black = {
              enabled = true,
            },
            mypy = {
              enabled = true,
            },
          },
        },
        hls = {},
        elixirls = {
          cmd = { vim.fn.expand("~/opt/elixir-ls/language_server.sh") },
        },
        gleam = {},
        tinymist = {},
      },
    },
    config = function(_, opts)
      for name, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        require('lspconfig')[name].setup(config)
      end
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
