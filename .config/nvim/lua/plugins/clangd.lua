local function find_root_dir_for_clangd(fname)
  return require("lspconfig.util").root_pattern(
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "Makefile"
  )(fname) or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--background-index-priority=low",
          "--clang-tidy",
          "--completion-style=detailed",
          "--fallback-style=llvm",
          "--function-arg-placeholders", -- TODO: figure out how to actually use the placeholders
          "--header-insertion=never",
          "--header-insertion-decorators",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        root_dir = find_root_dir_for_clangd,
        single_file_support = true,
        capabilities = {
          offsetEncoding = { "utf-16" }, -- default supports utf-8 as well but we dont need it
        },
      }
      return opts
    end,
    keys = {
      { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
    },
  },
  {
    -- for switch source and header
    "p00f/clangd_extensions.nvim",
    lazy = false,
    opts = {},
  },
}
