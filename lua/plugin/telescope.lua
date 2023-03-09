return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      { '<leader>tb', function() require('telescope.builtin').buffers() end },
      { '<leader>tf', function() require('telescope.builtin').find_files() end },
      { '<leader>tg', function() require('telescope.builtin').live_grep() end },
      
      { '<leader>tv', function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end, },
    },
    opts = {
      defaults = {
        prompt_prefix = '@ ',
        selection_caret = '> ',
        entry_prefix = '  ',

        preview = false,

        border = true,
        borderchars = {
          prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
          results = { ' ' },
          preview = { ' ' },
        },

        results_title = false,
        prompt_title = false,

        sorting_strategy = 'ascending',

        layout_config = {
          height = 10,
        },

        layout_strategy = 'bottom_pane',
      }
    },
    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.load_extension 'fzf'
      telescope.setup(opts)
    end,
  },
}
