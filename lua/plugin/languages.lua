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
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,
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
        opts = {
            flutter_path = vim.fn.expand("~/opt/flutter/bin/flutter"),
        },
    },

    { "eraserhd/parinfer-rust", build = "cargo build --release" },
}
