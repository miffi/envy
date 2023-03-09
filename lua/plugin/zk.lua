return {
  'mickael-menu/zk-nvim',
  name = 'zk',
  opts = { picker = 'telescope' },
  keys = {
    -- Create a new note after asking for its title.
    { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", },

    -- Open notes.
    { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", },
    -- Open notes associated with the selected tags.
    { "<leader>zt", "<Cmd>ZkTags<CR>", },

    -- Search for the notes matching a given query.
    { "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", },
    -- Search for the notes matching the current visual selection.
    { "<leader>zf", ":'<,'>ZkMatch<CR>", mode = 'v' },
  },
}
