local vimp = require 'vimp'

local function ivy(opts)
  opts = opts or {}

  return vim.tbl_deep_extend('force', {
    sorting_strategy = 'ascending',

    preview_title = '',
    previewer = false,

    layout_strategy = 'bottom_pane',
    layout_config = {
      height = 10,
    },

    prompt_prefix = ' @ ',
    selection_caret = ' ',
    entry_prefix = ' ',

    border = true,
    borderchars = {
      'z',
      prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
      results = { ' ' },
    },
  }, opts)
end

require('telescope').setup = {
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}
require('telescope').load_extension 'fzy_native'

local builtin = require 'telescope.builtin'
vimp.nnoremap('<leader>ev', function()
  builtin.find_files(ivy { search_dirs = { '$XDG_CONFIG_HOME/nvim' } })
end)

-- Stolen from
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
vimp.nnoremap('<leader>ef', function()
  local opts = ivy {} -- define here if you want to define something
  local ok = pcall(require('telescope.builtin').git_files, opts)
  if not ok then
    require('telescope.builtin').find_files(opts)
  end
end)
