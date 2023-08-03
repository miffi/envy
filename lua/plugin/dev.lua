-- General development plugins

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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
