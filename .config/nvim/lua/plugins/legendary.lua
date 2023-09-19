return {
  {
    "mrjones2014/legendary.nvim",
    priority = 100000,
    lazy = false,
    keys = {
      { "<leader>?", "<cmd>Legendary keymaps<cr>", desc = "Toggle Legendary keymap search." },
      { "<leader>ch", "<cmd>Legendary keymaps<cr>", desc = "Toggle Legendary keymap search." },
    },
    opts = { lazy_nvim = { auto_register = true } },
  },
}
