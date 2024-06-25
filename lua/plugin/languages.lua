vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    require("cmp").setup.buffer {
      sources = { { name = "vim-dadbod-completion" } },
    }
  end,
})

return {
  {
    "lervag/vimtex",
    init = function()
      require("util").set_vars {
        tex_flavor = "latex",
        vimtex_view_method = "sioyek",
      }
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_combine_preview = 1
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = true,
      },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = function()
        -- Update this path
        local extension_path = vim.env.HOME .. "/opt/vscode-lldb/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb"
        local this_os = vim.uv.os_uname().sysname

        -- The path is different on Windows
        if this_os:find("Windows") then
          codelldb_path = extension_path .. "adapter\\codelldb.exe"
          liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
        else
          -- The liblldb extension is .so for Linux and .dylib for MacOS
          liblldb_path = liblldb_path
            .. (this_os == "Linux" and ".so" or ".dylib")
        end

        local cfg = require("rustaceanvim.config")
        return {
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
          },
        }
      end
    end,
  },

  { "folke/neodev.nvim", opts = {} },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
}
