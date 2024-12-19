local layout = {
    prompt_prefix = "@ ",
    selection_caret = "> ",
    entry_prefix = "  ",

    preview = true,

    border = true,
    borderchars = {
        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
        results = { " " },
        preview = { " " },
    },

    results_title = false,
    prompt_title = false,

    sorting_strategy = "ascending",

    layout_strategy = "bottom_pane",
}

local keys = {
    {
        "<leader>vv",
        function()
            require("telescope.builtin").find_files {
                cwd = vim.fn.stdpath("config"),
                prompt_title = "Edit neovim config",
            }
        end,
        desc = "Edit neovim config",
    },
    {
        "<leader>vn",
        function()
            require("telescope.builtin").live_grep {
                cwd = vim.fn.expand("~/docs/notes/"),
                prompt_title = "Find note",
            }
        end,
        desc = "Find in notes",
    },
    {
        "<leader>vb",
        function()
            require("telescope.builtin").buffers {}
        end,
        desc = "Find buffer",
    },
}

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        opts = {
            defaults = layout,
        },
        main = "telescope",
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)

            telescope.load_extension("fzf")
        end,
        keys = keys,
    },

    {
        "stevearc/dressing.nvim",
        opts = {
            select = {
                backend = { "telescope", "builtin" },

                telescope = layout,
            },
        },
    },
}
