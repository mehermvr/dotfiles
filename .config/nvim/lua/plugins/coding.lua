return {
  {
    -- Formatting
    -- TODO: add a toggle for disabling formatting on current buffer
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>c",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
      {
        "<leader>oc",
        "<cmd>ToggleFormat!<cr>",
        desc = "Toggle buffer format (c) on-save",
      },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        sh = { "shfmt" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        cmake = { "cmake_format" },
        -- TODO: add something for makefiles
        yaml = { "yamlfmt" },
      },
      format_on_save = function(bufnr)
        -- making format on save toggle-able
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
        clang_format = {
          prepend_args = { "--style=file" },
        },
        black = {
          prepend_args = { "--line-length", "88" },
        },
        isort = {
          prepend_args = { "--profile", "black" },
        },
      },
    },
  },
  {
    -- Completion
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    event = "InsertEnter",
    -- use a release tag to download pre-built binaries
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      keymap = { preset = "enter" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "isort",
        "black",
        "shfmt",
        "clang-format",
        "cmakelang",
        "yamlfmt",
      },
    },
  },
}
