return require('packer').startup(function()
  -- let packer maintain itself
  use 'wbthomason/packer.nvim'


  -- keybind management plugin
  use 'lionC/nest.nvim'


  -- movement/quality of life
  use {
    -- comment/uncomment stuff
    'b3nj5m1n/kommentary',
    keys = 'gc',
  }
  use {
    -- some nice keybinds
    'tpope/vim-unimpaired',
    keys = { '[', ']', 'yo' },
  }
  use {
    -- automatically pair braces, parens, etc.
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end,
  }


  use {
    -- configuration for the built-in lsp
    'neovim/nvim-lspconfig',
    config = function()
      require 'plug/lsp'
    end,
    requires = {
      {
        -- null-ls is a kinda ad-hoc way to hook non-lsp processes onto nvim's
        -- lsp system
        'jose-elias-alvarez/null-ls.nvim', module = 'null-ls',
        requires = { 'nvim-lua/plenary.nvim', module_pattern = 'plenary.*' },
      },
    },
  }

  use {
    -- the best completion plugin around
    'hrsh7th/nvim-cmp',
    requires = {
      -- sources
      -- lsp source
      'hrsh7th/cmp-nvim-lsp',

      -- snippet integration
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require'plug/cmp'
    end,
  }
  use {
    -- a lua based snippet plugin, with lsp support
    'L3MON4D3/LuaSnip',
    config = function()
      require'plug/luasnip'
    end,
  }

  -- telescope
  use {
    -- lua native fuzzy finder
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim', module_pattern = 'plenary.*'},
      -- implementation of the fzf algorithm in lua
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    },
    module = 'telescope',
    config = function()
      require('telescope').setup {}
      require('telescope').load_extension('fzf')
    end,
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'plug/treesitter'
    end,
    requires = {
      -- some convenience functionality for treesitter
      { 'nvim-treesitter/playground' },
    },
  }

  -- lisp
  use {
    -- a really good solution to paren handling
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
    -- a port of the emacs colorscheme I like
    -- repo is at https://github.com/miffi/apropospriate.nvim
    '~/prog/apropospriate.nvim',
    requires = { 'rktjmp/lush.nvim' },
    config = function()
      vim.cmd [[colorscheme apropospriate]]
    end,
  }

  -- filetype/syntax
  use 'neovimhaskell/haskell-vim'
  use 'derekelkins/agda-vim'

  --
  -- miscellaneous
  --
  -- measuring startup time
  use 'dstein64/vim-startuptime'

  use {
    -- streamlining coding competitions
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim',
    config = function() require'competitest'.setup() end
  }
end)
