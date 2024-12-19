-- General development plugins

-- Conform nvim commands
vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})

return {
    {
        "glacambre/firenvim",
        init = function()
            vim.g.firenvim_config = {
                globalSettings = { alt = "all" },
                localSettings = {
                    [".*"] = {
                        cmdline = "firenvim",
                        takeover = "never",
                    },
                },
            }
        end,
        build = ":call firenvim#install(0)",
        config = function() end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl.hooks").register("ACTIVE", function(bufnr)
                local filetype = vim.bo[bufnr].filetype
                return filetype == "markdown" or filetype == "djot"
            end)
            require("ibl").setup {
                indent = {
                    highlight = { "Comment" },
                    char = "▏",
                },
                scope = { enabled = false },
            }
        end,
    },

    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },

    { "tpope/vim-abolish" },

    {
        "chrisgrieser/nvim-various-textobjs",
        opts = {
            keymaps = {
                useDefaults = true,
                disabledDefaults = { "gc", "r" },
            },
        },
    },

    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
    },

    {
        "mfussenegger/nvim-lint",
        lazy = false,
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                sh = { "shellcheck" },
                go = { "golangcilint" },
                js = { "eslint" },
            }

            lint.linters.shellcheck.args = {
                "-x",
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },

    { -- Autoformat
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format {
                        async = true,
                        lsp_fallback = true,
                    }
                end,
                mode = "n",
                desc = "Format buffer",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                if
                    vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat
                then
                    return
                end
                local disable_filetypes = {}
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                tex = { "latexindent" },
                cmake = { "cmake_format" },
            },
        },
    },

    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = true,
    },
}
