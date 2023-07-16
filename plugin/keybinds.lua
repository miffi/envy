vim.g.mapleader = " "
-- vim.g.localleader = '-'

--- Leader binds
vim.keymap.set("n", "<leader>w", "<Cmd>up<CR>", { silent = true })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Windowing binds made better
for _, i in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set("n", "<leader>" .. i, "<c-w>" .. i)
  local up = i:upper()
  vim.keymap.set("n", "<leader>" .. up, "<c-w>" .. up)
end

-- I never really found a good key for localleader, so localleader is <leader>;
vim.keymap.set("n", "<leader>;", "<localleader>", { remap = true })

-- Some of vim-unimpaired's binds, cause I don't use half of the plugin's ones
-- and I'd rather not have to depend on it.
for map, bind in pairs({ a = "", b = "b", l = "l", q = "c", t = "t" }) do
  local c = vim.api.nvim_command

  vim.keymap.set("n", "[" .. map, function()
    c(tostring(vim.v.count) .. bind .. "previous")
  end, { silent = true })

  vim.keymap.set("n", "]" .. map, function()
    c(tostring(vim.v.count) .. bind .. "next")
  end, { silent = true })

  vim.keymap.set("n", "[" .. map:upper(), function()
    c(bind .. "first")
  end, { silent = true })

  vim.keymap.set("n", "]" .. map:upper(), function()
    c(bind .. "last")
  end, { silent = true })
end
-- I haven't bound `:cpfile`, `:cnfile`, and stuff because I haven't used them
-- yet. I'll get around to that when I have used one of them at least once.

--- Misc binds
-- Some nvim version actually made Q useful
-- vim.keymap.set('n', 'Q', '<nop>')

-- I don't like that join moves the cursor.
vim.keymap.set("n", "J", "mzJ`z")

-- center search results
--[[ vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv') ]]

-- Control backspace is pretty good
vim.keymap.set({ "i", "c" }, "<c-bs>", "<c-w>")
