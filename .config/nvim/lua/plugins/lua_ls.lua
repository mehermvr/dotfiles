local function lua_ls_on_init_func(client)
  if client.workspace_folders then
    local path = client.workspace_folders[1].name
    if
      path ~= vim.fn.stdpath("config")
      and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
    then
      return
    end
  end
  client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
    runtime = {
      version = "LuaJIT",
    },
    workspace = {
      checkThirdParty = false,
      library = {
        vim.env.VIMRUNTIME,
      },
    },
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.lua_ls = {
        -- ripped from the docs
        on_init = lua_ls_on_init_func,
        settings = {
          Lua = {},
        },
      }
      return opts
    end,
  },
}
