vim.opt['foldmethod'] = 'expr'
vim.opt['foldexpr'] = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'rust', 'lua', 'comment' }, -- 'all' or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension

    -- Treesitter doesn't have @Spell support, which is ass. `'spell'` tags
    -- every function as a misspelling.
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/698
    --
    -- There's spellsitter.nvim, but it's a hack, calling `syntax` under the
    -- hood to emulate the functionality. Additionally, for some reason, it has
    -- a huge lag spike (3-4 seconds) for me every time I open a treesitter
    -- highlighted buffer so I'm not going to be using that.

    -- I'm gonna run with the vimtex highlight for now. Treesitter's
    -- highlighting is useable, but there's some functionality missing. I'll
    -- maybe try to make a new plugin to fill that in.
    disable = { 'latex' },
  },
  indent = {
    enable = true,
  },
  playground = {
    enable = true,
  },

  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}
