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
    "chrisgrieser/nvim-various-textobjs",
    opts = { useDefaultKeymaps = true, disabledKeymaps = { "gc" } },
  },

  { -- Autoformat
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format {
            async = true,
            lsp_fallback = true,
          }
        end,
        mode = "n",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },

  {
    "kylechui/nvim-surround",
    config = true,
  },

  {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    init = function()
      require("util").set_vars {
        tex_flavor = "latex",
        vimtex_view_method = "zathura",
      }
    end,
  },
}
