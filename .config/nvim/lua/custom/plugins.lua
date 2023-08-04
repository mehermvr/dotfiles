local overrides = require "custom.configs.overrides"

-- format & linting
---@type NvPluginSpec[]
local null_ls = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      { "lukas-reineke/lsp-format.nvim" },
    },
    config = function()
      require "custom.configs.null-ls"
    end,
  },
}
---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = null_ls,
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
}

return plugins
