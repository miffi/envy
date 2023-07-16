return {
  {
    "sindrets/diffview.nvim",
    opts = {
      use_icons = false,
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = true,
  },
}
