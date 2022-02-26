vim.g.mapleader = ' '
vim.g.localleader = '-'

require('nest').applyKeymaps {
  { '<leader>', {
    { '<leader>', '<cmd>b#<cr>' },
    { 'w', '<cmd>up<cr>' },

    -- Windowing binds made better
    { 'h', '<c-w>h' },
    { 'j', '<c-w>j' },
    { 'k', '<c-w>k' },
    { 'l', '<c-w>l' },

    { 'H', '<c-w>H' },
    { 'J', '<c-w>J' },
    { 'K', '<c-w>K' },
    { 'L', '<c-w>L' },

    { options = { noremap = false }, {
      -- I never really found a good key for localleader, so localleader is
      -- <leader>;
      { ';', '<localleader>' },

      -- Separated global clipboard
      { mode = 'nv', {
        {'y', '"+y'},
        {'d', '"+d'},
        {'p', '"+p'},
        {'P', '"+P'},
      }},
    }},
  }},

  -- Turn the ex mode bind to something mildly useful
  { 'Q', 'q:' },

  -- I don't like how join moves the cursor.
  { 'J', 'mzJ`z' },

  -- center search results
  { 'n' , 'nzzzv' },
  { 'N' , 'Nzzzv' },

  -- Control backspace is pretty good
  { '' , '<c-w>', mode = 'ic' },
}
