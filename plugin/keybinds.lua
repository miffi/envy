--- Leader binds
vim.keymap.set("n", "<leader>w", "<Cmd>up<CR>", { silent = true })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { silent = true })

-- Windowing binds made better
for _, i in ipairs { "h", "j", "k", "l" } do
    vim.keymap.set("n", "<leader>" .. i, "<c-w>" .. i)
    local up = i:upper()
    vim.keymap.set("n", "<leader>" .. up, "<c-w>" .. up)
end

-- I don't like that join moves the cursor.
vim.keymap.set("n", "J", "mzJ`z")

-- Control backspace is pretty good
vim.keymap.set({ "i", "c" }, "<c-bs>", "<c-w>")
