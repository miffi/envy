vim.opt['foldmethod'] = 'expr'
vim.opt['foldexpr'] = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained', -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
  playground = {
    enable = true,
  },
}
