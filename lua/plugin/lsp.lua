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
        vim.keymap.set(
            "n",
            "<space>dr",
            vim.lsp.buf.remove_workspace_folder,
            opts
        )
        vim.keymap.set("n", "<space>dl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    end,
})

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using (most
                                -- likely LuaJIT in the case of Neovim)
                                version = "LuaJIT",
                                -- Tell the language server how to find Lua modules same way as Neovim
                                -- (see `:h lua-module-load`)
                                path = {
                                    "lua/?.lua",
                                    "lua/?/init.lua",
                                },
                            },
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                    -- Depending on the usage, you might want to add additional paths
                                    -- here.
                                    -- '${3rd}/luv/library'
                                    -- '${3rd}/busted/library'
                                },
                                -- Or pull in all of 'runtimepath'.
                                -- NOTE: this is a lot slower and will cause issues when working on
                                -- your own configuration.
                                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                                -- library = {
                                --   vim.api.nvim_get_runtime_file('', true),
                                -- }
                            },
                        },
                    },
                },
                clangd = {},
                gopls = {
                    settings = {
                        gopls = {
                            gofumpt = true,
                        },
                    },
                },
                ruff = {},
                pyright = {},
                -- hls = {},
                gleam = {},
                racket_langserver = {},
            },
        },
        config = function(_, opts)
            for name, config in pairs(opts.servers) do
                vim.lsp.config(name, config)
                vim.lsp.enable(name)
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
