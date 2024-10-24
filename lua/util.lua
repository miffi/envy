local util = {}

vim.cmd([[
function OpenMarkdownPreview (url)
  execute "silent ! firefox --new-window " . a:url
endfunction
]])

function util.set_vars(tbl)
    for var, value in pairs(tbl) do
        vim.g[var] = value
    end
end

function util.set_options(tbl)
    for var, value in pairs(tbl) do
        vim.o[var] = value
    end
end

function util.set_local_options(tbl)
    for var, value in pairs(tbl) do
        vim.bo[var] = value
    end
end

return util
