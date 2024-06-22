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
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      telescope.load_extension("fzf")
    end,
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
