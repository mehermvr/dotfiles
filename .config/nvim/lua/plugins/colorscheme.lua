return {
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true,
      transparent = false,
      dimInactive = true,
      terminalColors = true,
      commentStyle = { italic = true },
      functionStyle = { italic = false },
      keywordStyle = { italic = true, bold = false },
      statementStyle = { italic = false, bold = true },
      typeStyle = { italic = false },
    },
    config = function(_, opts)
      -- first parameter is the spec aparently, and aparently that means the entire plugin spec here maybe? idk. this pattern should work
      require("kanagawa-paper").setup(opts)
      vim.cmd([[colorscheme kanagawa-paper]])
    end,
  },
}
