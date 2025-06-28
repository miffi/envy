return {
    {
        "saghen/blink.cmp",
        lazy = false,
        dependencies = "rafamadriz/friendly-snippets",

        version = "1.*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",

                ["<Tab>"] = {},
                ["<S-Tab>"] = {},

                ["<C-l>"] = { "snippet_forward", "fallback" },
                ["<C-h>"] = { "snippet_backward", "fallback" },
            },

            appearance = {},

            sources = {
                default = { "lsp", "path", "snippets" },
            },

            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 2, "kind" },
                        },
                    },
                },
            },

            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
}
