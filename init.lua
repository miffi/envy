pcall(require, 'impatient')

-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set before doing this, they will be set to the old
-- leader.
--
-- Idea taken from T.J. Devries's config
vim.g.mapleader = ' '

-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(function()
  require 'plugins'
end, 0)
