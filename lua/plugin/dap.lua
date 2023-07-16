return {
  {
    "mfussenegger/nvim-dap",

    config = function()
      local dap = require("dap")
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode-15", -- adjust as needed, must be absolute path
        name = "lldb",
      }

      dap.configurations.rust = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    main = "dapui",
    config = true,
  },
}
