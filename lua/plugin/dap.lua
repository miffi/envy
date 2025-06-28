return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = {
                    "--interpreter=dap",
                    "--eval-command",
                    "set print pretty on",
                },
            }
            dap.adapters.lldb = {
                type = "executable",
                command = "/usr/bin/lldb-dap-19", -- adjust as needed, must be absolute path
                name = "lldb",
            }
        end,
    },
}
