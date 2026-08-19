require('vim._core.ui2').enable {
  enable = true,
  msg = {
    targets = 'msg',
  },
}

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if kind == 'install' or kind == 'update' then
      if name == 'parinfer-rust' then
	vim.system({ 'cargo', 'build', '--release' }, { cwd = ev.data.path })
      end

      if name == 'blink.cmp' then
	if not ev.data.active then
	  vim.cmd.packadd('blink.lib')
	  vim.cmd.packadd('blink.cmp')
	  local cmp = require('blink.cmp')
	  cmp.build():pwait()
	end
      end
    end

  end
})

vim.pack.add {
  { src = "https://github.com/eraserhd/parinfer-rust" },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/saghen/blink.lib' },
  { src = 'https://github.com/saghen/blink.cmp' },
  { src = 'https://github.com/chomosuke/typst-preview.nvim', version = vim.version.range("1.*") },
  { src = "https://github.com/zenbones-theme/zenbones.nvim" },
}

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 8
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.signcolumn = 'yes'

vim.o.cmdheight = 0
vim.o.background = 'light'
vim.g.zenbones_compat = 1
vim.cmd.colorscheme "zenbones"
vim.api.nvim_create_autocmd({'TextYankPost'}, {
  callback = function(ev)
    vim.hl.hl_op { higroup='Visual', timeout=300 }
  end,
})
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'
vim.o.cursorcolumn = true

vim.keymap.set('!', '<C-BS>', '<C-W>')

vim.lsp.enable {
  'clangd',
  'markdown_oxide',
  'rust_analyzer',
  'terraformls',
  'zls',
}
vim.lsp.codelens.enable(true)
vim.lsp.inlay_hint.enable(true)

require('blink.cmp').setup({
  completion = {
    menu = {
      draw = {
	columns = { { 'label', 'label_description', gap = 1 }, { 'kind' } }
      }
    }
  }
})
