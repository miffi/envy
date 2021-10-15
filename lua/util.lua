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

function M.formatbind(modes, left, right, vals, remap)
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
end

return M
