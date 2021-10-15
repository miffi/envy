local packer_install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'

local execute = vim.api.nvim_command
local fn = vim.fn
if fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    packer_install_path,
  }
  vim.cmd [[
  packadd packer.nvim
  :PackerSync
  ]]
end
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- let packer maintain itself
  use { 'wbthomason/packer.nvim', opt = true }

  use {
    'tweekmonster/startuptime.vim',
    cmd = 'StartupTime',
  }

  -- movement/quality of life
  use {
    'b3nj5m1n/kommentary',
    keys = 'gc',
  }
  use 'tpope/vim-eunuch'
  use {
    'tpope/vim-unimpaired',
    keys = { '[', ']', 'yo' },
  }
  use {
    'machakann/vim-sandwich',
    keys = {
      'sa',
      'sr',
      'sd',
      { 'o', 'ib' },
      { 'o', 'is' },
      { 'o', 'ab' },
      { 'o', 'as' },
    },
  }

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plug/lsp'
    end,
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      -- 'hrsh7th/cmp-buffer',
    },
    config = function()
      local cmp = require 'cmp'

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },

          -- { name = 'buffer' },
        },
      }
    end,
  }
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require 'plug/completion'
    end,
  }

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'plug/treesitter'
    end,
  }
  use {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
  }

  -- nvim config
  use 'svermeulen/vimpeccable'
  -- use 'editorconfig/editorconfig-vim'

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

  -- lean

  -- filetype/syntax
  use 'neovimhaskell/haskell-vim'
  use 'derekelkins/agda-vim'

  -- aesthetic
  use {
    'norcalli/nvim-base16.lua',
    config = function()
      local base16 = require 'base16'
      base16(base16.themes.circus, true)
    end,
  }

  -- fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    keys = '<leader>e',
    config = function()
      require 'plug/telescope'
    end,
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',

      'nvim-telescope/telescope-fzy-native.nvim',
    },
  }

  -- better gitting
  use {
    'TimUntersberger/neogit',
    module = 'neogit',
    cmd = 'Neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup {}
    end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    disable = true,
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }
end)
