return {
    {
        "mfussenegger/nvim-dap",
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
