return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    keys = {
      { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto Definition" },
      { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Goto Declaration" },
      { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Goto Implementation" },
      { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
      { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Documentation" },
      { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Actions" },
    },
    -- configure servers by opts, and then this gets used in config generically to do server.setup(server_opts)
    opts = {
      servers = {
        -- see clangd.lua for clangd, and lua_ls.lua for lua_ls since they're a bit more complicated
        pyright = {},
        neocmake = {},
        bashls = {
          filetypes = { "zsh", "bash", "sh" },
        },
        docker_compose_language_service = {},
        dockerls = {},
        jsonls = {},
        marksman = {},
        texlab = {},
        yamlls = {},
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
