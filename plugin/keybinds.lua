--- Leader binds
vim.keymap.set("n", "<leader>w", "<Cmd>up<CR>", { silent = true })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { silent = true })

-- I don't like that join moves the cursor.
vim.keymap.set("n", "J", "mzJ`z")

-- Control backspace is pretty good
vim.keymap.set({ "i", "c" }, "<c-bs>", "<c-w>")

-- Paste before/after linewise
vim.keymap.set(
    { "n", "x" },
    "[p",
    [[<Cmd>exe "iput! " . v:register<CR>]],
    { desc = "Paste Above" }
)
vim.keymap.set(
    { "n", "x" },
    "]p",
    [[<Cmd>exe "iput "  . v:register<CR>]],
    { desc = "Paste Below" }
)
