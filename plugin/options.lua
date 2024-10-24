local util = require("util")

-- TODO: Revisit when https://github.com/neovim/neovim/issues/20107 is resolved
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
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    autoindent = true,
    smartindent = true,
    breakindent = true,

    -- aesthetic changes
    conceallevel = 2,
    title = true,
    -- titlestring = "%<%f %h%m%r%=%-14.(%l,%c%V%) %P",
    -- titlelen = 100,
    fillchars = "eob: ,fold: ",

    -- statuslines
    laststatus = 3,
    -- statusline = "%#WinSeparator#",
    showtabline = 1,

    cursorline = true,
    cursorlineopt = "number",

    background = "dark",
    -- guicursor = '',

    -- cmdheight = 1,
    showmode = false,
    ruler = true,

    fcs = "eob: ",

    list = true,
    listchars = "tab:» ,extends:›,precedes:‹,nbsp:·,trail:·",
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
        nasm = "nasm",
        purs = "purescript",
        dj = "djot",
    },
}

vim.diagnostic.config {
    virtual_text = true,
    underline = true,
    severity_sort = true,
    float = {
        scope = "line",
        header = "",
        source = "if_many",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "?",
            [vim.diagnostic.severity.INFO] = "ἰ",
            [vim.diagnostic.severity.HINT] = "!",
        },
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
