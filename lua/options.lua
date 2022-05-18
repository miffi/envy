local util = require 'util'

util.set_options {
  foldmethod = 'marker',
  shortmess = vim.o.shortmess .. 'I',

  -- completion options
  completeopt = 'menu,menuone,noselect',
  pumheight = 20,

  -- search options
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  hlsearch = false,

  -- saner split defaults
  splitright = true,
  splitbelow = true,

  -- number of lines to keep above or below the cursor
  scrolloff = 5,

  -- textwidth = 72,

  -- don't annoy me to save stuff on buffer switch
  hidden = true,

  -- history = 5000,

  -- number options
  number = false,

  -- don't fold by default
  foldenable = false,

  -- indenting options
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,

  -- statuslines
  laststatus = 2,
  showtabline = 1,

  termguicolors = true,

  -- aesthetic changes
  -- guicursor = '',
  showmode = false,
  ruler = true,
  fcs = 'eob: ',
}

util.set_vars {
  -- These variables stop some default plugins for loading plugins concerned with
  -- archives, netrw and matching parentheses. Remove the lines to load the
  -- plugins normally.
  --
  -- There are more default plugins, dunno the exact vars to disable them.
  loaded_gzip = 1,
  loaded_tar = 1,
  loaded_tarPlugin = 1,
  loaded_zipPlugin = 1,
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
  loaded_matchit = 1,
  loaded_matchparen = 1,

  -- xbps installs the fzf.vim plugin alongside fzf for some reason
  loaded_fzf = 1,

  -- filetype.lua support
  did_load_filetypes = 0,
  do_filetype_lua = 1,
}

-- filetypes
vim.filetype.add {
  extension = {
    asm = 'nasm',
    zig = 'zig',
  },
}

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = [[Make files with shebang lines user executable.]],
  callback = function(table)
    local first_line = vim.api.nvim_buf_get_lines(table.buf, 0, 1, false)[1] or ''
    if string.find(first_line, "^#!%s*[^%s]") then
      local perms = vim.fn.getfperm(table.file)
      -- replace the third character with an x
      perms = ("%s%s%s"):format(perms:sub(1, 2), 'x', perms:sub(4))
      vim.fn.setfperm(table.file, perms)
    end
  end,
})
