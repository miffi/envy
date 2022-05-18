-- Hello! Welcome to my init.lua.

require 'impatient'

-- Order of the `require`s matter. If the keybinds are after
-- options and there's an error in options, the evaluation
-- stops there and you're stuck without your keybinds. :(
require 'keybinds'
require 'options'

-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(function()
  require 'plugins'
end, 0)
