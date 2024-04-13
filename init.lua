-- 0.9's experimental lua-loader
vim.loader.enable()

-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set before doing this, they will be set to the old
-- leader.
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugin", {
  change_detection = {
    notify = false,
  },
  install = {
    colorscheme = { "apropospriate" },
  },
  dev = {
    path = "~/dev",
    patterns = { "miffi" },
  },
})
