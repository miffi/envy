local vimp = require 'vimp'
local util = require 'util'

vim.g.mapleader = ' '
vim.g.localleader = '-'

-- I never really found a good key for localleader
vimp.nmap('<leader>;', '<localleader>')

vimp.nnoremap('J', 'mzJ`z')

vimp.nnoremap('Q', 'q:')

-- D = d$ and C = c$ ... but Y = yy ?!
-- This is default in master now
-- vimp.nnoremap('Y', 'y$')

-- Convenience functions
vimp.nnoremap('<leader>w', [[:up<cr>]])

-- Control backspace is pretty good
vimp.bind('ic', '', '<c-w>')

-- Make searching not nauseating
util.formatbind('n', '%s', '%szzzv', { 'n', 'N' })

-- Some convenient brace expanding commands
-- <c-c> leaves insert mode without trigerring InsertLeave
util.formatbind('i', ';%sb', '{<cr>}%s<c-c>O', { '', ',', ';' })

-- Easy to reach seperated system clipboard
util.formatbind('nv', '<leader>%s', '"+%s', { 'y', 'd', 'p', 'P' })

-- Default bindings for window manipulation are pretty bad ngl
util.formatbind('n', '<leader>%s', '<c-w>%s', { 'h', 'j', 'k', 'l', 'H', 'J', 'K', 'L' })
