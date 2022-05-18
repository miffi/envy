return require('packer').startup(function()
  -- let packer maintain itself
  use { 'wbthomason/packer.nvim' }

  -- Improve load times
  -- This really helps when I have some of the heavier plugins like nvim-cmp or
  -- telescope on.
  --
  -- Remove this when https://github.com/neovim/neovim/pull/15436 gets merged.
  use {
    'lewis6991/impatient.nvim',
  }

  -- movement/quality of life
  use {
    -- comment/uncomment stuff
    'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').configure_language('c', {
        prefer_single_line_comments = true,
      })
    end,
  }
  use {
    -- some nice keybinds
    'tpope/vim-unimpaired',
    keys = { '[', ']', 'yo' },
  }

  use {
    -- configuration for the built-in lsp
    'neovim/nvim-lspconfig',
    config = function()
      require 'conf/lsp'
    end,
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
      require 'conf/cmp'
    end,
  }
  use {
    -- a lua based snippet plugin, with lsp support
    'L3MON4D3/LuaSnip',
  }

  -- telescope
  use {
    -- lua native fuzzy finder
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim', module_pattern = 'plenary.*' },
      -- implementation of the fzf algorithm in lua
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    -- module = 'telescope',
    config = function()
      require 'conf/telescope'
    end,
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'conf/treesitter'
    end,
    requires = {
      -- some convenience functionality for treesitter
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
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
    filetype = { 'tex', 'bib' },
    setup = function()
      require('util').set_vars {
        tex_flavor = 'latex',
        vimtex_view_method = 'zathura',
      }
    end,
  }

  use {
    '~/prog/apropospriate.nvim',
    config = function()
      vim.o.background = 'dark'
      vim.api.nvim_command 'colorscheme apropospriate'
    end,
  }

  -- filetype/syntax
  -- use 'neovimhaskell/haskell-vim'
  -- use 'derekelkins/agda-vim'
  -- use 'kmonad/kmonad-vim'
  use { 'gpanders/editorconfig.nvim' }

  --
  -- miscellaneous
  --
  -- measuring startup time
  use { 'dstein64/vim-startuptime' }

  use {
    'TimUntersberger/neogit',
    module = 'neogit',
    cmd = 'Neogit',
    requires = { 'nvim-lua/plenary.nvim', module_pattern = 'plenary.*' },
  }
end)
