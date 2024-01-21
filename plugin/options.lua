local util = require("util")

util.set_options({
  foldmethod = "expr",
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldtext = "v:lua.vim.treesitter.foldtext()",
  shortmess = vim.o.shortmess .. "I",

  -- completion options
  completeopt = "menu,menuone,noselect",
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

  mouse = "",

  -- number options
  number = true,
  relativenumber = true,
  signcolumn = "yes",
  conceallevel = 2,

  -- don't fold by default
  foldenable = false,

  -- indenting options
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,

  -- aesthetic changes
  title = true,
  titlestring = "%<%f %h%m%r%=%-14.(%l,%c%V%) %P",
  titlelen = 100,

  -- statuslines
  laststatus = 0,
  showtabline = 1,

  -- On by default from 0.10
  -- termguicolors = true,

  cursorline = true,
  cursorlineopt = "number",

  background = "dark",
  -- guicursor = '',

  cmdheight = 0,
  showmode = false,
  ruler = false,

  fcs = "eob: ",
})

util.set_vars({
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
  -- loaded_matchparen = 1,

  -- xbps installs the fzf.vim plugin alongside fzf for some reason
  loaded_fzf = 1,
})

-- filetypes
vim.filetype.add({
  extension = {
    zig = "zig",
    nasm = "nasm",
  },
})

local severity = {
  { name = "Error", icon = "✘" },
  { name = "Warn", icon = "?" },
  { name = "Info", icon = "ἰ" },
  { name = "Hint", icon = "!" },
  { name = "Ok", icon = "✔" },
}

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  severity_sort = true,
  float = {
    scope = "line",
    header = false,
    source = "if_many",
    prefix = function(diagnostic, _, _)
      local sev = severity[diagnostic.severity] or severity[5]
      return sev["icon"] .. " ", "Diagnostic" .. sev["name"]
    end,
  },
})

for _, entry in ipairs(severity) do
  vim.fn.sign_define(
    "DiagnosticSign" .. entry["name"],
    { text = entry["icon"], texthl = "Diagnostic" .. entry["name"] }
  )
end
