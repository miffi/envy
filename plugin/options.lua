local util = require 'util'

util.set_options {
  foldmethod = 'marker',
  shortmess = vim.o.shortmess .. 'I',

  -- completion options
  completeopt = 'menu,menuone,noselect',
  pumheight = 20,

  -- make wildmode conversion more like readline
  wildmode = "longest:full,full",

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

  mouse = '',

  -- number options
  number = true,
  relativenumber = true,

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
  cursorline = true,
  cursorlineopt = 'number',

  background = 'dark';
  -- guicursor = '',

  cmdheight = 1, -- cmdheight = 0 is still kinda busted for v0.8.0
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
  -- loaded_netrw = 1,
  loaded_netrwPlugin = 1,
  loaded_matchit = 1,
  loaded_matchparen = 1,

  -- xbps installs the fzf.vim plugin alongside fzf for some reason
  loaded_fzf = 1,
}

-- filetypes
vim.filetype.add {
  extension = {
    -- asm = 'nasm',
    zig = 'zig',
    sway = 'swayconfig',
  },
}

vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false,
}
