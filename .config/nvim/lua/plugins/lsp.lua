return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    -- configure servers by opts, and then this gets used in config generically to do server.setup(server_opts)
    opts = {
      servers = {
        clangd = {},
        pyright = {},
        neocmake = {},
        bashls = {
          filetypes = { "zsh", "bash", "sh" },
        },
        docker_compose_language_service = {},
        dockerls = {},
        jsonls = {},
        marksman = {},
        yamlls = {},
        lua_ls = {
          -- ripped from the docs
          on_init = function(client)
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
          end,
          settings = {
            Lua = {},
          },
        },
      },
    },
    -- splitting off server config in opts to do the blink.cmp capabilities stuff here
    config = function(_, opts)
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers),
      })

      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      -- extend this later where needed
      ensure_installed = {},
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
