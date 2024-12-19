return {
  {
    "miffi/apropospriate.nvim",

    dev = true,
    dir = "~/dev/apropospriate.nvim/",

    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("apropospriate")
    end,
  },
}
