-- lsp format setup first
local lsp_format = require "lsp-format"
lsp_format.setup()
local on_attach = function(client)
  lsp_format.on_attach(client)
end

-- null ls setup
local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local sources = {
  -- Lua
  formatting.stylua,
  completion.luasnip,
  -- cpp
  formatting.clang_format,
  diagnostics.cmake_lint,
  -- make
  diagnostics.checkmake,
  -- latex
  diagnostics.chktex,
  -- python
  formatting.black,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- format on save
  on_attach = on_attach,
}
