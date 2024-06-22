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
