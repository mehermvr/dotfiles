return {
  {
    "mrjones2014/legendary.nvim",
    priority = 100000,
    lazy = false,
    keys = {
      { "<leader>?", "<cmd>Legendary keymaps<cr>", desc = "Toggle Legendary keymap search." },
      { "<leader>ch", "<cmd>Legendary keymaps<cr>", desc = "Toggle Legendary keymap search." },
    },
    opts = {
      extensions = {
        lazy_nvim = { auto_register = true },
        which_key = { auto_register = true, do_binding = false, use_groups = true },
      },
    },
  },
}
