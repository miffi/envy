-- General development plugins

return {
  {
    "windwp/nvim-autopairs",
    config = true,
  },

  {
    "stevearc/oil.nvim",
    lazy = false,
    name = "oil",
    config = true,
  },

  {
    -- comment/uncomment stuff
    "numToStr/Comment.nvim",
    main = "Comment",
    config = true,
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    opts = { useDefaultKeymaps = true },
  },

  {
    "kylechui/nvim-surround",
    config = true,
  },

  {
    -- a really good solution to paren handling
    "eraserhd/parinfer-rust",
    build = "cargo build --release",
  },

  {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    init = function()
      require("util").set_vars({
        tex_flavor = "latex",
        vimtex_view_method = "zathura",
      })
    end,
  },
}
