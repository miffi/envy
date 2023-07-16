return {
  "mhartington/formatter.nvim",
  main = "formatter",
  keys = {
    {
      "<leader>f",
      "<cmd>Format<CR>",
    },
  },
  opts = {
    filetype = {
      lua = function()
        return require("formatter.filetypes.lua").stylua()
      end,
    },
  },
}
