-- General development plugins

return {
  {
    "windwp/nvim-autopairs",
    config = true,
  },

  {
    "tpope/vim-abolish",
  },

  {
    "numToStr/Comment.nvim",
    config = true,
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    opts = { useDefaultKeymaps = true, disabledKeymaps = { "gc" } },
  },

  {
    "kylechui/nvim-surround",
    config = true,
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
