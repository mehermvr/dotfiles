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

M.disabled = {
  n = {
    ["<C-n>"] = "",
  },
  x = {
    ["p"] = "",
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<A-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.yanky = {
  n = {
    ["p"] = { "<Plug>(YankyPutAfter)", "put after" },
    ["P"] = { "<Plug>(YankyPutBefore)", "put before" },
    ["gp"] = { "<Plug>(YankyGPutAfter)", "put after and move cursor" },
    ["gP"] = { "<Plug>(YankyGPutBefore)", "put before and move cursor" },
    ["<C-n>"] = { "<Plug>(YankyCycleForward)", "Cycle forward in yank-ring" },
    ["<C-p>"] = { "<Plug>(YankyCycleBackward)", "Cycle backward in yank-ring" },
  },
  x = {
    ["p"] = { "<Plug>(YankyPutAfter)" },
    ["P"] = { "<Plug>(YankyPutBefore)" },
    ["gp"] = { "<Plug>(YankyGPutAfter)" },
    ["gP"] = { "<Plug>(YankyGPutBefore)" },
  },
}

return M
