return {
    {
        "saghen/blink.cmp",
        lazy = false,
        dependencies = "rafamadriz/friendly-snippets",

        version = "v0.*",

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
                -- optionally disable cmdline completions
                -- cmdline = {},
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
