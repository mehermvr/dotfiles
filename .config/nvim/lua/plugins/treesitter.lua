return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- dupes get handled
      vim.list_extend(opts.ensure_installed, {
        "vim",
        "regex",
        "lua",
        "bash",
        "markdown",
        "markdown_inline",
      })
    end,
  },
}
