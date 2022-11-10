local telescope = require 'telescope'

telescope.load_extension 'fzf'
telescope.setup {
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

    sorting_strategy = 'ascending',

    layout_config = {
      height = 10,
    },

    layout_strategy = 'bottom_pane',
  },
}

local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>tb', builtin.buffers)
vim.keymap.set('n', '<leader>tf', builtin.find_files)
vim.keymap.set('n', '<leader>tg', builtin.live_grep)

vim.keymap.set('n', '<leader>tv', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end)
