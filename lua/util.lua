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

return util
