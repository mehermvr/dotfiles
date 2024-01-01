return {
  { import = "lazyvim.plugins.extras.coding.yanky" },
  {
    "gbprod/yanky.nvim",
    keys = {
      -- disable default cycle keymaps
      { "[y", false },
      { "]y", false },
      -- redo cycle keymaps
      { "[[", "<Plug>(YankyCycleForward)", desc = "Yanky - Cycle forward through yank history" },
      { "]]", "<Plug>(YankyCycleBackward)", desc = "Yanky - Cycle backward through yank history" },
    },
  },
}
