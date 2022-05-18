vim.g.mapleader = ' '
-- vim.g.localleader = '-'

--- Leader binds
vim.keymap.set('n', '<leader>w', '<cmd>up<cr>', { silent = true })

-- Windowing binds made better
for _, i in ipairs { 'h', 'j', 'k', 'l' } do
  vim.keymap.set('n', '<leader>' .. i, '<c-w>' .. i)
  local up = i:upper()
  vim.keymap.set('n', '<leader>' .. up, '<c-w>' .. up)
end

-- I never really found a good key for localleader, so localleader is <leader>;
vim.keymap.set('n', '<leader>;', '<localleader>', { remap = true })

-- Separated global clipboard
for _, i in ipairs { 'd', 'c', 'p', 'P' } do
  vim.keymap.set({ 'n', 'v' }, '<leader>' .. i, '"+' .. i, { remap = true })
end

--- Misc binds
-- Turn the ex mode bind to something mildly useful
vim.keymap.set('n', 'Q', 'qq')

-- I don't like how join moves the cursor.
vim.keymap.set('n', 'J', 'mzJ`z')

-- center search results
--[[ vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv') ]]

-- Control backspace is pretty good
vim.keymap.set({ 'i', 'c' }, '', '<c-w>')
