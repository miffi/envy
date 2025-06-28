-- 0.9's experimental lua-loader
vim.loader.enable()
-- 0.12's experimental ui
require("vim._extui").enable {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set before doing this, they will be set to the old
-- leader.
vim.g.mapleader = " "
vim.g.maplocalleader = "<tab>"

require("lazy").setup("plugin", {
    change_detection = {
        notify = false,
    },
    install = {
        colorscheme = { "catppuccin-latte" },
    },
    dev = {
        path = "~/dev",
        patterns = { "miffi" },
    },
    {
        ui = {
            icons = {
                cmd = "⌘",
                config = "🛠",
                event = "📅",
                ft = "📂",
                init = "⚙",
                keys = "🗝",
                plugin = "🔌",
                runtime = "💻",
                require = "🌙",
                source = "📄",
                start = "🚀",
                task = "📌",
                lazy = "💤 ",
            },
        },
    },
})

-- require("vim._extui").enable {
--     enable = true, -- Whether to enable or disable the UI.
--     msg = { -- Options related to the message module.
--         ---@type 'cmd'|'msg' Where to place regular messages, either in the
--         ---cmdline or in a separate ephemeral message window.
--         target = "cmd",
--         timeout = 4000, -- Time a message is visible in the message window.
--     },
-- }
