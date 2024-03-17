return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit

  ft = "markdown",
  cmd = { "ObsidianNew", "ObsidianToday", "ObsidianSearch", "ObsidianWorkspace" },

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/docs/vaults/personal",
      },
    },

    daily_notes = {
      folder = "notes/dailies",
    },

    new_notes_location = "notes_subdir",

    ui = {
      checkboxes = {
        [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        ["x"] = { char = "✔", hl_group = "ObsidianDone" },
        [">"] = { char = ">", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "~", hl_group = "ObsidianTilde" },
      },

      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    }
  },
}
