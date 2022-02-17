return require('packer').startup(function()
  -- let packer maintain itself
  use 'wbthomason/packer.nvim'

  use 'dstein64/vim-startuptime'

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
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end,
  }

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plug/lsp'
    end,
    requires = {
      {
        'jose-elias-alvarez/null-ls.nvim', module = 'null-ls',
        requires = { 'nvim-lua/plenary.nvim', module_pattern = 'plenary.*' },
      },
    },
  }


  -- completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',

      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require'plug/cmp'
    end,
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require'plug/luasnip'
    end,
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim', module_pattern = 'plenary.*'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    },
    module = 'telescope',
    config = function()
      require('telescope').setup {}
      require('telescope').load_extension('fzf')
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
      { 'nvim-treesitter/playground' },
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
    requires = { 'rktjmp/lush.nvim' },
    config = function()
      vim.cmd [[colorscheme apropospriate]]
    end,
  }

  -- filetype/syntax
  use 'neovimhaskell/haskell-vim'
  use 'derekelkins/agda-vim'
end)
