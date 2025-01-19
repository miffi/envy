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
        lazy = false,
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
