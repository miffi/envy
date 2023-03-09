local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

return {
  {
    'windwp/nvim-autopairs',
    config = true
  },

  {
    -- comment/uncomment stuff
    'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').configure_language('c', {
        prefer_single_line_comments = true,
      })
    end,
  },

  {
    'kylechui/nvim-surround',
    config = true,
  },

  {
    -- a really good solution to paren handling
    'eraserhd/parinfer-rust',
    build = 'cargo build --release',
  },

  {
    'lervag/vimtex',
    ft = { 'tex', 'bib' },
    init = function()
      require('util').set_vars {
        tex_flavor = 'latex',
        vimtex_view_method = 'zathura',
      }
    end,
  },
  
  'gpanders/editorconfig.nvim',

  --[[ {
    'kosayoda/nvim-lightbulb',
    config = function()
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        callback = function()
          require("nvim-lightbulb").update_lightbulb()
        end,
      })
    end,
  }, ]]
  
  {
    'folke/trouble.nvim',
    name = 'trouble',
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", silent = true, noremap = true },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", silent = true, noremap = true },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", silent = true, noremap = true },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", silent = true, noremap = true },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", silent = true, noremap = true },

      { "gR", "<cmd>TroubleToggle lsp_references<cr>", silent = true, noremap = true },
    },
    opts = { -- settings without a patched font or icons
      icons = false,
      fold_open = "v", -- icon used for open folds
      fold_closed = ">", -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
      },
      use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    },
  },

  {
    'mfussenegger/nvim-lint',
    ft = { 'python' },
    config = function()
      require('lint').linters_by_ft = {
        python = {'ruff',}
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  {
    'L3MON4D3/LuaSnip',
    lazy = true,
    build = 'make install_jsregexp',
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  {
    'hrsh7th/nvim-cmp',
    name = 'cmp',
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = {
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        },

        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end,
  }
}
