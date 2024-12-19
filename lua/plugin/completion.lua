return {
  {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.*',

    opts = {
      keymap = {
        preset = "default",

        ['<Tab>'] = {},
        ['<S-Tab>'] = {},

        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
      },

      appearance = {
        -- use_nvim_cmp_as_default = true,
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- optionally disable cmdline completions
        -- cmdline = {},
      },

      completion = {
        menu = {
          draw = {
            columns = { { 'label', 'label_description', gap = 1, 'kind' }, },
          },
          components = {
            label_description = { width = { fill = true } },
          }
        },
      },

      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  },
}
