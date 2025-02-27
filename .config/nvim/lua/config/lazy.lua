-- Bootstrap lazy.nvim because we start from nothing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- setup options before we start configuring plugins
require("config.options")

-- Setup lazy.nvim and import the rest along with
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  -- this is the colorscheme used during install. not the final colorscheme
  install = { colorscheme = { "retrobox" } },
  checker = { enabled = false, notify = false },
  -- disable runtime plugins. i think these come from nvim by default. the following selection is lazy.nvim's defaults, but there's a few more
  performance = { rtp = { disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" } } },
})

-- load keymaps after plugins
require("config.keymaps")
-- and then some commands
require("config.commands")
