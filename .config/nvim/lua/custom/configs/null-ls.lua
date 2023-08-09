-- lsp format setup first
local lsp_format = require "lsp-format"
lsp_format.setup()

-- null ls setup
local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- checkhealth is your friend
local sources = {
  -- Lua
  formatting.stylua,
  completion.luasnip,
  -- cpp
  formatting.clang_format,
  diagnostics.cmake_lint,
  -- make
  -- diagnostics.checkmake,
  -- latex
  -- diagnostics.chktex,
  formatting.latexindent,
  -- python
  formatting.black,
  -- misc
  -- formatting.deno_fmt,
  formatting.prettierd.with {
    filetypes = { "html", "markdown", "css", "json", "jsonc", "yaml" },
    extra_filetypes = { "toml" },
    env = {
      PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/nvim/lua/custom/configs/utils/.prettierrc.json",
    },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- format on save
  on_attach = lsp_format.on_attach,
}
