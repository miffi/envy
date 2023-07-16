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
    "b3nj5m1n/kommentary",
    config = function()
      require("kommentary.config").configure_language("c", {
        prefer_single_line_comments = true,
      })
    end,
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

  {
    "mfussenegger/nvim-lint",
    lazy = false,
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        sh = { "shellcheck" },
        go = { "golangcilint" },
        js = { "eslint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  {
    "folke/trouble.nvim",
    name = "trouble",
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", silent = true, noremap = true },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", silent = true, noremap = true },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", silent = true, noremap = true },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", silent = true, noremap = true },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", silent = true, noremap = true },

      { "gR", "<cmd>TroubleToggle lsp_references<cr>", silent = true, noremap = true },
    },
    opts = {
      -- settings without a patched font or icons
      icons = false,
      fold_open = "v", -- icon used for open folds
      fold_closed = ">", -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
    },
  },
}
