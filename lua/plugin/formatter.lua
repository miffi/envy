return {
  "mhartington/formatter.nvim",
  keys = {
    {
      "<leader>f",
      "<cmd>Format<CR>",
    },
  },
  opts = {
    filetype = {
--      lua = function()
--        return require("formatter.filetypes.lua").stylua()
--      end,
    },
  },
}
