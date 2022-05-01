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
  ruler = false,
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

  -- filetype.lua support
  did_load_filetypes = 0,
  do_filetype_lua = 1,
}

-- filetypes
vim.filetype.add({
  extension = {
    asm = "nasm",
    zig = "zig",
  },
})
