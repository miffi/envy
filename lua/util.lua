local util = {}

function util.set_vars(tbl)
  for var, value in pairs(tbl) do
    vim.g[var] = value
  end
end

function util.set_options(tbl)
  for var, value in pairs(tbl) do
    vim.opt[var] = value
  end
end

function util.set_local_options(tbl)
  for var, value in pairs(tbl) do
    vim.opt_local[var] = value
  end
end

-- Nabbed from https://stackoverflow.com/a/37040415
--
-- This is useful for finding the sytax group under the cursor, and any group
-- it's linked with. It does not work on treesitter highlights though. Use
-- :TSHighlightCapturesUnderCursor from https://github.com/nvim-treesitter/playground for that.
function util.syntax_group()
  local s = vim.fn.synID(vim.fn.line '.', vim.fn.col '.', 1)
  print(vim.inspect(s))
  return print(vim.fn.synIDattr(s, 'name') .. ' -> ' .. vim.fn.synIDattr(vim.fn.synIDtrans(s), 'name'))
end

return util
