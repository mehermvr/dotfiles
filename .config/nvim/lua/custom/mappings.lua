---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
    ["<leader>tx"] = {
      function()
        require("base46").toggle_theme()
      end,
      "Toggle theme",
    },
  },
}

-- more keybinds!

return M
