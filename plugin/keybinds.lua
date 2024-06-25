--- Leader binds
vim.keymap.set("n", "<leader>w", "<Cmd>up<CR>", { silent = true })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { silent = true })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { silent = true })

-- Windowing binds made better
for _, i in ipairs { "h", "j", "k", "l" } do
  vim.keymap.set("n", "<leader>" .. i, "<c-w>" .. i)
  local up = i:upper()
  vim.keymap.set("n", "<leader>" .. up, "<c-w>" .. up)
end

--- Taken from https://github.com/neovim/neovim/pull/28525
--- TODO: Remove when above pull request is merged
--- vim-unimpaired style mappings. See: https://github.com/tpope/vim-unimpaired
do
  -- Quickfix mappings
  vim.keymap.set("n", "[q", function()
    vim.cmd.cprevious { count = vim.v.count1 }
  end, {
    desc = ":cprevious",
  })

  vim.keymap.set("n", "]q", function()
    vim.cmd.cnext { count = vim.v.count1 }
  end, {
    desc = ":cnext",
  })

  vim.keymap.set("n", "[Q", function()
    vim.cmd.crewind { args = vim.v.count ~= 0 and { vim.v.count } or nil }
  end, {
    desc = ":crewind",
  })

  vim.keymap.set("n", "]Q", function()
    vim.cmd.clast { args = vim.v.count ~= 0 and { vim.v.count } or nil }
  end, {
    desc = ":clast",
  })

  vim.keymap.set("n", "[<C-Q>", function()
    vim.cmd.cpfile { count = vim.v.count1 }
  end, {
    desc = ":cpfile",
  })

  vim.keymap.set("n", "]<C-Q>", function()
    vim.cmd.cnfile { count = vim.v.count1 }
  end, {
    desc = ":cnfile",
  })

  -- Location list mappings
  vim.keymap.set("n", "[l", function()
    vim.cmd.lprevious { count = vim.v.count1 }
  end, {
    desc = ":lprevious",
  })

  vim.keymap.set("n", "]l", function()
    vim.cmd.lnext { count = vim.v.count1 }
  end, {
    desc = ":lnext",
  })

  vim.keymap.set("n", "[L", function()
    vim.cmd.lrewind { args = vim.v.count ~= 0 and { vim.v.count } or nil }
  end, {
    desc = ":lrewind",
  })

  vim.keymap.set("n", "]L", function()
    vim.cmd.llast { args = vim.v.count ~= 0 and { vim.v.count } or nil }
  end, {
    desc = ":llast",
  })

  vim.keymap.set("n", "[<C-L>", function()
    vim.cmd.lpfile { count = vim.v.count1 }
  end, {
    desc = ":lpfile",
  })

  vim.keymap.set("n", "]<C-L>", function()
    vim.cmd.lnfile { count = vim.v.count1 }
  end, {
    desc = ":lnfile",
  })

  -- Argument list
  vim.keymap.set("n", "[a", function()
    vim.cmd.previous { count = vim.v.count1 }
  end, {
    desc = ":previous",
  })

  vim.keymap.set("n", "]a", function()
    vim.cmd.next { count = vim.v.count1 }
  end, {
    desc = ":next",
  })

  vim.keymap.set("n", "[A", function()
    if vim.v.count ~= 0 then
      vim.cmd.argument { count = vim.v.count }
    else
      vim.cmd.rewind()
    end
  end, {
    desc = ":rewind",
  })

  vim.keymap.set("n", "]A", function()
    if vim.v.count ~= 0 then
      vim.cmd.argument { count = vim.v.count }
    else
      vim.cmd.last()
    end
  end, {
    desc = ":last",
  })

  -- Tags
  vim.keymap.set("n", "[t", function()
    vim.cmd.tprevious { count = vim.v.count1 }
  end, { desc = ":tprevious" })

  vim.keymap.set("n", "]t", function()
    vim.cmd.tnext { count = vim.v.count1 }
  end, { desc = ":tnext" })

  vim.keymap.set("n", "[T", function()
    vim.cmd.trewind { count = vim.v.count ~= 0 and vim.v.count or nil }
  end, { desc = ":trewind" })

  vim.keymap.set("n", "]T", function()
    -- :tlast does not accept a count, so use :trewind if count given
    if vim.v.count ~= 0 then
      vim.cmd.trewind { count = vim.v.count }
    else
      vim.cmd.tlast()
    end
  end, { desc = ":tlast" })

  vim.keymap.set("n", "[<C-T>", function()
    vim.cmd.ptprevious { count = vim.v.count1 }
  end, { desc = " :ptprevious" })

  vim.keymap.set("n", "]<C-T>", function()
    vim.cmd.ptnext { count = vim.v.count1 }
  end, { desc = ":ptnext" })

  -- Buffers
  vim.keymap.set("n", "[b", function()
    vim.cmd.bprevious { count = vim.v.count1 }
  end, { desc = ":bprevious" })

  vim.keymap.set("n", "]b", function()
    vim.cmd.bnext { count = vim.v.count1 }
  end, { desc = ":bnext" })

  vim.keymap.set("n", "[B", function()
    if vim.v.count ~= 0 then
      vim.cmd.buffer { count = vim.v.count }
    else
      vim.cmd.brewind()
    end
  end, { desc = ":brewind" })

  vim.keymap.set("n", "]B", function()
    if vim.v.count ~= 0 then
      vim.cmd.buffer { count = vim.v.count }
    else
      vim.cmd.blast()
    end
  end, { desc = ":blast" })
end

-- I don't like that join moves the cursor.
vim.keymap.set("n", "J", "mzJ`z")

-- center search results
--[[ vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv') ]]

-- Control backspace is pretty good
vim.keymap.set({ "i", "c" }, "<c-bs>", "<c-w>")
