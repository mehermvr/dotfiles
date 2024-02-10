return {
  { import = "lazyvim.plugins.extras.dap.core" },
  -- lazyvim handles installing nvim-dap, nvim-dap-python and mason-nvim-dap. now thats a lot.
  -- mason-nvim-dap handles installing adapters that have been registered as daps, which for python is handled by nvim-dap-python.
  -- for cpp, codelldb is registered as a dap in clangd extras, but that also handles extending mason ensure_installed directly with codelldb.
  -- and then the clangd file sets up a default configuration which launches codelldb
  -- with an executabe whose path it asks. this is the "Launch file" config. note that
  -- this has to be compiled with debug flags, so set CMAKE_BUILD_TYPE Debug or
  -- RelWithDebInfo
}
