return {
    {
        "lervag/vimtex",
        init = function()
            require("util").set_vars {
                tex_flavor = "latex",
                vimtex_view_method = "zathura",
            }
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop",
        },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        init = function()
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_combine_preview = 1
            vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
        end,
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        ft = { "rust" },
        init = function()
            vim.g.rustaceanvim = function()
                -- Update this path
                local extension_path = vim.env.HOME .. "/opt/vscode-lldb/"
                local codelldb_path = extension_path .. "adapter/codelldb"
                local liblldb_path = extension_path .. "lldb/lib/liblldb"
                local this_os = vim.uv.os_uname().sysname

                -- The path is different on Windows
                if this_os:find("Windows") then
                    codelldb_path = extension_path .. "adapter\\codelldb.exe"
                    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
                else
                    -- The liblldb extension is .so for Linux and .dylib for MacOS
                    liblldb_path = liblldb_path
                        .. (this_os == "Linux" and ".so" or ".dylib")
                end

                local cfg = require("rustaceanvim.config")
                return {
                    dap = {
                        adapter = cfg.get_codelldb_adapter(
                            codelldb_path,
                            liblldb_path
                        ),
                    },
                }
            end
        end,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    {
        "saecki/crates.nvim",
        main = "crates",
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },

    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = {
            flutter_path = vim.fn.expand("~/opt/flutter/bin/flutter"),
        },
    },
}
