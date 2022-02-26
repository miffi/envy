local M = {}

function M.set_vars(tbl)
  for var, value in pairs(tbl) do
    vim.g[var] = value
  end
end

function M.set_options(tbl)
  for var, value in pairs(tbl) do
    vim.opt[var] = value
  end
end

-- nabbed from https://github.com/L3MON4D3/Luasnip/issues/1#issuecomment-835241958
-- Loads a library if it exists.
function M.prequire(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

-- Some experiment at making a generalised mapping system.
-- This is now defunct as I use nest.nvim now.
--[[ function M.formatbind(modes, left, right, vals, remap)
  local bind
  if remap then
    bind = require('vimp').rbind
  else
    bind = require('vimp').bind
  end

  for _, i in ipairs(vals) do
    local _left, _right
    if type(i) == 'string' then
      _left = left:format(i)
      _right = right:format(i)
    else
      _left = left:format(unpack(i))
      _right = right:format(unpack(i))
    end
    bind(modes, _left, _right)
  end
end ]]

-- Nabbed from https://stackoverflow.com/a/37040415
--
-- This is useful for finding the sytax group under the cursor, and any group
-- it's linked with. It does not work on treesitter highlights though. Use
-- :TSHighlightCapturesUnderCursor from https://github.com/nvim-treesitter/playground for that.
function M.syntax_group()
  local s = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
  print(vim.inspect(s))
  return print(vim.fn.synIDattr(s, 'name') .. ' -> ' .. vim.fn.synIDattr(vim.fn.synIDtrans(s), 'name'))
end

return M
