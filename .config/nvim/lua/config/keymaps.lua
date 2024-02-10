-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- SUPREMELY UGLY. because legendary cant read keymaps set in LazyVim's config
-- vim.keyamp.set, i have to del and reset with legendary. patching LazyVim may
-- be an option but didnt work when i tested briefly. TODO for later
local Util = require("lazy.core.util")

local function toggle(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    return Util.info("Set " .. option .. " to " .. vim.opt_local[option]:get(), { title = "Option" })
  end
  vim.opt_local[option] = not vim.opt_local[option]:get()
  if not silent then
    if vim.opt_local[option]:get() then
      Util.info("Enabled " .. option, { title = "Option" })
    else
      Util.warn("Disabled " .. option, { title = "Option" })
    end
  end
end

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  local new_keymap = { lhs, rhs, mode = mode, opts = opts }
  require("legendary").keymap(new_keymap)
end

vim.keymap.del("n", "<leader>uw")
map("n", "<leader>uw", function()
  toggle("wrap")
end, { desc = "Toggle Word Wrap" })
