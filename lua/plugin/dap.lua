return {
  {
    "mfussenegger/nvim-dap",

    dependencies = {
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          require("dap-python").setup("/usr/bin/python3")
        end,
      },
    },

    config = function()
      local dap = require("dap")
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode-17", -- adjust as needed, must be absolute path
        name = "lldb",
      }
    end,
  },
}
