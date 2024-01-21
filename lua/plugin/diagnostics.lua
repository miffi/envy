return {
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
