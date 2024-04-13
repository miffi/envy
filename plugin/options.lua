local util = require("util")

util.set_options {
  shortmess = vim.o.shortmess .. "I",

  -- completion options
  completeopt = "menu,menuone,noselect",
  pumheight = 20,

  undofile = true,

  -- make wildmode conversion more like readline
  wildmode = "longest:full,full",

  -- search options
  ignorecase = true,
  smartcase = true,
  -- incsearch = true, -- true by default
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

  -- indenting options
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,
  breakindent = true,

  -- aesthetic changes
  conceallevel = 2,
  title = true,
  titlestring = "%<%f %h%m%r%=%-14.(%l,%c%V%) %P",
  titlelen = 100,
  fillchars = "eob: ,fold: ",

  -- statuslines
  laststatus = 3,
  statusline = "%#WinSeparator#",
  showtabline = 1,

  cursorline = true,
  cursorlineopt = "number",

  background = "dark",
  -- guicursor = '',

  cmdheight = 0,
  showmode = false,
  ruler = false,

  fcs = "eob: ",
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
  -- loaded_matchparen = 1,

  -- xbps installs the fzf.vim plugin alongside fzf for some reason
  loaded_fzf = 1,
}

-- filetypes
vim.filetype.add {
  extension = {
    zig = "zig",
    nasm = "nasm",
  },
}

local severity = {
  { name = "Error", icon = "✘" },
  { name = "Warn", icon = "?" },
  { name = "Info", icon = "ἰ" },
  { name = "Hint", icon = "!" },
  { name = "Ok", icon = "✔" },
}

vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  severity_sort = true,
  float = {
    scope = "line",
    header = "",
    source = "if_many",
    prefix = function(diagnostic, _, _)
      local sev = severity[diagnostic.severity] or severity[5]
      return sev["icon"] .. " ", "Diagnostic" .. sev["name"]
    end,
  },
}

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      higroup = "StatusLineNC",
      timeout = 200,
    }
  end,
})

for _, entry in ipairs(severity) do
  vim.fn.sign_define(
    "DiagnosticSign" .. entry["name"],
    { text = entry["icon"], texthl = "Diagnostic" .. entry["name"] }
  )
end
