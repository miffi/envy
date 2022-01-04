return require('packer').startup(function()
  -- let packer maintain itself
  use 'wbthomason/packer.nvim'

  -- keybind management plugin
  use 'lionC/nest.nvim'

  -- movement/quality of life
  use {
    'b3nj5m1n/kommentary',
    keys = 'gc',
  }
  use {
    'tpope/vim-unimpaired',
    keys = { '[', ']', 'yo' },
  }

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plug/lsp'
    end,
  }

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'plug/treesitter'
    end,
    requires = {
      'nvim-treesitter/playground',
      cmd = 'TSPlaygroundToggle',
    },
  }

  -- lisp
  use {
    'eraserhd/parinfer-rust',
    run = 'cargo build --release',
  }

  -- latex
  use {
    'lervag/vimtex',
    filetype = 'tex',
    config = function()
      require('util').set_vars {
        tex_flavor = 'latex',
        vimtex_view_method = 'zathura',
        vimtex_quickfix_mode = '0',
      }
    end,
  }

  -- colorscheme
  use {
    '~/prog/apropospriate.nvim',
    requires={'rktjmp/lush.nvim'},
    config = function()
      vim.cmd[[colorscheme apropospriate]]
    end
  }

  -- filetype/syntax
  use 'neovimhaskell/haskell-vim'
  use 'derekelkins/agda-vim'
end)
